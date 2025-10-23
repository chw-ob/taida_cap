#v1 搭建了双层寻优框架
#v2 修改评估函数为基于torch的并行运算，大幅提升计算效率
#v3 调整reward结构；增加结果细节展示和各阶段时间统计
#v4 根据各功能块的运算评估发现瓶颈在动作推理环节，因此修改动作推理为也基于torch的并行运算，大幅提升计算效率
import os
import time
import numpy as np
import torch
import argparse
import matplotlib.pyplot as plt
import matplotlib
matplotlib.rcParams['font.sans-serif'] = ['SimHei', 'DejaVu Sans']  # 用来正常显示中文标签
matplotlib.rcParams['axes.unicode_minus'] = False  # 用来正常显示负号

from TD3 import TD3
from dab_loss_torch import (
	calculate_power_and_currents_torch_fast,
	iL_single_batch_dynamic_torch_fast,
	create_time_samples_torch_fast,
	pmax_value_torch,
	flc_error_torch,
	calculate_losses_torch_fast,
)


class ReplayBuffer(object):
	def __init__(self, state_dim, action_dim, max_size=int(1e6), dtype=np.float64):
		self.max_size = max_size
		self.ptr = 0
		self.size = 0
		self.state = np.zeros((max_size, state_dim), dtype=dtype)
		self.action = np.zeros((max_size, action_dim), dtype=dtype)
		self.next_state = np.zeros((max_size, state_dim), dtype=dtype)
		self.reward = np.zeros((max_size, 1), dtype=dtype)
		self.not_done = np.zeros((max_size, 1), dtype=dtype)
		self.device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

	def add(self, state, action, next_state, reward, done):
		self.state[self.ptr] = state
		self.action[self.ptr] = action
		self.next_state[self.ptr] = next_state
		self.reward[self.ptr] = reward
		self.not_done[self.ptr] = 1.0 - float(done)
		self.ptr = (self.ptr + 1) % self.max_size
		self.size = min(self.size + 1, self.max_size)
	
	def add_batch(self, states, actions, next_states, rewards, dones):
		"""
		批量添加经验到Buffer，提高效率
		Args:
			states: np.array, shape (batch_size, state_dim)
			actions: np.array, shape (batch_size, action_dim)
			next_states: np.array, shape (batch_size, state_dim)
			rewards: np.array, shape (batch_size,)
			dones: np.array, shape (batch_size,), bool类型
		"""
		batch_size = len(states)
		if batch_size == 0:
			return
		
		# 计算要添加的索引范围
		end_ptr = (self.ptr + batch_size) % self.max_size
		
		if end_ptr > self.ptr:
			# 没有环绕，直接添加
			self.state[self.ptr:end_ptr] = states
			self.action[self.ptr:end_ptr] = actions
			self.next_state[self.ptr:end_ptr] = next_states
			self.reward[self.ptr:end_ptr, 0] = rewards
			self.not_done[self.ptr:end_ptr, 0] = 1.0 - dones.astype(float)
		else:
			# 需要环绕，分两部分添加
			first_part = self.max_size - self.ptr
			second_part = batch_size - first_part
			
			# 第一部分
			self.state[self.ptr:] = states[:first_part]
			self.action[self.ptr:] = actions[:first_part]
			self.next_state[self.ptr:] = next_states[:first_part]
			self.reward[self.ptr:, 0] = rewards[:first_part]
			self.not_done[self.ptr:, 0] = 1.0 - dones[:first_part].astype(float)
			
			# 第二部分
			self.state[:second_part] = states[first_part:]
			self.action[:second_part] = actions[first_part:]
			self.next_state[:second_part] = next_states[first_part:]
			self.reward[:second_part, 0] = rewards[first_part:]
			self.not_done[:second_part, 0] = 1.0 - dones[first_part:].astype(float)
		
		# 更新指针和大小
		self.ptr = end_ptr
		self.size = min(self.size + batch_size, self.max_size)

	def sample(self, batch_size):
		ind = np.random.randint(0, self.size, size=batch_size)
		return (
			torch.FloatTensor(self.state[ind]).to(self.device),
			torch.FloatTensor(self.action[ind]).to(self.device),
			torch.FloatTensor(self.next_state[ind]).to(self.device),
			torch.FloatTensor(self.reward[ind]).to(self.device),
			torch.FloatTensor(self.not_done[ind]).to(self.device)
		)


