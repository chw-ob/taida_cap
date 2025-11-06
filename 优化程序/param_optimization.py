import argparse
import numpy as np
import time

# 可选导入启发式算法库
try:
	from pymoo.algorithms.soo.nonconvex.ga import GA as PymooGA
	from pymoo.core.problem import Problem as PymooProblem
	from pymoo.optimize import minimize as pymoo_minimize
	_HAS_PYMOO = True
except Exception:
	_HAS_PYMOO = False

try:
	import pyswarms as ps
	_HAS_PYSWARMS = True
except Exception:
	_HAS_PYSWARMS = False

# 导入强化学习算法
from TD3 import TD3
from DDPG import DDPG
from PFC_param import pfc_objective, pfc_objective_detailed, pfc_default_bounds, list_available_cores, list_available_wires


class SearchSpace:
	def __init__(self, lower_bounds, upper_bounds):
		self.lower = np.asarray(lower_bounds, dtype=np.float64)
		self.upper = np.asarray(upper_bounds, dtype=np.float64)
		assert self.lower.shape == self.upper.shape
		self.dim = self.lower.size

	def clip(self, x: np.ndarray) -> np.ndarray:
		return np.clip(x, self.lower, self.upper)

	def denorm_from_unit(self, a: np.ndarray) -> np.ndarray:
		"""将[-1,1]动作映射到实际边界。"""
		a01 = (a + 1.0) * 0.5
		return self.lower + a01 * (self.upper - self.lower)


def optimize_random(objective_fn, space: SearchSpace, iterations=2000, seed=0, log_every=1):
	rng = np.random.RandomState(seed)
	best_x = None
	best_f = -1e18
	for t in range(1, iterations + 1):
		x = rng.uniform(space.lower, space.upper)
		f = float(objective_fn(x))
		if f > best_f:
			best_f = f
			best_x = x
		if log_every and (t % log_every == 0):
			print(f"[random] epoch {t}/{iterations} best_f={best_f:.6f} best_x={np.array2string(best_x, precision=4, separator=', ')}")
	return best_x, best_f


def optimize_ga(objective_fn, space: SearchSpace, pop_size=64, generations=200, seed=0, log_every=1):
	if not _HAS_PYMOO:
		raise RuntimeError("未检测到 pymoo，请先安装：pip install pymoo")

	class _Problem(PymooProblem):
		def __init__(self):
			super().__init__(n_var=space.dim, n_obj=1, n_constr=0, xl=space.lower, xu=space.upper)

		def _evaluate(self, x, out, *args, **kwargs):
			# 兼容单样本与批量样本
			if np.ndim(x) == 1:
				out["F"] = -float(objective_fn(x))
			else:
				vals = np.apply_along_axis(lambda r: -float(objective_fn(r)), 1, x)
				out["F"] = vals.reshape((-1, 1))

	problem = _Problem()
	algorithm = PymooGA(pop_size=pop_size)

	def _callback(alg):
		try:
			if not log_every:
				return False
			gen = getattr(alg, "n_gen", 0)
			if gen <= 0 or (gen % log_every != 0 and gen != 1 and gen != generations):
				return False
			F = alg.pop.get("F")
			X = alg.pop.get("X")
			idx = int(np.argmin(F))
			# 兼容 F 形状为 (n, 1) 或 (n,)
			_f = np.asarray(F[idx]).reshape(-1)[0]
			f_best = -float(_f)
			x_best = X[idx]
			print(f"[ga] epoch {gen}/{generations} best_f={f_best:.6f} best_x={np.array2string(x_best, precision=4, separator=', ')}")
		except Exception:
			pass
		return False

	res = pymoo_minimize(problem, algorithm, ("n_gen", generations), seed=seed, verbose=False, callback=_callback)
	best_x = res.X
	best_f = float(objective_fn(best_x))
	return best_x, best_f


