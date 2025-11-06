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
from 优化程序.ansys_validation import update_and_simulate
def ansys_validation(print, excitation,core_id, N,core_gap):
    ansys_files_path=r"E:\study\S1\taida_cap\OBC.aedt"
    update_and_simulate(print,ansys_files_path,'PFC',"PFC",core_id, core_gap,N, excitation)
    #print(command)
    #capture_subprocess_realtime(command,print)
    pass
if __name__ == '__main__':
    ansys_validation(print,[100000,0.7778,4.4531,1.975],0,30,5)