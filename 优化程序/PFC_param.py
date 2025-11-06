import numpy as np
import matplotlib.pyplot as plt

# 说明：
# - 接口与 param_optimization.py 兼容：objective_fn(x: np.ndarray) -> float，返回值越大越好。
# - 本函数以"最小化总损耗（磁芯损耗+开关损耗+导通损耗）"为目标，因此返回负的综合损耗。
# - 由于缺乏具体器件/工况数据，以下采用常见的工程近似。可按实际工程修改常量与公式。

# 利兹线库（按图片表格：股数-外径）
LITZ_WIRE_DATABASE = {
    0:  {'single_strand_diameter': 0.1, 'strands': 10,   'diameter': 0.43,  'description': '0.1mmX10股'},
    1:  {'single_strand_diameter': 0.1, 'strands': 12,   'diameter': 0.48,  'description': '0.1mmX12股'},
    2:  {'single_strand_diameter': 0.1, 'strands': 15,   'diameter': 0.51,  'description': '0.1mmX15股'},
    3:  {'single_strand_diameter': 0.1, 'strands': 20,   'diameter': 0.60,  'description': '0.1mmX20股'},
    4:  {'single_strand_diameter': 0.1, 'strands': 25,   'diameter': 0.66,  'description': '0.1mmX25股'},
    5:  {'single_strand_diameter': 0.1, 'strands': 30,   'diameter': 0.72,  'description': '0.1mmX30股'},
    6:  {'single_strand_diameter': 0.1, 'strands': 35,   'diameter': 0.79,  'description': '0.1mmX35股'},
    7:  {'single_strand_diameter': 0.1, 'strands': 40,   'diameter': 0.86,  'description': '0.1mmX40股'},
    8:  {'single_strand_diameter': 0.1, 'strands': 45,   'diameter': 0.92,  'description': '0.1mmX45股'},
    9:  {'single_strand_diameter': 0.1, 'strands': 50,   'diameter': 1.00,  'description': '0.1mmX50股'},
    10: {'single_strand_diameter': 0.1, 'strands': 60,   'diameter': 1.08,  'description': '0.1mmX60股'},
    11: {'single_strand_diameter': 0.1, 'strands': 70,   'diameter': 1.17,  'description': '0.1mmX70股'},
    12: {'single_strand_diameter': 0.1, 'strands': 75,   'diameter': 1.23,  'description': '0.1mmX75股'},
    13: {'single_strand_diameter': 0.1, 'strands': 80,   'diameter': 1.26,  'description': '0.1mmX80股'},
    14: {'single_strand_diameter': 0.1, 'strands': 90,   'diameter': 1.32,  'description': '0.1mmX90股'},
    15: {'single_strand_diameter': 0.1, 'strands': 100,  'diameter': 1.35,  'description': '0.1mmX100股'},
    16: {'single_strand_diameter': 0.1, 'strands': 110,  'diameter': 1.42,  'description': '0.1mmX110股'},
    17: {'single_strand_diameter': 0.1, 'strands': 120,  'diameter': 1.50,  'description': '0.1mmX120股'},
    18: {'single_strand_diameter': 0.1, 'strands': 130,  'diameter': 1.60,  'description': '0.1mmX130股'},
    19: {'single_strand_diameter': 0.1, 'strands': 140,  'diameter': 1.65,  'description': '0.1mmX140股'},
    20: {'single_strand_diameter': 0.1, 'strands': 150,  'diameter': 1.70,  'description': '0.1mmX150股'},
    21: {'single_strand_diameter': 0.1, 'strands': 160,  'diameter': 1.75,  'description': '0.1mmX160股'},
    22: {'single_strand_diameter': 0.1, 'strands': 180,  'diameter': 1.80,  'description': '0.1mmX180股'},
    23: {'single_strand_diameter': 0.1, 'strands': 200,  'diameter': 1.90,  'description': '0.1mmX200股'},
    24: {'single_strand_diameter': 0.1, 'strands': 250,  'diameter': 2.10,  'description': '0.1mmX250股'},
    25: {'single_strand_diameter': 0.1, 'strands': 300,  'diameter': 2.30,  'description': '0.1mmX300股'},
    26: {'single_strand_diameter': 0.1, 'strands': 320,  'diameter': 2.40,  'description': '0.1mmX320股'},
    27: {'single_strand_diameter': 0.1, 'strands': 350,  'diameter': 2.50,  'description': '0.1mmX350股'},
    28: {'single_strand_diameter': 0.1, 'strands': 360,  'diameter': 2.55,  'description': '0.1mmX360股'},
    29: {'single_strand_diameter': 0.1, 'strands': 400,  'diameter': 2.80,  'description': '0.1mmX400股'},
    30: {'single_strand_diameter': 0.1, 'strands': 450,  'diameter': 3.10,  'description': '0.1mmX450股'},
    31: {'single_strand_diameter': 0.1, 'strands': 470,  'diameter': 3.13,  'description': '0.1mmX470股'},
    32: {'single_strand_diameter': 0.1, 'strands': 500,  'diameter': 3.20,  'description': '0.1mmX500股'},
    33: {'single_strand_diameter': 0.1, 'strands': 600,  'diameter': 3.40,  'description': '0.1mmX600股'},
    34: {'single_strand_diameter': 0.1, 'strands': 700,  'diameter': 3.65,  'description': '0.1mmX700股'},
    35: {'single_strand_diameter': 0.1, 'strands': 800,  'diameter': 3.90,  'description': '0.1mmX800股'},
    36: {'single_strand_diameter': 0.1, 'strands': 900,  'diameter': 4.00,  'description': '0.1mmX900股'},
    37: {'single_strand_diameter': 0.1, 'strands': 1000, 'diameter': 4.30,  'description': '0.1mmX1000股'},
    38: {'single_strand_diameter': 0.1, 'strands': 1050, 'diameter': 4.40,  'description': '0.1mmX1050股'},
    39: {'single_strand_diameter': 0.1, 'strands': 1200, 'diameter': 4.80,  'description': '0.1mmX1200股'},
    40: {'single_strand_diameter': 0.1, 'strands': 1500, 'diameter': 5.60,  'description': '0.1mmX1500股'},
    41: {'single_strand_diameter': 0.1, 'strands': 2000, 'diameter': 6.50,  'description': '0.1mmX2000股'},
    42: {'single_strand_diameter': 0.1, 'strands': 2500, 'diameter': 7.00,  'description': '0.1mmX2500股'},
    43: {'single_strand_diameter': 0.1, 'strands': 3000, 'diameter': 7.80,  'description': '0.1mmX3000股'},
    44: {'single_strand_diameter': 0.1, 'strands': 3200, 'diameter': 8.00,  'description': '0.1mmX3200股'},
    45: {'single_strand_diameter': 0.1, 'strands': 3600, 'diameter': 8.50,  'description': '0.1mmX3600股'},
    46: {'single_strand_diameter': 0.1, 'strands': 4000, 'diameter': 9.20,  'description': '0.1mmX4000股'},
    47: {'single_strand_diameter': 0.1, 'strands': 5000, 'diameter': 10.10, 'description': '0.1mmX5000股'},
	48: {'single_strand_diameter': 0.05, 'strands': 800, 'diameter': 2.00, 'description': '0.05mmX800股'},
}

