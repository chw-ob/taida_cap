# plotter.py
import matplotlib.pyplot as plt
import sys
import json


def plot_efficiency(power_list, efficiency_list):
    """绘制功率-效率曲线"""
    plt.rcParams["font.family"] = ["SimSun", "Times New Roman"]  # 优先宋体（中文），其次Times New Roman（西文）
    plt.rcParams["axes.unicode_minus"] = False  # 解决负号显示问题
    plt.figure(figsize=(8, 5))
    plt.plot(power_list, efficiency_list, 'bo-', label='效率线')
    plt.xlabel('功率')
    plt.ylabel('效率')
    plt.title('功率-效率图')
    plt.legend()
    plt.grid(True)
    plt.show()  # 在主线程显示图像，避免线程错误


if __name__ == '__main__':
    # 从命令行参数接收数据（通过JSON序列化传递列表）
    if len(sys.argv) != 3:
        print("Usage: python plotter.py <power_list_json> <efficiency_list_json>")
        sys.exit(1)

    # 解析JSON数据为Python列表
    power_list = json.loads(sys.argv[1])
    efficiency_list = json.loads(sys.argv[2])

    # 调用绘图函数（在主线程执行，避免GUI错误）
    plot_efficiency(power_list, efficiency_list)