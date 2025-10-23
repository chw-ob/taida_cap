import xml.etree.ElementTree as ET
import re
import subprocess,threading
def extract_between(text, start="{A}", end="{B}"):
    # 构建正则表达式（转义特殊字符，支持动态传入start和end）
    pattern = re.escape(start) + "(.*?)" + re.escape(end)
    # 查找所有匹配结果
    matches = re.findall(pattern, text, re.DOTALL)  # re.DOTALL让.匹配换行符
    return matches
def parse_stm32_test_xml(xml_path):
    # 解析XML文件
    tree = ET.parse(xml_path)
    root = tree.getroot()

    # 存储设备数据的字典
    device_data = {}

    # 遍历所有测试用例
    for test in root.findall(".//test"):
        # 遍历测试用例中的关键字
        for kw in test.findall(".//kw"):
            # 查找读取电压的关键字
            if kw.get("name") == "Read Voltage From Device":
                device_id = None
                voltage = None
                # 获取设备ID
                # 获取电压值
                for msg in kw.findall(".//msg"):
                    try:
                        if "设备" in msg.text:
                            voltage_id = extract_between(msg.text,"向设备","发送读取电压命令")
                            device_id=voltage_id[0].strip()
                        elif msg.text.startswith("${voltage} = "):
                            time_stamp = msg.get("timestamp")
                            voltage = float(msg.text.split(" = ")[1])
                    except Exception as e:
                        print(f"Error processing message: {msg.text}. Error: {str(e)}")
                if device_id and voltage is not None:
                    if device_id not in device_data:
                        device_data[device_id] = {"voltage": [], "current": []}
                    device_data[device_id]["voltage"].append({"timestamp":time_stamp,"voltage":voltage})

            # 查找读取电流的关键字
            elif kw.get("name") == "Read Current From Device":
                # 获取设备ID
                # 获取电流值
                device_id = None
                current = None
                time_stamp = None
                # 获取设备ID
                # 获取电压值
                for msg in kw.findall(".//msg"):
                    try:
                        if "设备" in msg.text:
                            #print(f"msg.text: {msg.text}")
                            voltage_id = extract_between(msg.text, "向设备", "发送读取电流命令")
                            device_id = voltage_id[0].strip()
                        elif msg.text.startswith("${current} = "):
                            #print(f"msg.timestamp: {msg.get("timestamp")}")
                            time_stamp=msg.get("timestamp")
                            current = float(msg.text.split(" = ")[1])
                    except Exception as e:
                        print(f"Error processing message: {msg.text}. Error: {str(e)}")
                    if device_id and current is not None:
                        if device_id not in device_data:
                            device_data[device_id] = {"voltage": [], "current": []}
                        device_data[device_id]["current"].append({"timestamp":time_stamp,"current":current})
    return device_data
'''输入电流测量:device1
输入电压测量:device1
输出电流测量:device2
输出电压测量:device2'''
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
def read_current(key,print):
    try:
        # 执行命令并指定编码为 UTF-8
        command=['robot','--test',f'测试读取设备{key}电流',r'E:\study\S1\taida_cap\PFC_Autotest\STM32_Test_Suite.robot']
        thread=threading.Thread(
            target=capture_subprocess_realtime,
            args=(command,print),
        )
        thread.start()
        thread.join()

        # 打印标准输出
        '''print("命令输出:")
        print(result.stdout)

        # 如果有错误输出也打印出来
        if result.stderr:
            print("\n错误输出:")
            print(result.stderr)'''

    except Exception as e:
        print(f"执行命令时发生错误: {str(e)}")

def read_voltage(key,print):
    try:
        # 执行命令并指定编码为 UTF-8
        result = subprocess.run(
            ['robot','--test',f'测试读取设备{key}电压',r'E:\study\S1\taida_cap\PFC_Autotest\STM32_Test_Suite.robot'],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            encoding='utf-8',  # 显式指定编码
            errors='replace'  # 遇到无法解码的字符时替换
        )

        # 打印标准输出
        print("命令输出:")
        print(result.stdout)

        # 如果有错误输出也打印出来
        if result.stderr:
            print("\n错误输出:")
            print(result.stderr)

    except Exception as e:
        print(f"执行命令时发生错误: {str(e)}")

def efficient_test(print):
    try:
        # 执行命令并指定编码为 UTF-8
        result = subprocess.run(
            ['robot','--test',f'测试设备效率计算',r'E:\study\S1\taida_cap\PFC_Autotest\STM32_Test_Suite.robot'],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            encoding='utf-8',  # 显式指定编码
            errors='replace'  # 遇到无法解码的字符时替换
        )

        # 打印标准输出
        print("命令输出:")
        print(result.stdout)

        # 如果有错误输出也打印出来
        if result.stderr:
            print("\n错误输出:")
            print(result.stderr)

    except Exception as e:
        print(f"执行命令时发生错误: {str(e)}")
# 使用示例
def parse_stm32_test_xml_print(print):
    xml_path = r"E:\study\S1\taida_cap\output.xml"  # 替换为你的XML文件路径
    device_data = parse_stm32_test_xml(xml_path)
    if device_data == {}:
        print("未检测到测试数据，请检查测试流程是否正确执行\n")
        return
    print(f"开始解析测试结果\n")
    for key, value in device_data.items():
        print(f"**{key}**测试结果如下\n")
        if value["current"] == []:
            pass
        else:
            print(f"电流测量结果如下\n")
            for data_point in value["current"]:
                print(f"timestamp:{data_point['timestamp']}  电流值: {data_point['current']}A\n")
        if value["voltage"] == []:
            pass
        else:
            print(f"电压测量结果如下\n")
            for data_point in value["voltage"]:
                print(f"timestamp:{data_point['timestamp']}  电压值: {data_point['voltage']}V\n")
    print("结束#auto_test结束")
if __name__ == "__main__":
    xml_path = r"E:\study\S1\taida_cap\output.xml"  # 替换为你的XML文件路径
    result = parse_stm32_test_xml(xml_path)
    import pprint

    pprint.pprint(result)