LITZ_WIRE_DATABASE = {
	0: {'single_strand_diameter': 0.1, 'strands': 120,  'diameter': 1.50,  'description': '0.1mmX120股'},
    1: {'single_strand_diameter': 0.1, 'strands': 320,  'diameter': 2.40,  'description': '0.1mmX320股'},
	2: {'single_strand_diameter': 0.1, 'strands': 360,  'diameter': 2.55,  'description': '0.1mmX360股'},
	3: {'single_strand_diameter': 0.05, 'strands': 500, 'diameter': 1.80, 'description': '0.05mmX500股'},
	4: {'single_strand_diameter': 0.05, 'strands': 600, 'diameter': 2.00, 'description': '0.05mmX600股'},
	5: {'single_strand_diameter': 0.05, 'strands': 800, 'diameter': 2.20, 'description': '0.05mmX800股'},
	6: {'single_strand_diameter': 0.05, 'strands': 3000, 'diameter': 4.20, 'description': '0.05mmX1000股'},
}

def get_wire_parameters(wire_id: int) -> dict:
    """
    根据利兹线识别码获取股数参数（线径固定为0.1mm）
    
    Args:
        wire_id: 利兹线识别码
        
    Returns:
        利兹线参数字典，包含strands, diameter等参数
        其中diameter为利兹线总外径
    """
    if wire_id not in LITZ_WIRE_DATABASE:
        raise ValueError(f"未找到利兹线型号 {wire_id}，可用型号: {list(LITZ_WIRE_DATABASE.keys())}")
    
    return LITZ_WIRE_DATABASE[wire_id]

