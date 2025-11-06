# main.py
import asyncio
import json
from subprocess import PIPE


async def async_run_plotter(power_list, efficiency_list):
    """异步执行绘图程序并传递数据"""
    # 将列表序列化为JSON字符串（解决命令行参数传递列表的问题）
    power_json = json.dumps(power_list)
    efficiency_json = json.dumps(efficiency_list)

    # 异步启动子进程执行绘图脚本
    process = await asyncio.create_subprocess_exec(
        'python', r'E:\study\S1\taida_cap\数据分析\数据分析1.py',  # 调用绘图脚本
        power_json, efficiency_json,  # 传递序列化后的参数
        stdout=PIPE,
        stderr=PIPE
    )

    # 等待子进程完成，捕获输出和错误
    stdout, stderr = await process.communicate()

    # 处理可能的错误
    if process.returncode != 0:
        raise RuntimeError(f"绘图程序执行失败: {stderr.decode('utf-8')}")
    print("绘图完成:", stdout.decode('utf-8'))


# 测试示例
if __name__ == '__main__':
    # 示例数据
    test_power = [10, 20, 30, 40, 50]
    test_efficiency = [0.75, 0.82, 0.85, 0.83, 0.78]

    # 异步运行绘图程序
    asyncio.run(async_run_plotter(test_power, test_efficiency))