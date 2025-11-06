import threading,subprocess
def realtime_read(stream, callback):
    """实时读取流并调用回调函数处理输出"""
    for line in iter(stream.readline, ''):  # 迭代读取每行输出，直到空字符串
        callback(line)
    stream.close()  # 读取完毕后关闭流
def capture_subprocess_realtime(command,print):
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
        print(f"{line}", end='')  # end='' 避免重复换行（原输出已包含换行）

    # 定义 stderr 回调函数（实时处理错误输出）
    def handle_stderr(line):
        print(f"{line}", end='')

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
process_str=r"E:\study\S1\taida_cap\优化程序\param_optimization.py"
def random(print,iters,seed):
    command = [
        r'python',
        process_str,
        '--algo', 'random',
        '--iters', f'{iters}',
        '--seed', f'{seed}'
    ]
    #print(command)
    capture_subprocess_realtime(command,print)
    pass
def GA(print,iters,seed,pop_size):
    command = [
        r'python',
        process_str,
        '--algo', 'ga',
        '--iters', f'{iters}',
        '--seed', f'{seed}',
        '--pop', f'{pop_size}'
    ]
    #print(command)
    capture_subprocess_realtime(command, print)
def pso(print,iters,seed,swarm_size):
    command = [
        r'python',
        process_str,
        '--algo', 'pso',
        '--iters', f'{iters}',
        '--seed', f'{seed}',
        '--pop', f'{swarm_size}'
    ]
    #print(command)
    capture_subprocess_realtime(command, print)
    pass
def ddpg(print,iters,seed,pop,noise_end,lr_gamma):
    command = [
        r'python',
        process_str,
        '--algo', 'ddpg',
        '--iters', f'{iters}',
        '--seed', f'{seed}',
        '--noise_end', f'{noise_end}',
        '--lr_gamma', f'{lr_gamma}',
        '--pop', f'{pop}'
    ]
    #print(command)
    capture_subprocess_realtime(command, print)
    pass
def td3(print,iters,seed,pop,noise_end,lr_gamma):
    command = [
        r'python',
        process_str,
        '--algo', 'td3',
        '--iters', f'{iters}',
        '--seed', f'{seed}',
        '--noise_end', f'{noise_end}',
        '--lr_gamma', f'{lr_gamma}',
        '--pop', f'{pop}'
    ]
    #print(command)
    capture_subprocess_realtime(command, print)
    pass
if __name__ == '__main__':
    td3(100,1,10,0.1,0.99)