def list_available_wires():
    """
    列出所有可用的利兹线型号
    
    Returns:
        利兹线型号列表
    """
    return [(wire_id, info['description']) for wire_id, info in LITZ_WIRE_DATABASE.items()]

# 磁芯型号库
MAGNETIC_CORE_DATABASE = {
    0: {
        'name': 'EE42',
        'AA': 42,
		'BB': 29.5,
		'CC': 12,
		'DD': 20,
		'EE': 15.1,
		'FF': 21.2,
		'Ae': 233,
		'Ve': 22601,
        'description': 'EE42标准磁芯'
    },
    1: {
        'name': 'EE49',
		'AA': 48.8,
		'BB': 31.8,
		'CC': 15.6,
		'DD': 15.6,
		'EE': 12.1,
		'FF': 20.6,
		'Ae': 254.3,
		'Ve': 23141.3,
        'description': 'EE49标准磁芯'
    },
    2: {
        'name': 'EE50',
		'AA': 50,
		'BB': 35,
		'CC': 15,
		'DD': 15,
		'EE': 12.5,
		'FF': 21,
		'Ae': 228,
		'Ve': 21865.2,
        'description': 'EE50标准磁芯'
    },
	# 3: {
    #     'name': 'EE55',
    #     'AA': 55.15,
	# 	'BB': 38.1,
	# 	'CC': 16.95,
	# 	'DD': 20.7,
	# 	'EE': 18.8,
	# 	'FF': 27.5,
	# 	'Ae': 355,
	# 	'Ve': 43665,
    #     'description': 'EE55标准磁芯'
    # },
	3: {
        'name': 'PQ38',
        'AA': 38,
		'BB': 32.8,
		'CC': 14.3,
		'DD': 21.3,
		'EE': 1.775,
		'FF': 3.25,
		'Ae': 119.2,
		'Ve': 5423.6,
        'description': 'PQ38标准磁芯'
    },
	4: {
        'name': 'PQ40',
        'AA': 40,
		'BB': 36.8,
		'CC': 15.04,
		'DD': 28.04,
		'EE': 7.31,
		'FF': 12.45,
		'Ae': 199.2,
		'Ve': 13625.3,
        'description': 'PQ40标准磁芯'
    },
	5: {
        'name': 'PQ45',
        'AA': 45,
		'BB': 40.5,
		'CC': 17,
		'DD': 30,
		'EE': 7.5,
		'FF': 13.5,
		'Ae': 255.8,
		'Ve': 17424.2,
        'description': 'PQ45标准磁芯'
    },
	# 7: {
    #     'name': 'PQ50',
    #     'AA': 50,
	# 	'BB': 44,
	# 	'CC': 20,
	# 	'DD': 32,
	# 	'EE': 18.5,
	# 	'FF': 25,
	# 	'Ae': 331.6,
	# 	'Ve': 28749.7,
    #     'description': 'PQ50标准磁芯'
    # },
}

def get_core_parameters(core_id: int) -> dict:
    """
    根据磁芯型号识别码获取磁芯参数
    
    Args:
        core_id: 磁芯型号识别码
        
    Returns:
        磁芯参数字典，包含name, AA, BB, CC, DD, EE, FF, Ae, Ve等参数
    """
    if core_id not in MAGNETIC_CORE_DATABASE:
        raise ValueError(f"未找到磁芯型号 {core_id}，可用型号: {list(MAGNETIC_CORE_DATABASE.keys())}")
    
    return MAGNETIC_CORE_DATABASE[core_id]

def list_available_cores():
	"""
	列出所有可用的磁芯型号
	
	Returns:
		磁芯型号列表
	"""
	return [(core_id, info['name'], info['description']) for core_id, info in MAGNETIC_CORE_DATABASE.items()]