def optimize_pso(objective_fn, space: SearchSpace, swarm_size=100, iterations=200, seed=0, log_every=1):
	if not _HAS_PYSWARMS:
		raise RuntimeError("未检测到 pyswarms，请先安装：pip install pyswarms")

	# 迭代计数与本地最优跟踪（用于一致的日志格式）
	_state = {"t": 0, "best_f": -1e18, "best_x": None}

	# pyswarms 是最小化接口，这里返回负号，同时在此处做一致化日志
	def _cost(X, **kwargs):
		f_vals = np.array([float(objective_fn(x)) for x in X])
		# 更新全局最佳
		idx_curr = int(np.argmax(f_vals))
		f_curr = float(f_vals[idx_curr])
		if f_curr > _state["best_f"]:
			_state["best_f"] = f_curr
			_state["best_x"] = np.asarray(X[idx_curr]).copy()
		# 递增迭代次数并按频率打印
		_state["t"] += 1
		if log_every and (_state["t"] % log_every == 0 or _state["t"] == 1 or _state["t"] == iterations):
			print(f"[pso] epoch {_state['t']}/{iterations} best_f={_state['best_f']:.6f} best_x={np.array2string(_state['best_x'], precision=4, separator=', ')}")
		return -f_vals

	opts = {
		"c1": 1.49618,
		"c2": 1.49618,
		"w": 0.7298,
	}

	optimizer = ps.single.GlobalBestPSO(n_particles=swarm_size, dimensions=space.dim, options=opts, bounds=(space.lower, space.upper))
	best_cost, best_pos = optimizer.optimize(_cost, iters=iterations, verbose=False)
	best_x = np.asarray(best_pos)
	best_f = float(objective_fn(best_x))
	return best_x, best_f


# ===== 强化学习优化（使用本仓库 TD3/DDPG）=====
class ReplayBuffer:
	def __init__(self, state_dim, action_dim, max_size=int(1e6)):
		self.max_size = max_size
		self.ptr = 0
		self.size = 0
		self.state = np.zeros((max_size, state_dim), dtype=np.float32)
		self.action = np.zeros((max_size, action_dim), dtype=np.float32)
		self.next_state = np.zeros((max_size, state_dim), dtype=np.float32)
		self.reward = np.zeros((max_size, 1), dtype=np.float32)
		self.not_done = np.zeros((max_size, 1), dtype=np.float32)

	def add(self, state, action, next_state, reward, done):
		self.state[self.ptr] = state
		self.action[self.ptr] = action
		self.next_state[self.ptr] = next_state
		self.reward[self.ptr] = reward
		self.not_done[self.ptr] = 1.0 - float(done)
		self.ptr = (self.ptr + 1) % self.max_size
		self.size = min(self.size + 1, self.max_size)

	def sample(self, batch_size):
		ind = np.random.randint(0, self.size, size=batch_size)
		import torch
		device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
		return (
			torch.FloatTensor(self.state[ind]).to(device),
			torch.FloatTensor(self.action[ind]).to(device),
			torch.FloatTensor(self.next_state[ind]).to(device),
			torch.FloatTensor(self.reward[ind]).to(device),
			torch.FloatTensor(self.not_done[ind]).to(device),
		)