class DABEnv:
	"""
	基于numpy/矢量化的DAB评估骨架（可配置工况数）。
	- 硬件动作 h = [L_norm, C_norm, Np_norm, Ns_norm] ∈ [-1,1]^4
	- 软件动作 s = [alpha, beta, fs_norm] ∈ [-1,1]^3（每工况一组）
	- 奖励：多工况平均效率（可加惩罚）
	"""
	def __init__(self, seed=0, num_conditions=10, max_batch_size=1000, dtype=np.float64):
		rng = np.random.RandomState(seed)
		self.max_action = 1.0
		# 数据精度
		self.dtype = dtype
		# 设备（一次性创建，避免重复）
		self.device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
		# PyTorch 数据类型（一次性映射）
		self.torch_dtype = torch.float64 if dtype == np.float64 else torch.float32
		# 缓存常用张量，避免重复创建
		self._tensor_cache = {}
		# 预分配常用张量，避免重复分配
		self._preallocated_tensors = self._init_preallocated_tensors(max_batch_size=max_batch_size)
		# 工况（默认：在420~850之间均匀采样 num_conditions 个电压点）
		self.NUM_COND = int(max(1, num_conditions))
		self.VP = np.full(self.NUM_COND, 400.0, dtype=self.dtype)
		self.VS = np.linspace(420.0, 850.0, self.NUM_COND, dtype=self.dtype)
		# 目标功率：简化为常量（可后续扩展为分段）
		self.PT = np.full(self.NUM_COND, 6000.0, dtype=self.dtype)
		
		# 工况数据归一化边界
		self.VP_MIN, self.VP_MAX = 350.0, 450.0  # 原边电压范围
		self.VS_MIN, self.VS_MAX = 400.0, 900.0  # 副边电压范围
		self.PT_MIN, self.PT_MAX = 5000.0, 7000.0  # 目标功率范围
		# 归一化边界（硬件）
		self.L_MIN, self.L_MAX = 20e-6, 50e-6
		self.C_MIN, self.C_MAX = 100e-9, 250e-9
		self.N_MIN, self.N_MAX = 1.0, 50.0
		self.FS_MAX = 150e3
		self.k_p = 1.1
		# 软件参数范围（固定）
		self.ALPHA_MIN, self.ALPHA_MAX = -0.25, 0.75
		self.BETA_MIN, self.BETA_MAX = 0.0, 0.5
		self.FSN_MIN, self.FSN_MAX = -1.0, 1.0
		# 维度
		self.hardware_action_dim = 4  # [L_norm, C_norm, Np_norm, Ns_norm]
		self.software_action_dim = 3
		self.software_obs_dim = self.hardware_action_dim + 3  # + (VP,VS,PT)
		self.state_dim = self.hardware_action_dim
		self.state = np.ones(self.state_dim, dtype=self.dtype)

	def reset(self):
		self.state = np.ones(self.state_dim, dtype=self.dtype)
		return self.state.copy()

	def _denorm_h(self, h):
		L = self.L_MIN + (h[0] + 1.0) * 0.5 * (self.L_MAX - self.L_MIN)
		C = self.C_MIN + (h[1] + 1.0) * 0.5 * (self.C_MAX - self.C_MIN)
		Np = self.N_MIN + (h[2] + 1.0) * 0.5 * (self.N_MAX - self.N_MIN)
		Ns = self.N_MIN + (h[3] + 1.0) * 0.5 * (self.N_MAX - self.N_MIN)
		return L, C, Np, Ns

	def _denorm_s(self, s):
		alpha = self.ALPHA_MIN + (s[0] + 1.0) * 0.5 * (self.ALPHA_MAX - self.ALPHA_MIN)
		beta = self.BETA_MIN + (s[1] + 1.0) * 0.5 * (self.BETA_MAX - self.BETA_MIN)
		fs_norm = np.clip(s[2], self.FSN_MIN, self.FSN_MAX)
		return alpha, beta, fs_norm
	
	def norm_fs(self, fs, L, C, k_p=1.1, fs_max=150e3):
		"""
		根据 DAB 归一化公式，将实际开关频率 fs 归一化为 [-1, 1] 区间。
		归一化公式：
		    1. 先将 [-1, 1] 归一化到 [0, 1]：fs_norm_01 = (fs_norm + 1) / 2
		    2. fs = (f_lc * k_p) + fs_norm_01 * (fs_max - (f_lc * k_p))
		推导得：
		    fs_norm_01 = (fs - (f_lc * k_p)) / (fs_max - (f_lc * k_p))
		    fs_norm = fs_norm_01 * 2 - 1
		其中 f_lc = 1 / (2 * pi * sqrt(L * C))
		参数:
		    fs: 实际开关频率（可为标量或数组）
		    L: 电感值（单位：H）
		    C: 电容值（单位：F）
		    k_p: 系数，默认为 1.1
		    fs_max: 最大开关频率，默认为 150kHz
		返回:
		    归一化后的 fs_norm（范围为 [-1, 1]）
		"""
		f_lc = 1.0 / (2.0 * np.pi * np.sqrt(L * C))
		fs_norm_01 = (fs - (f_lc * k_p)) / (fs_max - (f_lc * k_p))
		fs_norm = fs_norm_01 * 2.0 - 1.0
		return fs_norm
	
	def norm_conditions(self, vp, vs, pt):
		"""
		将工况数据归一化到 [-1, 1] 区间
		参数:
		    vp: 原边电压
		    vs: 副边电压  
		    pt: 目标功率
		返回:
		    归一化后的工况数据 (vp_norm, vs_norm, pt_norm)
		"""
		vp_norm = 2.0 * (vp - self.VP_MIN) / (self.VP_MAX - self.VP_MIN) - 1.0
		vs_norm = 2.0 * (vs - self.VS_MIN) / (self.VS_MAX - self.VS_MIN) - 1.0
		pt_norm = 2.0 * (pt - self.PT_MIN) / (self.PT_MAX - self.PT_MIN) - 1.0
		return vp_norm, vs_norm, pt_norm
	
	def denorm_conditions(self, vp_norm, vs_norm, pt_norm):
		"""
		将归一化的工况数据反归一化到实际值
		参数:
		    vp_norm: 归一化的原边电压
		    vs_norm: 归一化的副边电压
		    pt_norm: 归一化的目标功率
		返回:
			反归一化后的工况数据 (vp, vs, pt)
		"""
		vp = self.VP_MIN + (vp_norm + 1.0) * 0.5 * (self.VP_MAX - self.VP_MIN)
		vs = self.VS_MIN + (vs_norm + 1.0) * 0.5 * (self.VS_MAX - self.VS_MIN)
		pt = self.PT_MIN + (pt_norm + 1.0) * 0.5 * (self.PT_MAX - self.PT_MIN)
		return vp, vs, pt

	def _init_preallocated_tensors(self, max_batch_size=1000):
		"""初始化预分配张量，避免运行时重复分配"""
		return {
			'penalty': torch.full((max_batch_size,), -50.0, dtype=self.torch_dtype, device=self.device),
			'zeros': torch.zeros((max_batch_size,), dtype=self.torch_dtype, device=self.device),
			'ones': torch.ones((max_batch_size,), dtype=self.torch_dtype, device=self.device),
			'const_1e5': torch.full((max_batch_size,), 1e5, dtype=self.torch_dtype, device=self.device),
			'const_1e_5': torch.full((max_batch_size,), 1e-5, dtype=self.torch_dtype, device=self.device),
			# 添加常用形状的预分配张量
			'input_stack': torch.empty((max_batch_size, 6), dtype=self.torch_dtype, device=self.device),
			'result_stack': torch.empty((max_batch_size, 5), dtype=self.torch_dtype, device=self.device),
		}

	def _to_tensor_optimized(self, data, cache_key=None):
		"""优化的 tensor 创建方法，支持缓存"""
		if cache_key and cache_key in self._tensor_cache:
			return self._tensor_cache[cache_key]
		
		tensor = torch.as_tensor(data, dtype=self.torch_dtype, device=self.device)
		
		if cache_key:
			self._tensor_cache[cache_key] = tensor
		
		return tensor

	def _batch_to_tensors(self, alpha_vec, beta_vec, fsn_vec, vp_vec, vs_vec, pt_vec):
		"""批量创建输入张量，减少单独创建的开销"""
		batch_size = len(alpha_vec)
		
		# 使用预分配的张量，避免重复分配
		if batch_size <= self._preallocated_tensors['input_stack'].shape[0]:
			input_tensor = self._preallocated_tensors['input_stack'][:batch_size]
			# 将数据复制到预分配的张量中
			input_tensor[:, 0] = torch.as_tensor(alpha_vec, dtype=self.torch_dtype, device=self.device)
			input_tensor[:, 1] = torch.as_tensor(beta_vec, dtype=self.torch_dtype, device=self.device)
			input_tensor[:, 2] = torch.as_tensor(fsn_vec, dtype=self.torch_dtype, device=self.device)
			input_tensor[:, 3] = torch.as_tensor(vp_vec, dtype=self.torch_dtype, device=self.device)
			input_tensor[:, 4] = torch.as_tensor(vs_vec, dtype=self.torch_dtype, device=self.device)
			input_tensor[:, 5] = torch.as_tensor(pt_vec, dtype=self.torch_dtype, device=self.device)
		else:
			# 如果批次太大，回退到标准方法
			input_data = np.stack([alpha_vec, beta_vec, fsn_vec, vp_vec, vs_vec, pt_vec], axis=1)
			input_tensor = torch.as_tensor(input_data, dtype=self.torch_dtype, device=self.device)
		
		# 分离各个张量
		alpha_t, beta_t, fsn_t, vp_t, vs_t, pt_t = input_tensor.T
		return alpha_t, beta_t, fsn_t, vp_t, vs_t, pt_t


	def build_sw_obs(self, hw_action, cond_idx):
		vp, vs, pt = self.VP[cond_idx], self.VS[cond_idx], self.PT[cond_idx]
		# 归一化工况数据到 [-1, 1] 区间
		vp_norm, vs_norm, pt_norm = self.norm_conditions(vp, vs, pt)
		return np.concatenate([hw_action.astype(self.dtype), np.array([vp_norm, vs_norm, pt_norm], dtype=self.dtype)], axis=-1)

	def step_hardware(self, hw_action):
		next_state = np.asarray(hw_action, dtype=self.dtype).copy()
		done = True
		return next_state, 0.0, done, {}

	def _vectorized_eval(self, L, C, Np, Ns, alpha_vec, beta_vec, fsn_vec, vp_vec, vs_vec, pt_vec):
		# 基于 torch 的评估实现（统一精度，掩码优化，批量创建）
		# 使用预定义的设备和数据类型，避免重复创建
		device = self.device
		torch_dtype = self.torch_dtype
		
		
		# 批量创建输入张量，减少单独创建的开销
		alpha_t, beta_t, fsn_t, vp_t, vs_t, pt_t = self._batch_to_tensors(
			alpha_vec, beta_vec, fsn_vec, vp_vec, vs_vec, pt_vec
		)
		
		L_val = float(L); C_val = float(C); Np_val = float(Np); Ns_val = float(Ns)
		n_val = Ns_val / max(Np_val, 1e-12)
		n_t = torch.tensor(n_val, dtype=torch_dtype, device=device)
		# 约束检查（张量化，不触发同步）
		vs_primary_t = vs_t / torch.clamp(n_t, min=1e-12)
		vs_for_pmax = torch.minimum(vs_primary_t, torch.full_like(vs_primary_t, 420.0 / max(n_val, 1e-12)))
		pmax_val_t = pmax_value_torch(C_val, vp_t, vs_for_pmax, L_val, k_p=self.k_p, device=device)
		flc_err_t = flc_error_torch(L_val, C_val, f_min=50e3, f_max=80e3, f_base=65e3, device=device)
		violated = (pmax_val_t > 1e-6) | (flc_err_t > 1e-6)
		
		# 若全部违反，直接返回惩罚（避免后续重计算）
		if torch.all(violated):
			batch_size = alpha_t.shape[0]
			pen_np = self._preallocated_tensors['penalty'][:batch_size].detach().cpu().numpy().astype(self.dtype)
			zeros_np = self._preallocated_tensors['zeros'][:batch_size].detach().cpu().numpy().astype(self.dtype)
			return pen_np, {'eff': pen_np, 'fs': zeros_np, 'i_rms': zeros_np, 'Po': zeros_np, 'p_loss': zeros_np, 'n': n_val}
		
		# 仅对有效样本计算主路径
		valid_idx = torch.where(~violated)[0]
		with torch.no_grad():
			fsn01_t = (fsn_t + 1.0) * 0.5
			dtype_t = alpha_t.dtype
			alpha_v = alpha_t.index_select(0, valid_idx)
			beta_v = beta_t.index_select(0, valid_idx)
			fsn01_v = fsn01_t.index_select(0, valid_idx)
			vp_v = vp_t.index_select(0, valid_idx)
			vs_primary_v = vs_primary_t.index_select(0, valid_idx)
			pt_v = pt_t.index_select(0, valid_idx)
			
			Po_v, i_L0_v, i_L1_v, i_L2_v, fs_v, Ts_v, case, ipk_v, f_lc_v = calculate_power_and_currents_torch_fast(
				alpha_v, beta_v, fsn01_v, vp_v, vs_primary_v, L_val, C_val, k_p=self.k_p, fs_max=self.FS_MAX, device=device
			)
			# 统一 dtype
			Po_v = Po_v.to(dtype_t)
			fs_v = fs_v.to(dtype_t)
			Ts_v = Ts_v.to(dtype_t)
			ipk_v = ipk_v.to(dtype_t)
			f_lc_v = f_lc_v.to(dtype_t)
			
			# 采样 RMS
			t_samples_v = create_time_samples_torch_fast(Ts_v, num_points=256, device=device)
			iL_samples_v = iL_single_batch_dynamic_torch_fast(t_samples_v, alpha_v, beta_v, Ts_v, vp_v, vs_primary_v, L_val, C_val, device=device)
			i_rms_v = torch.sqrt(torch.mean(iL_samples_v ** 2, dim=1)).to(dtype_t)
			
			# 器件参数
			rdson_pri_v = torch.full_like(Po_v, 40e-3)
			rdson_sec_v = torch.full_like(Po_v, 40e-3)
			tcross_pri_v = torch.full_like(Po_v, 25e-9)
			tcross_sec_v = torch.full_like(Po_v, 25e-9)
			
			# 损耗
			P_loss_v, _, _, _, _, _, _, _, _, _ = calculate_losses_torch_fast(
				alpha_v, beta_v, Po_v, i_L0_v, i_L1_v, i_L2_v, i_rms_v, fs_v, ipk_v,
				vp_v, vs_primary_v, rdson_pri_v, rdson_sec_v, tcross_pri_v, tcross_sec_v,
				n_t, Ns_val, 79.0, 16.063, 1.853e-4, f_lc_v, L_val, device=device
			)
			P_loss_v = P_loss_v.to(dtype_t)
			
			# 奖励
			Po_dev_v = - torch.abs(Po_v - pt_v) / torch.clamp(pt_v, min=1e-12)
			eff_v = torch.clamp(1.0 - P_loss_v / torch.clamp(Po_v, min=1e-12), 0.0, 1.0)
			eff_eff_v = (10 * eff_v + 10 * Po_dev_v).to(dtype_t)
		
		# 汇总到完整 batch（使用预分配张量）
		batch_size = alpha_t.shape[0]
		eff_eff_t = self._preallocated_tensors['penalty'][:batch_size].clone()
		eff_t = self._preallocated_tensors['penalty'][:batch_size].clone()
		fs_t = self._preallocated_tensors['zeros'][:batch_size].clone()
		i_rms_t = self._preallocated_tensors['zeros'][:batch_size].clone()
		Po_t = self._preallocated_tensors['zeros'][:batch_size].clone()
		P_loss_t = self._preallocated_tensors['zeros'][:batch_size].clone()
		
		eff_eff_t.index_copy_(0, valid_idx, eff_eff_v)
		eff_t.index_copy_(0, valid_idx, eff_v)
		fs_t.index_copy_(0, valid_idx, fs_v)
		i_rms_t.index_copy_(0, valid_idx, i_rms_v)
		Po_t.index_copy_(0, valid_idx, Po_v)
		P_loss_t.index_copy_(0, valid_idx, P_loss_v)
		
		# 转为 numpy 输出（使用环境统一的精度）
		eff_np = eff_eff_t.detach().cpu().numpy().astype(self.dtype)
		# print('eff_eff', eff_np)
		# print('eff', eff_t.detach().cpu().numpy().astype(self.dtype))
		# print('i_rms', i_rms_t.detach().cpu().numpy().astype(self.dtype))
		# print('Po', Po_t.detach().cpu().numpy().astype(self.dtype))
		# print('p_loss', P_loss_t.detach().cpu().numpy().astype(self.dtype))
		# print('n', n_val)
		# print(i_L0_v)
		# print(alpha_v, beta_v, fsn_t, case)
		# print(alpha_vec, beta_vec, fsn_vec)
		return eff_np, {
			'eff_eff': eff_np,
			'eff': eff_t.detach().cpu().numpy().astype(self.dtype),
			'fs': fs_t.detach().cpu().numpy().astype(self.dtype),
			'i_rms': i_rms_t.detach().cpu().numpy().astype(self.dtype),
			'Po': Po_t.detach().cpu().numpy().astype(self.dtype),
			'p_loss': P_loss_t.detach().cpu().numpy().astype(self.dtype),
			'n': n_val
		}

	def step_software_cond(self, sw_action, hw_action, cond_idx):
		L, C, Np, Ns = self._denorm_h(hw_action)
		alpha, beta, fsn = self._denorm_s(sw_action)
		eff_vec, info = self._vectorized_eval(
			L, C, Np, Ns,
			np.array([alpha], dtype=self.dtype), np.array([beta], dtype=self.dtype), np.array([fsn], dtype=self.dtype),
			np.array([self.VP[cond_idx]], dtype=self.dtype), np.array([self.VS[cond_idx]], dtype=self.dtype), np.array([self.PT[cond_idx]], dtype=self.dtype)
		)
		reward = float(eff_vec[0])
		next_obs = self.build_sw_obs(hw_action, cond_idx)
		done = True
		# if(reward > 0.99):
		# 	print(reward, info['Po'], info['p_loss'])
		# print(reward, info['Po'], info['p_loss'])
		return next_obs, reward, done, info

	def _vectorized_eval_torch(self, L, C, Np, Ns, alpha_vec, beta_vec, fsn_vec, vp_vec, vs_vec, pt_vec):
		"""
		完全基于torch的批量评估，避免numpy转换
		"""
		device = self.device
		torch_dtype = self.torch_dtype
		
		
		L_val = float(L); C_val = float(C); Np_val = float(Np); Ns_val = float(Ns)
		n_val = Ns_val / max(Np_val, 1e-12)
		n_t = torch.tensor(n_val, dtype=torch_dtype, device=device)
		
		# 约束检查（张量化，不触发同步）
		vs_primary_t = vs_vec / torch.clamp(n_t, min=1e-12)
		vs_for_pmax = torch.minimum(vs_primary_t, torch.full_like(vs_primary_t, 420.0 / max(n_val, 1e-12)))
		pmax_val_t = pmax_value_torch(C_val, vp_vec, vs_for_pmax, L_val, k_p=self.k_p, device=device)
		flc_err_t = flc_error_torch(L_val, C_val, f_min=50e3, f_max=80e3, f_base=65e3, device=device)
		violated = (pmax_val_t > 1e-6) | (flc_err_t > 1e-6)
		
		# 若全部违反，直接返回惩罚
		if torch.all(violated):
			batch_size = alpha_vec.shape[0]
			pen_np = self._preallocated_tensors['penalty'][:batch_size]
			zeros_np = self._preallocated_tensors['zeros'][:batch_size]
			return pen_np, {'eff': pen_np, 'fs': zeros_np, 'i_rms': zeros_np, 'Po': zeros_np, 'p_loss': zeros_np, 'n': n_val}
		
		# 仅对有效样本计算主路径
		valid_idx = torch.where(~violated)[0]
		with torch.no_grad():
			fsn01_t = (fsn_vec + 1.0) * 0.5
			dtype_t = alpha_vec.dtype
			alpha_v = alpha_vec.index_select(0, valid_idx)
			beta_v = beta_vec.index_select(0, valid_idx)
			fsn01_v = fsn01_t.index_select(0, valid_idx)
			vp_v = vp_vec.index_select(0, valid_idx)
			vs_primary_v = vs_primary_t.index_select(0, valid_idx)
			pt_v = pt_vec.index_select(0, valid_idx)
			
			Po_v, i_L0_v, i_L1_v, i_L2_v, fs_v, Ts_v, _, ipk_v, f_lc_v = calculate_power_and_currents_torch_fast(
				alpha_v, beta_v, fsn01_v, vp_v, vs_primary_v, L_val, C_val, k_p=self.k_p, fs_max=self.FS_MAX, device=device
			)
			# 统一 dtype
			Po_v = Po_v.to(dtype_t)
			fs_v = fs_v.to(dtype_t)
			Ts_v = Ts_v.to(dtype_t)
			ipk_v = ipk_v.to(dtype_t)
			f_lc_v = f_lc_v.to(dtype_t)
			
			# 采样 RMS
			t_samples_v = create_time_samples_torch_fast(Ts_v, num_points=256, device=device)
			iL_samples_v = iL_single_batch_dynamic_torch_fast(t_samples_v, alpha_v, beta_v, Ts_v, vp_v, vs_primary_v, L_val, C_val, device=device)
			i_rms_v = torch.sqrt(torch.mean(iL_samples_v ** 2, dim=1)).to(dtype_t)
			
			# 器件参数
			rdson_pri_v = torch.full_like(Po_v, 40e-3)
			rdson_sec_v = torch.full_like(Po_v, 40e-3)
			tcross_pri_v = torch.full_like(Po_v, 25e-9)
			tcross_sec_v = torch.full_like(Po_v, 25e-9)
			
			# 损耗
			P_loss_v, _, _, _, _, _, _, _, _, _ = calculate_losses_torch_fast(
				alpha_v, beta_v, Po_v, i_L0_v, i_L1_v, i_L2_v, i_rms_v, fs_v, ipk_v,
				vp_v, vs_primary_v, rdson_pri_v, rdson_sec_v, tcross_pri_v, tcross_sec_v,
				n_t, Ns_val, 79.0, 16.063, 1.853e-4, f_lc_v, L_val, device=device
			)
			P_loss_v = P_loss_v.to(dtype_t)
			
			# 奖励
			Po_dev_v = - torch.abs(Po_v - pt_v) / torch.clamp(pt_v, min=1e-12)
			eff_v = torch.clamp(1.0 - P_loss_v / torch.clamp(Po_v, min=1e-12), 0.0, 1.0)
			eff_eff_v = (10 * eff_v + 10 * Po_dev_v).to(dtype_t)
		
		# 汇总到完整 batch
		batch_size = alpha_vec.shape[0]
		eff_eff_t = self._preallocated_tensors['penalty'][:batch_size].clone()
		eff_t = self._preallocated_tensors['penalty'][:batch_size].clone()
		fs_t = self._preallocated_tensors['zeros'][:batch_size].clone()
		i_rms_t = self._preallocated_tensors['zeros'][:batch_size].clone()
		Po_t = self._preallocated_tensors['zeros'][:batch_size].clone()
		P_loss_t = self._preallocated_tensors['zeros'][:batch_size].clone()
		
		eff_eff_t.index_copy_(0, valid_idx, eff_eff_v)
		eff_t.index_copy_(0, valid_idx, eff_v)
		fs_t.index_copy_(0, valid_idx, fs_v)
		i_rms_t.index_copy_(0, valid_idx, i_rms_v)
		Po_t.index_copy_(0, valid_idx, Po_v)
		P_loss_t.index_copy_(0, valid_idx, P_loss_v)
		
		return eff_eff_t, {
			'eff_eff': eff_eff_t,
			'eff': eff_t,
			'fs': fs_t,
			'i_rms': i_rms_t,
			'Po': Po_t,
			'p_loss': P_loss_t,
			'n': n_val
		}

	def _batch_evaluate_software(self, sw_actions_batch, hw_action, cond_indices):
		"""批量评估软件动作，返回奖励数组"""
		L, C, Np, Ns = self._denorm_h(hw_action)
		
		# 准备批量数据
		alpha_vec = []
		beta_vec = []
		fsn_vec = []
		vp_vec = []
		vs_vec = []
		pt_vec = []
		
		for i, (sw_act, ci) in enumerate(zip(sw_actions_batch, cond_indices)):
			alpha, beta, fsn = self._denorm_s(sw_act)
			alpha_vec.append(alpha)
			beta_vec.append(beta)
			fsn_vec.append(fsn)
			vp_vec.append(self.VP[ci])
			vs_vec.append(self.VS[ci])
			pt_vec.append(self.PT[ci])
		
		# 批量评估
		eff_vec, _ = self._vectorized_eval(
			L, C, Np, Ns,
			np.array(alpha_vec, dtype=self.dtype),
			np.array(beta_vec, dtype=self.dtype),
			np.array(fsn_vec, dtype=self.dtype),
			np.array(vp_vec, dtype=self.dtype),
			np.array(vs_vec, dtype=self.dtype),
			np.array(pt_vec, dtype=self.dtype)
		)
		
		return eff_vec