def modified_coefficient(alpha: float, beta: float, k: float) -> float:
    """
    计算改进的斯坦梅茨系数 ki
    
    参数:
        alpha : 斯坦梅茨系数 alpha
        beta : 斯坦梅茨系数 beta
        k : 斯坦梅茨系数 k
    
    返回:
        ki : 修正的斯坦梅茨系数
    """
    x = np.linspace(0, np.pi / 2, 100)
    q = 4 * np.trapz(np.cos(x) ** alpha, x)
    return k / (2 ** (beta-1) * np.pi ** (alpha-1) * q)


def calculate_Sw(N: float, diameter: int, core_params: dict) -> float:
	"""
	计算窗口利用率
	
	Args:
		N: 匝数
		diameter: 利兹线直径
		core_params: 磁芯参数字典
		
	Returns:
		Sw: 窗口利用率
	"""
	N_vertical = np.floor(core_params['EE'] * 2 * 0.8 / diameter)
	N_vertical = max(N_vertical, 1)
	N_horizontal = np.ceil(N / N_vertical)
	Sw = N_horizontal * diameter  / ((core_params['BB'] - core_params['CC']) / 2)
	
	return Sw


def _clip_positive(x: float, eps: float = 1e-12) -> float:
	return float(max(x, eps))


def _estimate_pfc_currents(P_out: float, V_in_rms: float, f_sw: float, L: float, V_out: float, n_samples: int = 60, f_line: float = 50.0):
	"""
	以整周期 N 点采样估算图腾柱 PFC 的电流应力。
	- 采样瞬时整流后输入电压：v_in(t) = |√2·V_in_rms·sin(ω_line t)|
	- 升压占空比：D(t) = 1 - v_in(t)/V_out（限幅到 [0,0.99]）
	- 平均输入电流：i_avg(t) ≈ P_out / v_in(t)
	- 开关纹波：ΔI(t) ≈ v_in(t)·D(t) / (L·f_sw)
	- 瞬时峰值：i_peak(t) = i_avg(t) + 0.5·ΔI(t)
	- 整周期 RMS：I_rms = sqrt(mean(i_avg(t)^2 + ΔI(t)^2/12))

	返回：
	- I_peak_arr: 每个采样点的峰值电流数组（长度 N）
	- I_rms: 整周期等效 RMS（标量）
	- D_arr: 每个采样点占空比（长度 N）
	- V_out: 直流母线电压（标量）
	- V_in_arr: 每个采样点的整流后输入电压（长度 N）
	"""
	L = _clip_positive(L)
	V_in_rms = _clip_positive(V_in_rms)
	n = max(int(n_samples), 3)

	# 全周期采样（0..2π），采用整流后电压的绝对值
	theta = np.linspace(0.0, 2.0 * np.pi, num=n, endpoint=False, dtype=np.float64)
	V_in = np.sqrt(2.0) * V_in_rms * np.sin(theta)
	I_in = np.sqrt(2.0) * P_out / V_in_rms * np.sin(theta)
	I_out = P_out / _clip_positive(V_out)
	# V_in = np.maximum(V_in, 1e-3)  # 避免零交叉数值奇异

	# 分段占空比：vin>0 -> D = vin/Vout；vin<0 -> D = 1 - vin/Vout
	D_arr = np.where(V_in >= 0.0, V_in / V_out, 1.0 + (V_in / V_out))
	D_arr = np.clip(D_arr, 0.0, 0.99)


	Delta_I_arr = V_out * D_arr * (1.0 - D_arr) / (L * _clip_positive(f_sw))
	I_valley_arr = I_in - 0.5 * Delta_I_arr	# 下管开通时刻电流
	I_peak_arr = I_in + 0.5 * Delta_I_arr	# 上管开通时刻电流


	# 整周期 RMS（对线性化开关周期内 RMS 的平方取平均再开方）
	I_rms = float(np.sqrt(np.mean(I_in ** 2 + (Delta_I_arr ** 2) / 12.0)))		# 三角波电流有效值和峰峰值是2sqrt(3)倍的关系
	return I_valley_arr, I_peak_arr, D_arr, Delta_I_arr, I_rms, V_out, V_in