def optimize_rl(objective_fn, space: SearchSpace, algo="td3", steps=10000, start_random=2, batch_size=512, noise_end=0.2, lr_gamma=0.9999, seed=0, infer_batch=1024, log_every=1):
	import torch
	rng = np.random.RandomState(seed)
	torch.manual_seed(seed)

	state_dim = 1  # 无状态问题，使用常量占位
	action_dim = space.dim
	max_action = 1.0

	if algo.lower() == "td3":
		policy = TD3(state_dim, action_dim, max_action, lr_gamma=lr_gamma)
	elif algo.lower() == "ddpg":
		policy = DDPG(state_dim, action_dim, max_action, lr_gamma=lr_gamma)
	else:
		raise ValueError("algo 仅支持 td3/ddpg")

	buffer = ReplayBuffer(state_dim, action_dim, max_size=int(2e5))
	state = np.ones(state_dim, dtype=np.float32)
	best_x = None
	best_f = -1e18

	noise_start = 1.0
	gamma = (noise_end / max(noise_start, 1e-8)) ** (1.0 / max(steps - 1, 1))

	for t in range(1, steps + 1):
		curr_noise = max(noise_end, noise_start * (gamma ** (t - 1)))

		# ===== 批量动作推理 =====
		if t < start_random:
			actions = rng.uniform(-1.0, 1.0, size=(infer_batch, action_dim)).astype(np.float32)
		else:
			states_t = torch.FloatTensor(np.repeat(state[None, :], infer_batch, axis=0)).to(torch.device("cuda" if torch.cuda.is_available() else "cpu"))
			actions_t = policy.select_action_batch(states_t, noise_std=curr_noise)
			actions = actions_t.detach().cpu().numpy().astype(np.float32)
			actions = np.clip(actions, -1.0, 1.0)

		# ===== 批量评估 =====
		params_batch = np.asarray([space.denorm_from_unit(a) for a in actions])
		rewards_batch = np.asarray([float(objective_fn(p)) for p in params_batch], dtype=np.float64)

		# 记录全局最优
		idx_best = int(np.argmax(rewards_batch))
		if rewards_batch[idx_best] > best_f:
			best_f = float(rewards_batch[idx_best])
			best_x = params_batch[idx_best].copy()

		# ===== 写入经验回放（将批量样本全部写入） =====
		next_state = state.copy()
		done = True
		for i in range(infer_batch):
			buffer.add(state, actions[i], next_state, rewards_batch[i], done)

		# 训练一步
		if buffer.size > batch_size:
			policy.train(buffer, batch_size=batch_size)

		# 日志
		if log_every and (t % log_every == 0 or t == 1 or t == steps):
			print(f"[{algo}] epoch {t}/{steps} noise={curr_noise:.3f} best_f={best_f:.6f} best_x={np.array2string(best_x, precision=4, separator=', ')}")

	return best_x, best_f


