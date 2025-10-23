import numpy as np
import matplotlib.pyplot as plt

############ 电路参数 #############
Vdc_peak = 311  # 交流输入峰值电压 (220V RMS)
f_line = 50  # 电网频率
L = 0.0003  # 电感 (300uH)
C = 0.000470  # 输出电容 (470uF)
R_load = 100  # 负载电阻 (100Ω)
V_ref = 400  # 目标输出电压

# 时间参数
T_sampling = 5e-6  # 采样周期 (5us)
T_switching = 1e-4  # 开关周期 (100us, 10kHz)
control_ratio = int(T_switching / T_sampling)  # 控制周期比

# 控制参数
Kp_current = 0.0002  # 电流环比例系数
Ki_current = 0.0001  # 电流环积分系数
Kp_voltage = 0.0001  # 电压环比例系数
Ki_voltage = 0.001  # 电压环积分系数

# 仿真时长
sim_time = 0.1  # 总仿真时间 (100ms)
n_samples = int(sim_time / T_sampling)
control_samples = int(sim_time / T_switching)
############ END #############

########## 初始化变量 ########
# 电路状态
Vo = 0  # 输出电压
iL = 0  # 电感电流
Vin = 0  # 输入电压
duty = 0.5  # 初始占空比

# 控制变量
duty_count = 0
error_voltage_sum = 0
error_current_sum = 0

# 数据记录
Vo_plot = []
iL_plot = []
Vin_plot = []
duty_plot = []
time_axis = []
############ END #############

########## 主仿真循环 ########
for i in range(n_samples):
    t = i * T_sampling

    # 1. 生成输入交流电压 (50Hz正弦波)
    Vin = Vdc_peak * np.sin(2 * np.pi * f_line * t)

    # 2. 更新开关状态 (在每个开关周期开始时更新占空比)
    if i % control_ratio == 0:
        # 电压外环 PI 控制 (输出决定电流参考幅值)
        error_voltage = V_ref - Vo
        error_voltage_sum += error_voltage
        I_ref_amp = Kp_voltage * error_voltage + Ki_voltage * error_voltage_sum

        # 电流内环 PI 控制 (参考电流是正弦波)
        I_ref = I_ref_amp * np.sin(2 * np.pi * f_line * t)
        error_current = I_ref - iL
        error_current_sum += error_current

        # 计算占空比 (限幅在0.01-0.95之间)
        duty = Kp_current * error_current + Ki_current * error_current_sum
        duty = max(0.01, min(0.95, duty))

        # 重置开关计数器
        duty_count = int(duty * control_ratio)

    # 3. 确定当前开关状态
    if duty_count > 0:
        switch_state = 1  # MOSFET导通
        duty_count -= 1
    else:
        switch_state = 0  # MOSFET关断，二极管导通

    # 4. Boost电路状态更新 (离散化模型)
    # 电感电流更新: diL/dt = [Vin - (1-s)*Vo]/L
    iL += (T_sampling / L) * (Vin - (1 - switch_state) * Vo)

    # 输出电压更新: dVo/dt = [ (1-s)*iL - Vo/R ]/C
    Vo += (T_sampling / C) * ((1 - switch_state) * iL - Vo / R_load)

    # 5. 记录数据
    Vo_plot.append(Vo)
    iL_plot.append(iL)
    Vin_plot.append(Vin)
    duty_plot.append(switch_state)
    time_axis.append(t * 1000)  # 转换为毫秒

########## 结果可视化 ########
plt.figure(figsize=(12, 10))

# 输出电压波形
plt.subplot(4, 1, 1)
plt.plot(time_axis, Vo_plot, 'b')
plt.axhline(y=V_ref, color='r', linestyle='--', label='参考电压')
plt.ylabel('输出电压 (V)')
plt.title('Boost PFC 仿真结果')
plt.legend()
plt.grid(True)

# 输入电压和电感电流
plt.subplot(4, 1, 2)
plt.plot(time_axis, Vin_plot, 'g', label='输入电压')
plt.plot(time_axis, iL_plot, 'orange', label='电感电流')
plt.ylabel('电压/电流')
plt.legend()
plt.grid(True)

# 输入电压和电流的相位关系
plt.subplot(4, 1, 3)
plt.plot(time_axis, [v / 100 for v in Vin_plot], 'g', label='输入电压(x0.01)')
plt.plot(time_axis, iL_plot, 'orange', label='电感电流')
plt.xlim(80, 100)  # 展示稳定后的波形
plt.ylabel('相位关系')
plt.xlabel('时间 (ms)')
plt.legend()
plt.grid(True)

# 开关状态
plt.subplot(4, 1, 4)
plt.plot(time_axis, duty_plot, 'r')
plt.ylabel('开关状态')
plt.xlabel('时间 (ms)')
plt.yticks([0, 1], ['关断', '导通'])
plt.ylim(-0.5, 1.5)
plt.grid(True)

plt.tight_layout()
plt.show()