# 求绕组交流铜损（仅考虑开关频率下的电阻，未考虑高次谐波）
def copper_loss_ac(N, wire_params, d, I, l, core_params, d_skin):    # 匝数，股数，单股直径，单匝直径，电流有效值，平均绕组长度, 趋肤深度
	sigma = 5.8e7  # S/m 铜电导率
	sigma_scaled = sigma * 1e-3
	P = 0.0
	strands = wire_params['strands']
	D = wire_params['diameter']
	pf = strands * (d/D)**2
	S_coil = strands * np.pi * (d/2)**2 # mm^2
	Rdc = l / sigma_scaled / S_coil     # 单匝直流电阻
	Gamma = d / d_skin / np.sqrt(2)


	N_vertical = np.floor(core_params['EE'] * 2 * 0.8 / D)
	N_vertical = max(N_vertical, 1)
	N_horizontal = np.ceil(N / N_vertical)
	N_horizontal = int(N_horizontal)


	for i in range(N_horizontal):
		if i == (N_horizontal-1):
			N_layer = N - N_vertical*(N_horizontal-1)
		else:
			N_layer = N_vertical
		Fr = 1 + (Gamma**4) / 192 * (1/6 + strands * pf * (np.pi**2) / 4 * (16 * (i+1)**2 - 1 + 24 / np.pi**2))
		P += Fr * Rdc * N_layer * (I**2)
	return P

def _estimate_core_loss(N: int, L: float, core_params: dict, D_arr: np.ndarray, Delta_I_arr: np.ndarray, I_rms: float, f_sw: float, wire_params: dict):
	
	sigma = 5.8e7  # S/m
	mu0 = 4e-7 * np.pi
	mu0_scaled = mu0 * 1e-3
	sigma_scaled = sigma * 1e-3
	k = 0.0071155 * 1e-3  # Steinmetz系数， 单位：mW/cm^3
	alpha = 1.88
	beta = 2.52
	single_strand_diameter = wire_params['single_strand_diameter'] # mm
	d_skin = np.sqrt(1 / (np.pi * f_sw * mu0_scaled * sigma_scaled))  # 当前开关频率下的趋肤深度

	T_sw = 1 / f_sw

	# b = core_params['DD']
	# a = core_params['CC']
	# c = core_params['EE']
	# w = (core_params['BB'] - core_params['CC']) / 2
	# Ae = _clip_positive(b) * _clip_positive(a)  # mm^2
	# Ve = (2 * a + 2 * w) * b * (c + 0.5 * a) * 2 # mm^3
	# print('name: ', core_params['name'], 'Ae: ', Ae, 'Ve: ', Ve)

	Ae = core_params['Ae']  # mm^2
	Ve = core_params['Ve'] # mm^3
	# print('name: ', core_params['name'], 'Ae: ', Ae, 'Ve: ', Ve)
	delta = N**2 * mu0_scaled * Ae / (2 * L)
	# 计算每个采样点的磁通密度序列
	# 各变量单位：L: H, I_delta_on_arr: A, I_delta_off_arr: A, N: 匝数, Ae: mm^2, B_delta_on_arr: T, B_delta_off_arr: T
	D_arr = np.clip(D_arr, 0.01, 0.99)
	I_delta_on_arr = Delta_I_arr / (D_arr * T_sw)
	I_delta_off_arr = Delta_I_arr / ((1.0 - D_arr) * T_sw)
	
	B_delta_on_arr = L * I_delta_on_arr / (N * Ae * 1e-6)
	B_delta_off_arr = L * I_delta_off_arr / (N * Ae * 1e-6)
	Delta_B_arr = L * Delta_I_arr / (N * Ae * 1e-6)
	# print('B_delta_on_arr: ', B_delta_on_arr)i
	# print('B_delta_off_arr: ', B_delta_off_arr)
	ki = modified_coefficient(alpha, beta, k)
	P_core_density_arr = ki * (Delta_B_arr ** (beta - alpha)) * (D_arr * B_delta_on_arr ** alpha + (1 - D_arr) * B_delta_off_arr ** alpha)  # mW/cm^3

	# Steinmetz 公式计算每个采样点的磁损密度
	# P_core_density_arr = k * (float(f_sw) ** alpha) * ((0.5 * Delta_B_arr) ** beta)  # mW/cm^3
	P_core_density_arr = P_core_density_arr * 1e-6  # 换算为W/mm^3
	P_core_arr = P_core_density_arr * Ve
	# print('P_core_arr: ', np.mean(P_core_arr))

	w = (core_params['BB'] - core_params['CC']) / 2
	if 'EE' in core_params:
		l_N = (2 * (core_params['CC'] + w) + 2 * (core_params['DD'] + w))		# 绕组长度
	elif 'PQ' in core_params['name']:
		d = core_params['CC'] + w
		l_N = np.pi * d
	P_coil = copper_loss_ac(N, wire_params, single_strand_diameter, I_rms, l_N, core_params, d_skin)
	# print('P_coil: ', P_coil)

	# if 'EE' in core_params:
	# 	l_N = (2 * (core_params['CC'] + w) + 2 * (core_params['DD'] + w)) * N		# 绕组长度
	# elif 'PQ' in core_params['name']:
	# 	d = core_params['CC'] + w
	# 	l_N = np.pi * d * N
	# S_coil = wire_params['strands'] * np.pi * (single_strand_diameter/2)**2 # mm^2
	# R_coil = l_N / (sigma_scaled * S_coil)
	# P_coil = I_rms**2 * R_coil
	# print('P_coil: ', P_coil)

	return float(np.mean(P_core_arr)), float(P_coil), delta