def main():
	parser = argparse.ArgumentParser(description="4参数图腾柱PFC寻优（GA/PSO/TD3/DDPG/Random）")
	parser.add_argument("--algo", type=str, default="ga", choices=["random", "ga", "pso", "td3", "ddpg"], help="选择算法")
	# iters参考：ga: 2000, pso: 200, td3: 500, ddpg: 500
	parser.add_argument("--iters", type=int, default=500, help="迭代/步数（随机/PSO/GA/RL共用或近似")
	parser.add_argument("--pop", type=int, default=64, help="GA群体规模或PSO粒子数")
	parser.add_argument("--seed", type=int, default=0)
	# 工况参数（可通过命令行覆盖）
	parser.add_argument("--p_out", type=float, default=500.0, help="输出功率P_out (W)")
	parser.add_argument("--vin", type=float, default=220.0, help="输入电压V_in_rms (Vrms)")
	parser.add_argument("--f_sw", type=float, default=100e3, help="开关频率f_sw (Hz)")
	parser.add_argument("--vout", type=float, default=400.0, help="直流母线电压Vout (V)")
	# 默认采用 PFC 参数推荐边界；仍允许通过命令行覆盖
	_lower, _upper = pfc_default_bounds()
	parser.add_argument("--lower", type=float, nargs=4, default=_lower.tolist(), help="4个下界：[L,N,core_id,wire_id]")
	parser.add_argument("--upper", type=float, nargs=4, default=_upper.tolist(), help="4个上界：[L,N,core_id,wire_id]")
	parser.add_argument("--noise_end", type=float, default=0.05, help="RL噪声终值")
	parser.add_argument("--log_every", type=int, default=20, help="每多少epoch打印一次训练状态")
	parser.add_argument("--lr_gamma", type=float, default=0.999, help="RL学习率衰减因子")
	args = parser.parse_args()

	# 显示可用的磁芯型号
	print("可用 的磁芯型号:")
	for core_id, name, description in list_available_cores():
		print(f"  ID {core_id}: {name} - {description}")
	print()
	
	# 显示可用的利兹线型号
	print("可用的利兹线型号:")
	for wire_id, description in list_available_wires():
		print(f"  ID {wire_id}: {description}")
	print()

	space = SearchSpace(args.lower, args.upper)
	def objective_fn(x):
		return pfc_objective(
			x,
			P_out=args.p_out,
			V_in_rms=args.vin,
			f_sw=args.f_sw,
			V_out=args.vout,
		)

	start = time.time()
	if args.algo == "random":
		best_x, best_f = optimize_random(objective_fn, space, iterations=args.iters, seed=args.seed, log_every=args.log_every)
	elif args.algo == "ga":
		best_x, best_f = optimize_ga(objective_fn, space, pop_size=args.pop, generations=max(1, args.iters), seed=args.seed, log_every=args.log_every)
	elif args.algo == "pso":
		best_x, best_f = optimize_pso(objective_fn, space, swarm_size=args.pop, iterations=args.iters, seed=args.seed, log_every=args.log_every)
	elif args.algo in ("td3", "ddpg"):
		best_x, best_f = optimize_rl(
			objective_fn,
			space,
			algo=args.algo,
			steps=args.iters,
			start_random=max(100, args.pop),
			batch_size=min(512, max(64, args.pop)),
			noise_end=args.noise_end,
			lr_gamma=args.lr_gamma,
			seed=args.seed,
			infer_batch=args.pop,
			log_every=args.log_every,
		)
	else:
		raise ValueError("未知算法")
	elapsed = time.time() - start

	print("\n===== 寻优完成 =====")
	print(f"算法: {args.algo}")
	print(f"最优参数: {np.array2string(best_x, precision=6, separator=', ')}")
	print(f"最优目标值: {best_f:.6f}")
	print(f"耗时: {elapsed:.2f}s")
	
	# 计算并打印详细指标
	print("\n===== 最优参数下的详细指标 =====")
	try:
		_, details = pfc_objective_detailed(
			best_x,
			P_out=args.p_out,
			V_in_rms=args.vin,
			f_sw=args.f_sw,
			V_out=args.vout,
		)
		print(f"电感值: {best_x[0]*1e6:.2f} μH，匝数: {best_x[1]:.2f}，磁芯型号ID: {best_x[2]} ({details['磁芯型号']})，利兹线型号ID: {best_x[3]} ({details['利兹线型号']})")
		print()   
		
		# 打印损耗指标
		print("=== 损耗分析 ===")
		for key, value in details.items():
			if "损耗" in key or "总损耗" in key:
				if isinstance(value, (int, float)):
					print(f"{key}: {value:.4f}")
				else:
					print(f"{key}: {value}")
		
		print()
		print("=== 性能指标 ===")
		for key, value in details.items():
			if "效率" in key or "功率密度" in key:
				if isinstance(value, (int, float)):
					print(f"{key}: {value:.4f}")
				else:
					print(f"{key}: {value}")
		
		print()
		print("=== 电气参数 ===")
		for key, value in details.items():
			if "电流" in key or "占空比" in key or "电感值" in key or "匝数" in key:
				if isinstance(value, (int, float)):
					print(f"{key}: {value:.4f}")
				else:
					print(f"{key}: {value}")
		
		print()
		print("=== 磁芯参数 ===")
		for key, value in details.items():
			if "磁芯" in key or "几何尺寸" in key or "气隙" in key:
				print(f"{key}: {value}")
		
		print()
		print("=== 利兹线参数 ===")
		for key, value in details.items():
			if "利兹线" in key or "单股" in key or "股数" in key:
				if isinstance(value, (int, float)):
					print(f"{key}: {value:.4f}")
				else:
					print(f"{key}: {value}")
		
		print()
		print("=== 窗口系数分析 ===")
		for key, value in details.items():
			if "导线" in key or "窗口" in key or "填充" in key or "约束" in key:
				if isinstance(value, (int, float)):
					print(f"{key}: {value:.4f}")
				else:
					print(f"{key}: {value}")
				
	except Exception as e:
		print(f"计算详细指标时出错: {e}")
		print("仅显示基本优化结果")


if __name__ == "__main__":
	main()


