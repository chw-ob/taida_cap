import numpy as np
import matplotlib.pyplot as plt
import matplotlib.font_manager as fm

# 设置中文字体
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False


# PID控制器结构
class PIDController:
    def __init__(self, kp, ki, kd, ts, out_min, out_max, int_max):
        self.kp = kp
        self.ki = ki
        self.kd = kd
        self.ts = ts
        self.out_min = out_min
        self.out_max = out_max
        self.int_max = int_max
        self.i_out = 0
        self.p_out = 0
        self.d_out = 0
        self.out = 0
        self.ref = 0
        self.fdb = 0
        self.last_error = 0

    def calculate(self, ref, fdb):
        self.ref = ref
        self.fdb = fdb
        error = self.ref - self.fdb

        # 比例项计算
        self.p_out = self.kp * error

        # 积分项计算
        self.i_out += self.ki * error * self.ts
        self.i_out = np.clip(self.i_out, -self.int_max, self.int_max)

        # 微分项计算
        self.d_out = self.kd * (error - self.last_error) / self.ts
        self.last_error = error

        # 输出总和及限幅
        self.out = self.p_out + self.i_out + self.d_out
        self.out = np.clip(self.out, self.out_min, self.out_max)

        return self.out

    def clear(self):
        self.i_out = 0
        self.p_out = 0
        self.d_out = 0
        self.out = 0
        self.last_error = 0


############ 电路参数 #############
Vdc_peak = 40  # 交流输入峰值电压
f_line = 50  # 电网频率(Hz)
L = 0.001  # 电感(1mH)
C = 0.00080  # 输出电容(100uF)
R_load = 20  # 负载电阻(20Ω)

# 时间参数
T_sampling = 1e-6  # 采样周期(1us)
T_switching = 1e-4  # 开关周期(100us, 10kHz)
control_ratio = int(T_switching / T_sampling)  # 控制周期比

# 电压外环参数（慢速控制）
T_voltage_loop = 1e-2  # 电压环控制周期(1ms)
voltage_loop_ratio = int(T_voltage_loop / T_sampling)  # 电压环控制周期比

# 控制参数
Kp_current = 0.15  # 电流环比例系数
Ki_current = 400  # 电流环积分系数
Kp_voltage = 0.02 # 电压环比例系数
Ki_voltage = 250  # 电压环积分系数
V_ref = 80  # 输出电压参考值(V)

# PID控制器初始化
current_pid = PIDController(
    kp=Kp_current,
    ki=Ki_current,
    kd=0,
    ts=T_switching,
    out_min=0.05,  # 最小占空比5%
    out_max=0.95,  # 最大占空比95%
    int_max=0.8  # 积分限幅80%
)

voltage_pid = PIDController(
    kp=Kp_voltage,
    ki=Ki_voltage,
    kd=0,
    ts=T_voltage_loop,
    out_min=0,  # 最小电流参考
    out_max=20,  # 最大电流参考(10A)
    int_max=17  # 积分限幅8A
)

# 仿真时长
sim_time = 0.1  # 总仿真时间(200ms)
n_samples = int(sim_time / T_sampling)
control_samples = int(sim_time / T_switching)

########## 初始化变量 ########
# 电路状态
Vo = 0  # 输出电压初始值设为0
iL = 0  # 电感电流
Vin = 0  # 输入电压
duty = 0  # 初始占空比
I_ref_amp = 0  # 初始电流参考幅值

# 数据记录
Vo_plot = []
iL_plot = []
Vin_plot = []
I_ref_plot = []
duty_plot = []
time_axis = []
switch_state_plot = []
iL_samples = []  # 用于存储一个周期内的电流采样
Vo_samples = []  # 用于存储电压环周期内的输出电压采样

print("开始Boost PFC双环控制仿真(电压外环+电流内环)...")
print(f"仿真时长: {sim_time * 1000}ms")
print(f"采样点数: {n_samples}")
print(f"输出电压参考值: {V_ref}V")