def _estimate_switching_loss(V_ds: float, I_valley_arr: np.ndarray, I_peak_arr: np.ndarray, f_sw: float):
	"""
	估算功率开关的开关损耗：基于电流序列计算
	P_sw ≈ 0.5 * Vds * I_peak * (tr) * f_sw
	"""
	# MOSFET器件参数（用于归一化和能量估算）
	I_mos = 20.1             # MOSFET额定电流 (A)
	V_mos = 400            # MOSFET额定电压 (V)
	# 动态时间参数
	t_r_mos = 16.3e-9            # 开通上升时间 (s)
	t_f_mos = 7e-9            # 关断下降时间 (s)
	Q_rr_mos = 0            # 反向恢复电荷 (C)（数据手册未提供，忽略该项）
	k_trtf_mos = 2.5           # 上升/下降时间修正系数（考虑反向恢复等非理想因素）
	# 开通能量损耗（基于额定电压、电流、上升时间及修正因子）
	E_on_mos = 0.5 * t_r_mos * V_mos * I_mos * k_trtf_mos
	# 关断能量损耗
	E_off_mos = 0.5 * t_f_mos * V_mos * I_mos * k_trtf_mos
	# 体二极管反向恢复能量损耗
	E_rr_mos = 0.5 * Q_rr_mos * V_mos

	# ========================
	# 实际工况下的开关损耗功率计算
	# ========================
	# 上管开通损耗功率：按实际电压与电流比例缩放能量，再乘以频率
	P_on_up = np.abs(np.where(I_peak_arr < 0, E_on_mos * (I_peak_arr * V_ds) / (I_mos * V_mos) * _clip_positive(f_sw), 0.0))
	# 上管关断损耗功率
	P_off_up = np.abs(np.where(I_valley_arr < 0, E_off_mos * (I_valley_arr * V_ds) / (I_mos * V_mos) * _clip_positive(f_sw), E_rr_mos * (I_valley_arr * V_ds) / (I_mos * V_mos) * _clip_positive(f_sw)))
	# 下管开通损耗功率
	P_on_down = np.abs(np.where(I_valley_arr > 0, E_on_mos * (I_valley_arr * V_ds) / (I_mos * V_mos) * _clip_positive(f_sw), 0.0))
	# 下管关断损耗功率
	P_off_down = np.abs(np.where(I_peak_arr > 0, E_off_mos * (I_peak_arr * V_ds) / (I_mos * V_mos) * _clip_positive(f_sw), E_rr_mos * (I_peak_arr * V_ds) / (I_mos * V_mos) * _clip_positive(f_sw)))

	P_sw = np.mean(P_on_up) + np.mean(P_off_up) + np.mean(P_on_down) + np.mean(P_off_down)
	return float(P_sw)


def _estimate_conduction_loss(I_rms: float):
	"""
	估算导通损耗：P_cond ≈ I_rms^2 * Rds_on
	"""
	Rds_on_HF = 48e-3  # Ω，高频管导通电阻
	P_cond_HF = (float(I_rms) ** 2) * Rds_on_HF
	Rds_on_LF = 22e-3  # Ω，工频管导通电阻
	P_cond_LF = (float(I_rms) ** 2) * Rds_on_LF
	P_cond = np.mean(P_cond_HF) + np.mean(P_cond_LF)
	return float(P_cond)