def train_hierarchical(seed=0,
					hardware_steps=5000,
					hardware_start_random=256,
					hardware_batch=128,
					software_batch=64,
					software_steps=4,
					log_every=100,
					noise_end_hw=0.05,
					noise_end_sw=0.05,
					lr_gamma=0.999,
					save_path='hier_td3_synthetic',
					num_conditions=5,
					max_batch_size=1000,
					dtype=np.float64):

		np.random.seed(seed)
		torch.manual_seed(seed)

		env = DABEnv(seed=seed, num_conditions=num_conditions, max_batch_size=max_batch_size, dtype=dtype)

		# 硬件智能体（外层）
		hw_policy = TD3(env.state_dim, env.hardware_action_dim, env.max_action, lr_gamma=lr_gamma)
		hw_buffer = ReplayBuffer(env.state_dim, env.hardware_action_dim, max_size=int(5e4), dtype=env.dtype)

		# 软件智能体（内层）
		sw_policy = TD3(env.software_obs_dim, env.software_action_dim, env.max_action, lr_gamma=lr_gamma)
		sw_buffer = ReplayBuffer(env.software_obs_dim, env.software_action_dim, max_size=int(5e4), dtype=env.dtype)

		def select_with_noise(policy, obs, noise_std=0.1, max_action=1.0):
			a = policy.select_action(obs)
			a = a + np.random.normal(0, noise_std, size=a.shape)
			return np.clip(a, -max_action, max_action)
		
		def select_actions_batch_torch(policy, obs_batch, noise_std=0.1):
			"""
			批量选择动作，直接在torch张量上操作
			Args:
				policy: TD3策略网络
				obs_batch: torch.Tensor, shape (batch_size, obs_dim)
				noise_std: float, 噪声标准差
			Returns:
				actions: torch.Tensor, shape (batch_size, action_dim)
			"""
			return policy.select_action_batch(obs_batch, noise_std)
		
		def batch_evaluate_software_torch(sw_actions_batch_torch, hw_action, cond_indices):
			"""
			完全基于torch的批量软件动作评估，减少numpy转换
			Args:
				sw_actions_batch_torch: torch.Tensor, shape (batch_size, action_dim)
				hw_action: np.array, 硬件动作
				cond_indices: list, 工况索引
			Returns:
				rewards: torch.Tensor, shape (batch_size,)
			"""
			# 转换硬件动作为torch张量，使用正确的数据类型
			hw_action_torch = torch.tensor(hw_action, dtype=env.torch_dtype).to(env.device)
			
			# 批量反归一化软件动作，确保数据类型一致
			alpha_vec = env.ALPHA_MIN + (sw_actions_batch_torch[:, 0] + 1.0) * 0.5 * (env.ALPHA_MAX - env.ALPHA_MIN)
			beta_vec = env.BETA_MIN + (sw_actions_batch_torch[:, 1] + 1.0) * 0.5 * (env.BETA_MAX - env.BETA_MIN)
			fsn_vec = torch.clamp(sw_actions_batch_torch[:, 2], env.FSN_MIN, env.FSN_MAX)
			
			# 确保所有张量使用相同的数据类型
			alpha_vec = alpha_vec.to(env.torch_dtype)
			beta_vec = beta_vec.to(env.torch_dtype)
			fsn_vec = fsn_vec.to(env.torch_dtype)
			
			# 批量反归一化硬件动作
			L = env.L_MIN + (hw_action_torch[0] + 1.0) * 0.5 * (env.L_MAX - env.L_MIN)
			C = env.C_MIN + (hw_action_torch[1] + 1.0) * 0.5 * (env.C_MAX - env.C_MIN)
			Np = env.N_MIN + (hw_action_torch[2] + 1.0) * 0.5 * (env.N_MAX - env.N_MIN)
			Ns = env.N_MIN + (hw_action_torch[3] + 1.0) * 0.5 * (env.N_MAX - env.N_MIN)
			
			# 准备工况数据，使用正确的数据类型（直接使用原始工况数据）
			vp_vec = torch.tensor([env.VP[ci] for ci in cond_indices], dtype=env.torch_dtype).to(env.device)
			vs_vec = torch.tensor([env.VS[ci] for ci in cond_indices], dtype=env.torch_dtype).to(env.device)
			pt_vec = torch.tensor([env.PT[ci] for ci in cond_indices], dtype=env.torch_dtype).to(env.device)
			
			# 调用torch版本的批量评估
			eff_vec, _ = env._vectorized_eval_torch(
				L.item(), C.item(), Np.item(), Ns.item(),
				alpha_vec, beta_vec, fsn_vec, vp_vec, vs_vec, pt_vec
			)
			
			# 返回torch张量，保持GPU计算
			return eff_vec

		state = env.reset()
		best_hw_reward = -1e9
		best_hw_action = None
		best_sw_reward = -1e9
		start_time = time.time()

		# 指数衰减噪声日程（起点固定为1.0，终点由参数指定）
		noise_start = 1.0
		gamma_hw = (noise_end_hw / max(noise_start, 1e-8)) ** (1.0 / max(hardware_steps - 1, 1))
		gamma_sw = (noise_end_sw / max(noise_start, 1e-8)) ** (1.0 / max(hardware_steps - 1, 1))

		# 历史记录
		hw_reward_history = []
		best_hw_reward_history = []
		best_sw_reward_history = []
		
		# 训练过程中的最优结果跟踪
		best_training_results = {
			'best_hw_reward': -1e9,
			'best_hw_action': None,
			'best_sw_reward': -1e9,
			'best_sw_action': None,
			'best_step': 0,
			'best_hw_info': None,
			'best_sw_info': None
		}

		# 外层预采样（使用优化后的批量推理框架）
		for _ in range(hardware_start_random):
			# 随机硬件动作
			hw_act = np.random.uniform(-1, 1, size=env.hardware_action_dim).astype(env.dtype)
			next_state, _, done, _ = env.step_hardware(hw_act)
			
			# 使用优化后的批量推理框架
			# 准备批量观测数据
			sw_obs_list = []
			cond_indices = []
			for ci in range(env.NUM_COND):
				sw_obs = env.build_sw_obs(hw_act, ci)
				for _ in range(software_steps):
					sw_obs_list.append(sw_obs)
					cond_indices.append(ci)
			
			# 批量生成随机软件动作（torch张量）
			sw_actions_batch_torch = torch.rand(env.NUM_COND * software_steps, env.software_action_dim, 
												dtype=env.torch_dtype, device=env.device) * 2.0 - 1.0
			
			# 批量转换为观测张量
			sw_obs_batch_torch = torch.FloatTensor(np.array(sw_obs_list)).to(env.device)
			
			# 使用优化后的批量评估
			sw_rewards_batch_torch = batch_evaluate_software_torch(sw_actions_batch_torch, hw_act, cond_indices)
			sw_rewards_batch = sw_rewards_batch_torch.detach().cpu().numpy()
			
			# 转换为numpy用于后续处理
			sw_actions_batch = sw_actions_batch_torch.cpu().numpy()
			sw_obs_batch = sw_obs_batch_torch.cpu().numpy()
			
			# 按工况分组并找到最优
			sw_best_per_cond = []
			reward_idx = 0
			for ci in range(env.NUM_COND):
				cond_rewards = sw_rewards_batch[reward_idx:reward_idx + software_steps]
				sw_best_per_cond.append(float(np.max(cond_rewards)))
				# 添加到buffer
				for step in range(software_steps):
					sw_obs = sw_obs_batch[reward_idx + step]
					sw_act = sw_actions_batch[reward_idx + step]
					reward_sw = cond_rewards[step]
					sw_buffer.add(sw_obs, sw_act, sw_obs, reward_sw, True)
				reward_idx += software_steps
			# 以工况最优软件奖励的平均值作为硬件奖励
			best_sw_under_hw = float(np.mean(sw_best_per_cond)) if len(sw_best_per_cond) > 0 else 0.0
			hw_buffer.add(state, hw_act, next_state, best_sw_under_hw, done)
			state = env.reset() if done else next_state

		# 时间统计变量
		timing_stats = {
			'action_inference': [],      # 动作推理时间
			'efficiency_evaluation': [], # 效率评估时间
			'network_training': [],      # 网络训练时间
			'result_saving': [],         # 结果保存时间
			'other_operations': []       # 其他操作时间
		}
		
		# 主循环：每次选择硬件动作后，进行若干内层（软件）优化步（批量并行）
		for t in range(1, hardware_steps + 1):
			step_start_time = time.time()
			
			# ========== 功能块1: 动作推理 ==========
			action_inference_start = time.time()
			
			# 计算当前步的硬件/软件噪声（指数衰减）
			curr_hw_noise = max(noise_end_hw, noise_start * (gamma_hw ** (t - 1)))
			curr_sw_noise = max(noise_end_sw, noise_start * (gamma_sw ** (t - 1)))

			# 硬件动作推理（单个）
			hw_action = select_with_noise(hw_policy, state, noise_std=curr_hw_noise)
			next_state, reward_hw, done_hw, _ = env.step_hardware(hw_action)

			# 软件动作批量推理优化
			# 准备批量观测数据
			sw_obs_list = []
			cond_indices = []
			for ci in range(env.NUM_COND):
				sw_obs = env.build_sw_obs(hw_action, ci)
				for _ in range(software_steps):
					sw_obs_list.append(sw_obs)
					cond_indices.append(ci)
			
			# 批量转换为torch张量
			sw_obs_batch_torch = torch.FloatTensor(np.array(sw_obs_list)).to(env.device)
			
			# 批量推理软件动作
			sw_actions_batch_torch = select_actions_batch_torch(sw_policy, sw_obs_batch_torch, noise_std=curr_sw_noise)
			
			# 转换为numpy用于后续处理
			sw_actions_batch = sw_actions_batch_torch.cpu().numpy()
			sw_obs_batch = sw_obs_batch_torch.cpu().numpy()
			
			action_inference_time = time.time() - action_inference_start
			timing_stats['action_inference'].append(action_inference_time)
			
			# ========== 功能块2: 效率评估 ==========
			efficiency_eval_start = time.time()
			
			# 使用完全基于torch的批量评估，减少转换开销
			sw_rewards_batch_torch = batch_evaluate_software_torch(sw_actions_batch_torch, hw_action, cond_indices)
			sw_rewards_batch = sw_rewards_batch_torch.cpu().numpy()
			
			efficiency_eval_time = time.time() - efficiency_eval_start
			timing_stats['efficiency_evaluation'].append(efficiency_eval_time)
			
			# ========== 功能块3: 数据处理和Buffer更新 ==========
			data_processing_start = time.time()
			
			# 优化：使用向量化操作处理所有工况
			# 将奖励重新整形为 (num_conditions, software_steps) - 避免复制
			sw_rewards_reshaped = sw_rewards_batch.reshape(env.NUM_COND, software_steps)
			
			# 向量化找到每个工况的最优奖励（避免tolist转换）
			best_cond_rewards = np.max(sw_rewards_reshaped, axis=1)
			
			# 更新全局最优（向量化，避免重复计算）
			best_cond_reward = np.max(best_cond_rewards)
			if best_cond_reward > best_sw_reward:
				best_sw_reward = best_cond_reward
			
			# 优化：批量准备Buffer数据，减少循环开销
			# 准备所有软件经验数据（避免重复复制，使用视图）
			sw_obs_all = sw_obs_batch
			sw_act_all = sw_actions_batch
			sw_rewards_all_flat = sw_rewards_batch
			sw_next_obs_all = sw_obs_batch  # 软件层next_state就是当前state
			
			# 预分配dones数组，避免重复创建
			if not hasattr(env, '_sw_dones_cache') or len(env._sw_dones_cache) != len(sw_rewards_batch):
				env._sw_dones_cache = np.ones(len(sw_rewards_batch), dtype=bool)
			sw_dones_all = env._sw_dones_cache  # 软件层总是done
			
			# 批量添加到Buffer（使用新增的批量添加功能）
			sw_buffer.add_batch(sw_obs_all, sw_act_all, sw_next_obs_all, sw_rewards_all_flat, sw_dones_all)

			# 将10个工况下的软件最优奖励的平均值作为硬件奖励
			best_sw_under_hw = float(np.mean(best_cond_rewards)) if len(best_cond_rewards) > 0 else reward_hw
			hw_buffer.add(state, hw_action, next_state, best_sw_under_hw, done_hw)
			# 记录每步硬件奖励（= 当前硬件动作下的软件最优奖励）
			hw_reward_history.append(best_sw_under_hw)
			
			data_processing_time = time.time() - data_processing_start
			timing_stats['other_operations'].append(data_processing_time)
			
			# ========== 功能块4: 网络训练 ==========
			network_training_start = time.time()
			
			# 训练
			if hw_buffer.size > hardware_batch:
				hw_policy.train(hw_buffer, batch_size=hardware_batch)
			if sw_buffer.size > software_batch:
				sw_policy.train(sw_buffer, batch_size=software_batch)
			
			network_training_time = time.time() - network_training_start
			timing_stats['network_training'].append(network_training_time)
			
			# ========== 功能块5: 结果保存和状态更新 ==========
			result_saving_start = time.time()
			
			state = env.reset() if done_hw else next_state

			# 记录最优快照（以软件层最优奖励为硬件奖励）
			if best_sw_under_hw > best_hw_reward:
				best_hw_reward = best_sw_under_hw
				best_hw_action = hw_action.copy()
				best_avg_sw = float(np.mean(best_cond_rewards)) if len(best_cond_rewards) > 0 else 0.0
				best_target = None
				
				# 找到每个工况的最优软件动作
				best_sw_actions = []
				reward_idx = 0
				for ci in range(env.NUM_COND):
					cond_rewards = sw_rewards_batch[reward_idx:reward_idx + software_steps]
					best_step_idx = np.argmax(cond_rewards)
					best_sw_action = sw_actions_batch[reward_idx + best_step_idx].copy()
					best_sw_actions.append(best_sw_action)
					reward_idx += software_steps
				
				# 更新训练过程中的最优结果
				best_training_results['best_hw_reward'] = best_hw_reward
				best_training_results['best_hw_action'] = hw_action.copy()
				best_training_results['best_step'] = t
				
				# 计算最优硬件动作下的详细评估信息
				L, C, Np, Ns = env._denorm_h(hw_action)
				# 计算所有工况的详细效率信息，使用每个工况的最优软件动作
				all_conditions_info = []
				for ci in range(env.NUM_COND):
					alpha, beta, fsn = env._denorm_s(best_sw_actions[ci])
					eff_vec, info = env._vectorized_eval(
						L, C, Np, Ns,
						np.array([alpha]), np.array([beta]), np.array([fsn]),
						np.array([env.VP[ci]]), np.array([env.VS[ci]]), np.array([env.PT[ci]])
					)
					if(eff_vec[0] > 0.2):
						all_conditions_info.append({
							'condition': ci + 1,
							'VP': env.VP[ci],
							'VS': env.VS[ci], 
							'PT': env.PT[ci],
							'efficiency': float(info['eff'][0]),
							'eff_eff': float(info['eff_eff'][0]),
							'fs': float(info['fs'][0]),
							'i_rms': float(info['i_rms'][0]),
							'Po': float(info['Po'][0]),
							'p_loss': float(info['p_loss'][0])
						})
				# 保存每个工况的最优软件动作参数
				software_params_all = []
				for ci in range(env.NUM_COND):
					alpha, beta, fsn = env._denorm_s(best_sw_actions[ci])
					software_params_all.append({
						'condition': ci + 1,
						'alpha': alpha,
						'beta': beta,
						'fsn': fsn
					})
				
				best_training_results['best_hw_info'] = {
					'hardware_params': {'L': L, 'C': C, 'Np': Np, 'Ns': Ns},
					'software_params_all': software_params_all,
					'all_conditions': all_conditions_info,
					'average_efficiency': best_hw_reward
				}

			# 记录当前步的最佳曲线
			best_hw_reward_history.append(best_hw_reward)
			best_sw_reward_history.append(best_sw_reward)
			
			result_saving_time = time.time() - result_saving_start
			timing_stats['result_saving'].append(result_saving_time)

			# 中途日志：软硬件最优reward和时间
			if t % log_every == 0:
				elapsed = time.time() - start_time
				step_total_time = time.time() - step_start_time
				
				# 计算各功能块的平均时间
				avg_action_time = np.mean(timing_stats['action_inference'][-log_every:]) if len(timing_stats['action_inference']) >= log_every else np.mean(timing_stats['action_inference'])
				avg_eval_time = np.mean(timing_stats['efficiency_evaluation'][-log_every:]) if len(timing_stats['efficiency_evaluation']) >= log_every else np.mean(timing_stats['efficiency_evaluation'])
				avg_training_time = np.mean(timing_stats['network_training'][-log_every:]) if len(timing_stats['network_training']) >= log_every else np.mean(timing_stats['network_training'])
				avg_saving_time = np.mean(timing_stats['result_saving'][-log_every:]) if len(timing_stats['result_saving']) >= log_every else np.mean(timing_stats['result_saving'])
				avg_other_time = np.mean(timing_stats['other_operations'][-log_every:]) if len(timing_stats['other_operations']) >= log_every else np.mean(timing_stats['other_operations'])
				
				print(f"步数 {t:4d} | 最优硬件奖励(平均效率)={best_hw_reward:.4f} | 最优软件奖励={best_sw_reward:.4f} | 用时={elapsed:.1f}秒")
				print(f"      | 动作推理={avg_action_time*1000:.1f}ms | 效率评估={avg_eval_time*1000:.1f}ms | 网络训练={avg_training_time*1000:.1f}ms | 结果保存={avg_saving_time*1000:.1f}ms | 其他={avg_other_time*1000:.1f}ms")

		# 训练结束后的性能分析报告
		print("\n" + "="*80)
		print("训练性能分析报告")
		print("="*80)
		
		total_training_time = time.time() - start_time
		total_steps = len(timing_stats['action_inference'])
		
		# 计算各功能块的总时间和平均时间
		total_action_time = sum(timing_stats['action_inference'])
		total_eval_time = sum(timing_stats['efficiency_evaluation'])
		total_training_time_net = sum(timing_stats['network_training'])
		total_saving_time = sum(timing_stats['result_saving'])
		total_other_time = sum(timing_stats['other_operations'])
		
		avg_action_time = np.mean(timing_stats['action_inference'])
		avg_eval_time = np.mean(timing_stats['efficiency_evaluation'])
		avg_training_time_net = np.mean(timing_stats['network_training'])
		avg_saving_time = np.mean(timing_stats['result_saving'])
		avg_other_time = np.mean(timing_stats['other_operations'])
		
		# 计算百分比
		action_percent = (total_action_time / total_training_time) * 100
		eval_percent = (total_eval_time / total_training_time) * 100
		training_percent = (total_training_time_net / total_training_time) * 100
		saving_percent = (total_saving_time / total_training_time) * 100
		other_percent = (total_other_time / total_training_time) * 100
		
		print(f"总训练时间: {total_training_time:.2f}秒 ({total_training_time/60:.1f}分钟)")
		print(f"总训练步数: {total_steps}")
		print(f"平均每步时间: {total_training_time/total_steps*1000:.1f}ms")
		print()
		print("各功能块时间分析:")
		print(f"  1. 动作推理:     {total_action_time:.2f}秒 ({action_percent:.1f}%) - 平均{avg_action_time*1000:.1f}ms/步")
		print(f"  2. 效率评估:     {total_eval_time:.2f}秒 ({eval_percent:.1f}%) - 平均{avg_eval_time*1000:.1f}ms/步")
		print(f"  3. 网络训练:     {total_training_time_net:.2f}秒 ({training_percent:.1f}%) - 平均{avg_training_time_net*1000:.1f}ms/步")
		print(f"  4. 结果保存:     {total_saving_time:.2f}秒 ({saving_percent:.1f}%) - 平均{avg_saving_time*1000:.1f}ms/步")
		print(f"  5. 其他操作:     {total_other_time:.2f}秒 ({other_percent:.1f}%) - 平均{avg_other_time*1000:.1f}ms/步")
		print()
		
		# 找出主要时间开销
		time_breakdown = [
			("动作推理", action_percent),
			("效率评估", eval_percent),
			("网络训练", training_percent),
			("结果保存", saving_percent),
			("其他操作", other_percent)
		]
		time_breakdown.sort(key=lambda x: x[1], reverse=True)
		
		print("时间开销排序:")
		for i, (name, percent) in enumerate(time_breakdown, 1):
			print(f"  {i}. {name}: {percent:.1f}%")
		
		# 性能优化建议
		print("\n性能优化建议:")
		if eval_percent > 50:
			print("  - 效率评估占用超过50%时间，建议优化评估算法或减少评估次数")
		if action_percent > 30:
			print("  - 动作推理占用较多时间，建议优化网络结构或减少推理频率")
		if training_percent > 20:
			print("  - 网络训练占用较多时间，建议减少训练频率或优化训练算法")
		if saving_percent > 10:
			print("  - 结果保存占用较多时间，建议减少保存频率或优化保存逻辑")
		
		print("="*80)
		
		# 保存
		os.makedirs(save_path, exist_ok=True)
		hw_policy.save(os.path.join(save_path, 'hardware'))
		sw_policy.save(os.path.join(save_path, 'software'))

		# 绘制训练曲线
		steps_axis = np.arange(1, len(hw_reward_history) + 1)
		plt.figure(figsize=(12, 8))

		# 子图1：奖励曲线
		plt.subplot(2, 2, 1)
		plt.plot(steps_axis, hw_reward_history, label='硬件奖励(10工况平均效率)', alpha=0.6, color='blue')
		plt.plot(steps_axis, best_hw_reward_history, label='最优硬件奖励', linewidth=2, color='red')
		plt.plot(steps_axis, best_sw_reward_history, label='最优软件奖励', linewidth=2, color='green')
		plt.xlabel('训练步数')
		plt.ylabel('奖励值')
		plt.title('分层TD3训练奖励曲线')
		plt.grid(True, linestyle='--', alpha=0.3)
		plt.legend()

		# 子图2：硬件参数收敛曲线
		plt.subplot(2, 2, 2)
		if best_hw_action is not None:
			L, C, Np, Ns = env._denorm_h(best_hw_action)
			plt.bar(['L (μH)', 'C (nF)', 'Np', 'Ns'], [L*1e6, C*1e9, Np, Ns], color=['skyblue', 'lightcoral', 'lightgreen', 'khaki'])
			plt.title('最优硬件参数')
			plt.ylabel('参数值')
			for i, v in enumerate([L*1e6, C*1e9, Np, Ns]):
				plt.text(i, v, f'{v:.2f}', ha='center', va='bottom')

		# 子图3：各工况最优软件参数对比
		plt.subplot(2, 2, 3)
		if best_training_results['best_hw_info'] is not None:
			sw_params_all = best_training_results['best_hw_info']['software_params_all']
			conditions = [p['condition'] for p in sw_params_all]
			alphas = [p['alpha'] for p in sw_params_all]
			betas = [p['beta'] for p in sw_params_all]
			fsns = [p['fsn'] for p in sw_params_all]
			
			x = np.arange(len(conditions))
			width = 0.25
			
			plt.bar(x - width, alphas, width, label='α', color='orange', alpha=0.7)
			plt.bar(x, betas, width, label='β', color='purple', alpha=0.7)
			plt.bar(x + width, fsns, width, label='fsn', color='brown', alpha=0.7)
			
			plt.xlabel('工况编号')
			plt.ylabel('参数值')
			plt.title('各工况最优软件参数')
			plt.xticks(x, conditions)
			plt.legend()
			plt.grid(True, linestyle='--', alpha=0.3)

		# 子图4：10工况效率分布
		plt.subplot(2, 2, 4)
		if best_training_results['best_hw_info'] is not None:
			# 使用已计算好的各工况详细评估结果
			all_conditions = best_training_results['best_hw_info']['all_conditions']
			if all_conditions:
				conditions = [c['condition'] for c in all_conditions]
				effs = [c['efficiency'] for c in all_conditions]
				plt.plot(conditions, effs, 'o-', color='red', linewidth=2, markersize=6)
				plt.xlabel('工况编号')
				plt.ylabel('效率')
				plt.title('10工况效率分布')
				plt.grid(True, linestyle='--', alpha=0.3)
				plt.ylim(0.8, 1.0)
			else:
				# 如果没有详细评估结果，使用原来的方法
				L, C, Np, Ns = env._denorm_h(best_hw_action)
				effs = []
				for ci in range(env.NUM_COND):
					# 使用每个工况的最优软件动作
					sw_params_all = best_training_results['best_hw_info']['software_params_all']
					alpha, beta, fsn = sw_params_all[ci]['alpha'], sw_params_all[ci]['beta'], sw_params_all[ci]['fsn']
					eff_vec, _ = env._vectorized_eval(
						L, C, Np, Ns,
						np.array([alpha]), np.array([beta]), np.array([fsn]),
						np.array([env.VP[ci]]), np.array([env.VS[ci]]), np.array([env.PT[ci]])
					)
					effs.append(eff_vec[0])
				plt.plot(range(1, env.NUM_COND + 1), effs, 'o-', color='red', linewidth=2, markersize=6)
				plt.xlabel('工况编号')
				plt.ylabel('效率')
				plt.title('10工况效率分布')
				plt.grid(True, linestyle='--', alpha=0.3)
				plt.ylim(0.8, 1.0)

		plot_path = os.path.join(save_path, 'training_analysis.png')
		plt.tight_layout()
		plt.savefig(plot_path, dpi=150, bbox_inches='tight')
		plt.show()
		print(f"训练分析图已保存: {plot_path}")

		# 详细输出结果
		print("\n" + "="*60)
		print("分层TD3 DAB优化结果")
		print("="*60)

		if best_hw_action is not None:
			L, C, Np, Ns = env._denorm_h(best_hw_action)
			print(f"最优硬件参数:")
			print(f"  电感 L = {L*1e6:.2f} μH")
			print(f"  电容 C = {C*1e9:.2f} nF")
			print(f"  原边匝数 Np = {Np:.2f}")
			print(f"  副边匝数 Ns = {Ns:.2f}")
			print(f"  归一化动作: [{best_hw_action[0]:.3f}, {best_hw_action[1]:.3f}, {best_hw_action[2]:.3f}, {best_hw_action[3]:.3f}]")

		if best_training_results['best_hw_info'] is not None:
			sw_params_all = best_training_results['best_hw_info']['software_params_all']
			print(f"\n各工况最优软件参数:")
			print(f"{'工况':<4} {'移相角α':<8} {'占空比β':<8} {'归一化频率fsn':<12} {'归一化动作':<20}")
			print("-" * 60)
			for sw_param in sw_params_all:
				# 计算实际开关频率
				L, C, Np, Ns = env._denorm_h(best_hw_action)
				fs_actual = env._vectorized_eval(L, C, Np, Ns, 
					np.array([sw_param['alpha']]), np.array([sw_param['beta']]), np.array([sw_param['fsn']]),
					np.array([env.VP[sw_param['condition']-1]]), np.array([env.VS[sw_param['condition']-1]]), np.array([env.PT[sw_param['condition']-1]]))[1]['fs'][0]
				print(f"{sw_param['condition']:<4} {sw_param['alpha']:<8.3f} {sw_param['beta']:<8.3f} {sw_param['fsn']:<12.3f} {fs_actual/1000:<20.1f} kHz")

		print(f"\n性能指标:")
		print(f"  最优硬件奖励(10工况平均效率): {best_hw_reward:.4f}")
		print(f"  最优软件奖励: {best_sw_reward:.4f}")
		print(f"  软件层平均奖励: {best_avg_sw:.4f}")

		# 10工况详细效率
		if best_training_results['best_hw_info'] is not None:
			all_conditions = best_training_results['best_hw_info']['all_conditions']
			if all_conditions:
				print(f"\n10工况详细效率:")
				print(f"{'工况':<4} {'VP(V)':<6} {'VS(V)':<6} {'PT(W)':<6} {'效率':<8} {'eff_eff':<8} {'fs(kHz)':<8} {'i_rms(A)':<8} {'Po(W)':<8} {'p_loss(W)':<8}")
				print("-" * 80)
				total_eff = 0.0
				for cond_info in all_conditions:
					total_eff += cond_info['efficiency']
					print(f"{cond_info['condition']:<4} {cond_info['VP']:<6.0f} {cond_info['VS']:<6.0f} {cond_info['PT']:<6.0f} "
						  f"{cond_info['efficiency']:<8.4f} {cond_info['eff_eff']:<8.4f} {cond_info['fs']/1000:<8.1f} "
						  f"{cond_info['i_rms']:<8.3f} {cond_info['Po']:<8.1f} {cond_info['p_loss']:<8.1f}")
				print(f"  平均效率: {total_eff/len(all_conditions):.4f}")
			else:
				# 如果没有详细评估结果，使用原来的方法
				print(f"\n10工况详细效率:")
				L, C, Np, Ns = env._denorm_h(best_hw_action)
				sw_params_all = best_training_results['best_hw_info']['software_params_all']
				total_eff = 0.0
				for ci in range(env.NUM_COND):
					alpha, beta, fsn = sw_params_all[ci]['alpha'], sw_params_all[ci]['beta'], sw_params_all[ci]['fsn']
					eff_vec, info = env._vectorized_eval(
						L, C, Np, Ns,
						np.array([alpha]), np.array([beta]), np.array([fsn]),
						np.array([env.VP[ci]]), np.array([env.VS[ci]]), np.array([env.PT[ci]])
					)
					eff = eff_vec[0]
					total_eff += eff
					print(f"  工况{ci+1:2d}: VP={env.VP[ci]:.0f}V, VS={env.VS[ci]:.0f}V, PT={env.PT[ci]:.0f}W -> 效率={eff:.4f}")
				print(f"  平均效率: {total_eff/env.NUM_COND:.4f}")

		# 打印训练过程中的最优结果（简化版，避免重复）
		print("\n" + "="*80)
		print("训练过程中的最优结果")
		print("="*80)
		
		if best_training_results['best_hw_info'] is not None:
			print(f"最优结果出现在第 {best_training_results['best_step']} 步")
			print(f"最优硬件奖励(平均效率): {best_training_results['best_hw_reward']:.4f}")
			print("详细参数和评估结果请参考上面的完整输出")
		else:
			print("训练过程中未找到有效的最优结果")
		
		# ========== 训练完成后的网络评估 ==========
		print("\n" + "="*80)
		print("训练完成后的网络评估（无噪声）")
		print("="*80)
		
		# 网络评估（强化学习网络通常不需要显式设置评估模式）
		
		# 评估硬件网络
		print("硬件网络评估:")
		state = env.reset()
		with torch.no_grad():
			hw_action_eval = hw_policy.select_action(state)  # 无噪声
		
		L_eval, C_eval, Np_eval, Ns_eval = env._denorm_h(hw_action_eval)
		print(f"  硬件动作: [{hw_action_eval[0]:.3f}, {hw_action_eval[1]:.3f}, {hw_action_eval[2]:.3f}, {hw_action_eval[3]:.3f}]")
		print(f"  硬件参数: L={L_eval*1e6:.2f}μH, C={C_eval*1e9:.2f}nF, Np={Np_eval:.2f}, Ns={Ns_eval:.2f}")
		
		# 评估软件网络
		print("\n软件网络评估:")
		sw_actions_eval = []
		sw_rewards_eval = []
		sw_params_eval = []
		
		for ci in range(env.NUM_COND):
			sw_obs = env.build_sw_obs(hw_action_eval, ci)
			with torch.no_grad():
				sw_action_eval = sw_policy.select_action(sw_obs)  # 无噪声
			
			# 评估该工况下的性能
			alpha_eval, beta_eval, fsn_eval = env._denorm_s(sw_action_eval)
			eff_vec, info = env._vectorized_eval(
				L_eval, C_eval, Np_eval, Ns_eval,
				np.array([alpha_eval]), np.array([beta_eval]), np.array([fsn_eval]),
				np.array([env.VP[ci]]), np.array([env.VS[ci]]), np.array([env.PT[ci]])
			)
			
			sw_actions_eval.append(sw_action_eval)
			sw_rewards_eval.append(eff_vec[0])
			
			# 反归一化软件动作
			alpha_eval, beta_eval, fsn_eval = env._denorm_s(sw_action_eval)
			sw_params_eval.append({
				'condition': ci + 1,
				'alpha': alpha_eval,
				'beta': beta_eval,
				'fsn': fsn_eval,
				'efficiency': eff_vec[0],
				'fs_actual': info['fs'][0],
				'i_rms': info['i_rms'][0],
				'Po': info['Po'][0],
				'p_loss': info['p_loss'][0]
			})
		
		# 计算平均性能
		avg_efficiency = np.mean(sw_rewards_eval)
		best_efficiency = np.max(sw_rewards_eval)
		worst_efficiency = np.min(sw_rewards_eval)
		
		print(f"  平均效率: {avg_efficiency:.4f}")
		print(f"  最高效率: {best_efficiency:.4f}")
		print(f"  最低效率: {worst_efficiency:.4f}")
		print(f"  效率标准差: {np.std(sw_rewards_eval):.4f}")
		
		# 显示各工况详细结果
		print(f"\n各工况详细评估结果:")
		print(f"{'工况':<4} {'VP(V)':<6} {'VS(V)':<6} {'PT(W)':<6} {'效率':<8} {'α':<8} {'β':<8} {'fsn':<8} {'fs(kHz)':<8} {'i_rms(A)':<8}")
		print("-" * 80)
		
		for param in sw_params_eval:
			print(f"{param['condition']:<4} {env.VP[param['condition']-1]:<6.0f} {env.VS[param['condition']-1]:<6.0f} {env.PT[param['condition']-1]:<6.0f} "
				  f"{param['efficiency']:<8.4f} {param['alpha']:<8.3f} {param['beta']:<8.3f} {param['fsn']:<8.3f} "
				  f"{param['fs_actual']/1000:<8.1f} {param['i_rms']:<8.3f}")
		
		# 与训练过程中的最优结果对比
		if best_training_results['best_hw_info'] is not None:
			print(f"\n与训练最优结果对比:")
			print(f"  训练最优平均效率: {best_training_results['best_hw_reward']:.4f}")
			print(f"  网络评估平均效率: {avg_efficiency:.4f}")
			print(f"  效率差异: {avg_efficiency - best_training_results['best_hw_reward']:.4f}")
			
			# 检查硬件参数是否接近
			best_hw_params = best_training_results['best_hw_info']['hardware_params']
			hw_diff = {
				'L': abs(L_eval - best_hw_params['L']) / best_hw_params['L'] * 100,
				'C': abs(C_eval - best_hw_params['C']) / best_hw_params['C'] * 100,
				'Np': abs(Np_eval - best_hw_params['Np']) / best_hw_params['Np'] * 100,
				'Ns': abs(Ns_eval - best_hw_params['Ns']) / best_hw_params['Ns'] * 100
			}
			print(f"  硬件参数相对差异: L={hw_diff['L']:.1f}%, C={hw_diff['C']:.1f}%, Np={hw_diff['Np']:.1f}%, Ns={hw_diff['Ns']:.1f}%")
		
		print("="*80)
		# print(env._vectorized_eval(34.41e-6, 221.992e-9, 26.983, 42.926, np.array([0.185864]), np.array([0.107862]), np.array([env.norm_fs(85205.47, 34.41e-6, 221.992e-9)]),np.array([400.0]), np.array([420.0]), np.array([6000.0])))
		# print(env._vectorized_eval(34.41e-6, 221.992e-9, 26.983, 42.926, np.array([0.103726]), np.array([0.158858]), np.array([env.norm_fs(63340.78, 34.41e-6, 221.992e-9)]),np.array([400.0]), np.array([527.5]), np.array([6000.0])))
		# print(env._vectorized_eval(34.41e-6, 221.992e-9, 26.983, 42.926, np.array([0.092877]), np.array([0.043389]), np.array([env.norm_fs(84289.14, 34.41e-6, 221.992e-9)]),np.array([400.0]), np.array([635.0]), np.array([6000.0])))
		# print(env._vectorized_eval(34.41e-6, 221.992e-9, 26.983, 42.926, np.array([0.0119]), np.array([0.104677]), np.array([env.norm_fs(83975.57, 34.41e-6, 221.992e-9)]),np.array([400.0]), np.array([742.5]), np.array([6000.0])))
		# print(env._vectorized_eval(34.41e-6, 221.992e-9, 26.983, 42.926, np.array([0.000643]), np.array([0.14288]), np.array([env.norm_fs(89757.42, 34.41e-6, 221.992e-9)]),np.array([400.0]), np.array([850.0]), np.array([6000.0])))

		return {
			'best_hw_reward': float(best_hw_reward),
			'best_hw_action': best_hw_action.tolist() if best_hw_action is not None else None,
			'best_training_results': best_training_results
		}


