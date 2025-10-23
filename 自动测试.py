import subprocess
import threading

def realtime_read(stream, callback):
    """实时读取流并调用回调函数处理输出"""
    for line in iter(stream.readline, ''):  # 迭代读取每行输出，直到空字符串
        callback(line)
    stream.close()  # 读取完毕后关闭流

def capture_subprocess_realtime(command):
    """实时捕获 subprocess 的 stdout 和 stderr"""
    # 启动进程，stdout 和 stderr 都用管道捕获
    process = subprocess.Popen(
        command,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
        encoding='utf-8',
        errors='replace'
    )

    # 定义 stdout 回调函数（实时处理标准输出）
    def handle_stdout(line):
        print(f"【实时输出】{line}", end='')  # end='' 避免重复换行（原输出已包含换行）

    # 定义 stderr 回调函数（实时处理错误输出）
    def handle_stderr(line):
        print(f"【错误输出】{line}", end='')

    # 创建线程分别处理 stdout 和 stderr
    stdout_thread = threading.Thread(
        target=realtime_read,
        args=(process.stdout, handle_stdout)
    )
    stderr_thread = threading.Thread(
        target=realtime_read,
        args=(process.stderr, handle_stderr)
    )

    # 启动线程
    stdout_thread.start()
    stderr_thread.start()

    # 等待进程结束和线程完成
    process.wait()
    stdout_thread.join()
    stderr_thread.join()

    return process.returncode  # 返回进程退出码


# 测试：实时捕获 robot 命令的输出
if __name__ == "__main__":
    key = 1  # 假设 key 是设备编号
    # 构造命令（与你的原命令一致）
    command = [
        'robot',
        '--test', f'测试读取设备{key}电压',
        r'E:\study\S1\taida_cap\PFC_Autotest\STM32_Test_Suite.robot'
    ]

    print("开始执行命令，实时捕获输出...\n")
    return_code = capture_subprocess_realtime(command)
    print(f"\n命令执行完毕，退出码：{return_code}")