def pfc_objective(
    x: np.ndarray,
    P_out: float = 500.0,
    V_in_rms: float = 220.0,
    f_sw: float = 100e3,
    V_out: float = 400.0,
) -> float:
	"""
	图腾柱 PFC 参数评估目标函数。
	输入参数向量 x 顺序：
	[L, N, core_id, wire_id]
	单位建议：
	- L: H
	- N: 匝数（无量纲）
	- core_id: 磁芯型号识别码（整数）
	- wire_id: 利兹线识别码（整数）

	返回值：标量（越大越好）。函数返回 -（磁芯损耗 + 开关损耗 + 导通损耗）的加权和。
	"""
	x = np.asarray(x, dtype=np.float64).reshape(-1)
	if x.size != 4:
		# 维度不符时给出极差值，避免优化器崩溃
		return -1e18

	L, N, core_id, wire_id = [float(v) for v in x.tolist()]
	N = int(N)
	core_id = int(core_id)
	wire_id = int(wire_id)
	
	# 根据磁芯型号获取尺寸参数
	core_params = get_core_parameters(core_id)
	
	# 根据利兹线型号获取线径参数
	wire_params = get_wire_parameters(wire_id)

	# ---------- 可调工况/权重（按项目修正） ----------
	w_core = 1.0  # 磁芯损耗权重
	w_sw = 1.0  # 开关损耗权重
	w_cond = 1.0  # 导通损耗权重
	w_coil = 1.0  # 绕组损耗权重

	# ---------- 电流与占空比估算（整周期采样） ----------
	I_valley_arr, I_peak_arr, D_arr, Delta_I_arr, I_rms, V_out, V_in_arr = _estimate_pfc_currents(P_out, V_in_rms, f_sw, L, V_out, n_samples=120)

	# print('I_peak_down_arr: ', I_peak_down_arr)
	# print('I_peak_up_arr: ', I_peak_up_arr)
	# print('I_rms: ', I_rms)
	# print('D_arr: ', D_arr)
	# print('V_out: ', V_out)
	# print('V_in_arr: ', V_in_arr)

	# ---------- 窗口系数约束检查 ----------
	# 计算窗口利用率
	Sw = calculate_Sw(N, wire_params['diameter'], core_params)
	
	# 窗口约束惩罚：如果窗口利用率超过1.0，添加大的惩罚项
	window_penalty = 0.0
	if Sw > 0.8:
		# 窗口利用率超限时的惩罚，与超限程度成正比
		excess_utilization = Sw - 0.8
		window_penalty = 1000.0 * excess_utilization  # 大惩罚系数

	# ---------- 各项损耗估算 ----------
	P_core, P_coil, delta = _estimate_core_loss(N, L, core_params, D_arr, Delta_I_arr, I_rms, f_sw, wire_params)
	P_sw = _estimate_switching_loss(V_out, I_valley_arr, I_peak_arr, f_sw)
	P_cond = _estimate_conduction_loss(I_rms)

	# ---------- 综合目标（越小越好 -> 取负号越大越好） ----------
	P_total = w_core * P_core + w_sw * P_sw + w_cond * P_cond + w_coil * P_coil + window_penalty
	return 5-float(P_total)