if __name__ == '__main__':
	parser = argparse.ArgumentParser(description='Hierarchical TD3 for DAB optimization')
	# 训练相关
	parser.add_argument('--seed', type=int, default=0)
	parser.add_argument('--hardware_steps', type=int, default=5000)
	parser.add_argument('--hardware_start_random', type=int, default=1024)
	parser.add_argument('--hardware_batch', type=int, default=1024)
	parser.add_argument('--software_batch', type=int, default=1024)
	parser.add_argument('--software_steps', type=int, default=500)
	parser.add_argument('--log_every', type=int, default=100)
	parser.add_argument('--noise_end_hw', type=float, default=0.05)
	parser.add_argument('--noise_end_sw', type=float, default=0.05)
	parser.add_argument('--lr_gamma', type=float, default=0.9999)
	parser.add_argument('--num_conditions', type=int, default=5)
	parser.add_argument('--save_path', type=str, default='hier_td3_synthetic')
	args = parser.parse_args()
	
	train_hierarchical(
		seed=args.seed,
		hardware_steps=args.hardware_steps,
		hardware_start_random=args.hardware_start_random,
		hardware_batch=args.hardware_batch,
		software_batch=args.software_batch,
		software_steps=args.software_steps,
		log_every=args.log_every,
		noise_end_hw=args.noise_end_hw,
		noise_end_sw=args.noise_end_sw,
		lr_gamma=args.lr_gamma,
		save_path=args.save_path,
		num_conditions=args.num_conditions,
		max_batch_size=args.software_steps * args.num_conditions,
		dtype=np.float64
	)