########## 主仿真循环 ########
for i in range(n_samples):
    t = i * T_sampling

    # 1. 生成输入交流电压
    Vin = Vdc_peak * np.sin(2 * np.pi * f_line * t)

    # 在每个开关周期内采样电流和电压
    iL_samples.append(iL)
    Vo_samples.append(Vo)

    # 2. 电压外环控制（慢速控制）
    if i % voltage_loop_ratio == 0:
        # 计算周期平均输出电压
        Vo_avg = np.mean(Vo_samples) if Vo_samples else 0
        Vo_samples = []  # 清空采样缓存

        # 电压PID控制计算电流参考幅值
        I_ref_amp = voltage_pid.calculate(V_ref, Vo_avg)

    # 3. 电流内环控制（快速控制）
    if i % control_ratio == 0:
        # 计算周期平均电流
        iL_avg = np.mean(iL_samples) if iL_samples else 0
        iL_samples = []  # 清空采样缓存

        # 电流参考(与输入电压同相位)
        I_ref = I_ref_amp * np.sin(2 * np.pi * f_line * t)

        # PID控制计算占空比
        duty = current_pid.calculate(abs(I_ref), iL_avg)

        # 重置开关计数器
        duty_count = int(duty * control_ratio)

    # 4. 确定当前开关状态
    switch_state = 1 if (i % control_ratio) < duty_count else 0

    # 5. 电路状态更新
    if switch_state == 1:  # MOSFET导通
        diL_dt = abs(Vin) / L
        dVo_dt = -Vo / (R_load * C)
    else:  # MOSFET关断
        diL_dt = (abs(Vin) - Vo) / L
        dVo_dt = (iL - Vo / R_load) / C

    # 更新状态变量
    iL += diL_dt * T_sampling
    Vo += dVo_dt * T_sampling

    # 6. 记录数据
    Vo_plot.append(Vo)
    iL_plot.append(iL)
    Vin_plot.append(abs(Vin))
    I_ref_plot.append(I_ref_amp * np.sin(2 * np.pi * f_line * t))
    duty_plot.append(duty)
    switch_state_plot.append(switch_state)
    time_axis.append(t * 1000)  # 转换为毫秒

########## 结果可视化 ########
plt.figure(figsize=(12, 12))

# 输入电压和电感电流
plt.subplot(5, 1, 1)
plt.plot(time_axis, Vin_plot, 'g', label='输入电压')
plt.plot(time_axis, iL_plot, 'orange', label='实际电感电流')
plt.plot(time_axis, I_ref_plot, 'r--', label='参考电流')
plt.ylabel('电压/电流 (V/A)')
plt.title('Boost PFC双环控制仿真(电压外环+电流内环)')
plt.legend(loc='upper right')  # Specify explicit location
plt.grid(True)

# 输出电压
plt.subplot(5, 1, 2)
plt.plot(time_axis, Vo_plot, 'b', label='输出电压')
plt.axhline(y=V_ref, color='r', linestyle='--', label='参考电压')
plt.ylabel('电压 (V)')
plt.title('输出电压')
plt.legend(loc='upper right')  # Specify explicit location
plt.grid(True)

# 电流跟踪细节
plt.subplot(5, 1, 3)
plt.plot(time_axis, iL_plot, 'orange', label='实际电感电流')
plt.plot(time_axis, I_ref_plot, 'r--', label='参考电流')
plt.xlim(20, 30)  # 展示中间段的波形
plt.ylabel('电流 (A)')
plt.title('电流跟踪细节 (20-30ms)')
plt.legend(loc='upper right')  # Specify explicit location
plt.grid(True)

# 占空比变化
plt.subplot(5, 1, 4)
plt.plot(time_axis, duty_plot, 'b')
plt.ylabel('占空比')
plt.title('占空比变化')
plt.grid(True)

# 开关状态
plt.subplot(5, 1, 5)
plt.plot(time_axis, switch_state_plot, 'm')
plt.ylabel('开关状态')
plt.xlabel('时间 (ms)')
plt.title('开关状态变化')
plt.grid(True)

plt.tight_layout()

plt.show()

# 计算性能指标
start_idx = int(0.05 / T_sampling)  # 忽略初始50ms
end_idx = n_samples

# 功率因数计算
P_in = np.mean(np.array(Vin_plot[start_idx:end_idx]) * np.array(iL_plot[start_idx:end_idx]))
S_in = np.sqrt(np.mean(np.array(Vin_plot[start_idx:end_idx]) ** 2)) * np.sqrt(
    np.mean(np.array(iL_plot[start_idx:end_idx]) ** 2))
power_factor = P_in / S_in if S_in > 0 else 0

# 电流跟踪误差
current_error = np.array(iL_plot[start_idx:end_idx]) - np.array(I_ref_plot[start_idx:end_idx])
rmse_current_error = np.sqrt(np.mean(current_error ** 2))

# 电压跟踪误差
voltage_error = np.array(Vo_plot[start_idx:end_idx]) - V_ref
rmse_voltage_error = np.sqrt(np.mean(voltage_error ** 2))

print("\n仿真结果分析:")
print(f"输出电压范围: {min(Vo_plot[start_idx:]):.1f}V - {max(Vo_plot[start_idx:]):.1f}V")
print(f"输出电压平均值: {np.mean(Vo_plot[start_idx:]):.1f}V")
print(f"电压跟踪均方根误差: {rmse_voltage_error:.3f}V")
print(f"电流跟踪均方根误差: {rmse_current_error:.3f}A")
print(f"输入功率: {P_in:.1f}W")
print(f"视在功率: {S_in:.1f}VA")
print(f"功率因数: {power_factor:.4f}")