def pfc_objective_detailed(
    x: np.ndarray,
    P_out: float = 500.0,
    V_in_rms: float = 220.0,
    f_sw: float = 100e3,
    V_out: float = 400.0,
) -> tuple:
	"""
	图腾柱 PFC 参数评估目标函数（详细版本）。
	输入参数向量 x 顺序：
	[L, N, core_id, wire_id]
	
	返回值：(目标值, 详细指标字典)
	- 目标值：标量（越大越好）
	- 详细指标字典：包含各项损耗和电气参数
	"""
	x = np.asarray(x, dtype=np.float64).reshape(-1)
	if x.size != 4:
		# 维度不符时给出极差值，避免优化器崩溃
		return -1e18, {}

	L, N, core_id, wire_id = [float(v) for v in x.tolist()]
	N = int(N)
	core_id = int(core_id)
	wire_id = int(wire_id)
	
	# 根据磁芯型号获取尺寸参数
	core_params = get_core_parameters(core_id)
	core_name = core_params['name']
	core_description = core_params['description']


	# 根据利兹线型号获取线径参数
	wire_params = get_wire_parameters(wire_id)
	wire_description = wire_params['description']

	# ---------- 可调工况/权重（按项目修正） ----------
	w_core = 1.0  # 磁芯损耗权重
	w_sw = 1.0  # 开关损耗权重
	w_cond = 1.0  # 导通损耗权重
	w_coil = 1.0  # 绕组损耗权重

	# ---------- 电流与占空比估算（整周期采样） ----------
	I_valley_arr, I_peak_arr, D_arr, Delta_I_arr, I_rms, V_out, V_in_arr = _estimate_pfc_currents(P_out, V_in_rms, f_sw, L, V_out, n_samples=256)

	# ---------- 窗口系数约束检查 ----------
	# 计算窗口利用率
	Sw = calculate_Sw(N, wire_params['diameter'], core_params)
	
	# 窗口约束惩罚：如果窗口利用率超过1.0，添加大的惩罚项
	window_penalty = 0.0
	if Sw > 0.8:
		# 窗口利用率超限时的惩罚，与超限程度成正比
		excess_utilization = Sw - 0.8
		window_penalty = 1000.0 * excess_utilization  # 大惩罚系数

	# ---------- 各项损耗估算 ----------
	P_core, P_coil, delta = _estimate_core_loss(N, L, core_params, D_arr, Delta_I_arr, I_rms, f_sw, wire_params)
	P_sw = _estimate_switching_loss(V_out, I_valley_arr, I_peak_arr, f_sw)
	P_cond = _estimate_conduction_loss(I_rms)

	# ---------- 综合目标（越小越好 -> 取负号越大越好） ----------
	P_total = w_core * P_core + w_sw * P_sw + w_cond * P_cond + w_coil * P_coil + window_penalty
	
	# 计算效率
	efficiency = P_out / (P_out + P_total) * 100

	I_peak_max = np.max(I_peak_arr)
	# 找到I_peak_arr峰值的索引
	I_peak_idx = np.argmax(I_peak_arr)
	# 对应的I_valley_arr的值
	I_valley_at_peak = I_valley_arr[I_peak_idx]
	D_at_peak = D_arr[I_peak_idx]
	
	# 构建详细指标字典
	details = {
		'磁芯损耗 (W)': P_core,
		'绕组损耗 (W)': P_coil,
		'开关损耗 (W)': P_sw,
		'导通损耗 (W)': P_cond,
		'总损耗 (W)': P_total,
		'窗口利用率': Sw,
		'效率 (%)': efficiency,
		'气隙长度 (mm)': delta,
		'RMS电流 (A)': I_rms,
		'峰值电流 (A)': np.max(I_peak_arr),
		'仿真电流激励 (A)': [f_sw, D_at_peak, I_peak_max, I_valley_at_peak],
		'电感值 (μH)': L * 1e6,
		'匝数': N,
		'磁芯型号': f"{core_name} (ID:{core_id})",
		'磁芯描述': core_description,
		'磁芯截面积 (mm²)': core_params['Ae'],
		'磁芯体积 (mm³)': core_params['Ve'],
		# 利兹线相关信息
		'利兹线型号': f"{wire_description} (ID:{wire_id})",
		'单股线径 (mm)': 0.1,  # 固定为0.1mm
	}
	
	return -float(P_total), details


# 可选：给出一个默认边界供外部直接使用（单位同上）
def pfc_default_bounds():
	"""
	返回 4 维参数的默认下/上界（lower, upper）。
	参数顺序：[L, N, core_id, wire_id]
	这些边界仅为示例，实际应按磁芯库、工艺与电气约束修正。
	"""
	lower = np.array([
		50e-6,   # L: 50 uH
		1.0,     # N: 匝数
		0,       # core_id: 磁芯型号ID（最小）
		0,       # wire_id: 利兹线型号ID（最小）
	], dtype=np.float64)
	upper = np.array([
		1000e-6,  # L: 1000 uH
		100.0,     # N: 匝数
		len(MAGNETIC_CORE_DATABASE) - 1,  # core_id: 磁芯型号ID（最大）
		len(LITZ_WIRE_DATABASE) - 1,      # wire_id: 利兹线型号ID（最大）
	], dtype=np.float64)
	return lower, upper
