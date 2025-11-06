import json
import xml.etree.ElementTree as ET
import re
import subprocess,threading
import time
# 配置文件路径
CONFIG_FILE = r"E:\study\S1\taida_cap\PFC_Autotest\instrument_config.json"
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
def inst_setting(print,source, load, inputmeas_inst, outputmeas_inst):
    """
    仪器设置函数 - 保存或更新仪器配置（每次执行会覆盖原有配置
    参数:
        source: 源设备
        load: 负载设备
        inputmeas_vol_inst: 输入电压测量仪器
        inputmeas_cur_inst: 输入电流测量仪器
        outputmeas_vol_inst: 输出电压测量仪器
        outputmeas_cur_inst: 输出电流测量仪器

    返回:
        bool: 成功返回True，失败返回False
    """
    # 创建配置字典
    instrument_config = {
        "source": source,
        "load": load,
        "inputmeas_inst": inputmeas_inst,
        "outputmeas_inst": outputmeas_inst
    }

    # 保存到文件（直接覆盖）
    try:
        with open(CONFIG_FILE, 'w', encoding='utf-8') as f:
            json.dump(instrument_config, f, indent=4, ensure_ascii=False)
        print("仪器配置保存成功！")
        return True
    except IOError as e:
        print(f"保存配置失败: {e}")
        return False

def read_inputCurrent(print):
    try:
        config_file_path = r'E:\study\S1\taida_cap\PFC_Autotest\instrument_config.json'

        with open(config_file_path, 'r', encoding='utf-8') as f:
            config = json.load(f)

        # 执行命令并指定编码为 UTF-8
        command = [
                'robot',
                '--test', '测量输入电流',
                '--variable', f'INSTRUMENT_IN:{config["inputmeas_inst"]}',
                r'E:\study\S1\taida_cap\PFC_Autotest\Auto_test.robot'
            ]
        print(command)
        thread=threading.Thread(
            target=capture_subprocess_realtime,
            args=(command,print),
        )
        thread.start()
        thread.join()

    except Exception as e:
        print(f"执行命令时发生错误: {str(e)}")

def read_outputCurrent(print):
    try:
        config_file_path = r'E:\study\S1\taida_cap\PFC_Autotest\instrument_config.json'

        with open(config_file_path, 'r', encoding='utf-8') as f:
            config = json.load(f)

        # 执行命令并指定编码为 UTF-8
        command = [
                'robot',
                '--test', '测量输出电流',
                '--variable', f'INSTRUMENT_OUT:{config["outputmeas_inst"]}',
                r'E:\study\S1\taida_cap\PFC_Autotest\Auto_test.robot'
            ]
        # 打印标准输出
        thread = threading.Thread(
            target=capture_subprocess_realtime,
            args=(command, print),
        )
        thread.start()
        thread.join()

    except Exception as e:
        print(f"执行命令时发生错误: {str(e)}")

def read_outputVoltage(print):
    try:
        config_file_path = r'E:\study\S1\taida_cap\PFC_Autotest\instrument_config.json'

        with open(config_file_path, 'r', encoding='utf-8') as f:
            config = json.load(f)

        # 执行命令并指定编码为 UTF-8
        command = [
                'robot',
                '--test', '测量输出电压',
                '--variable', f'INSTRUMENT_OUT:{config["outputmeas_inst"]}',
                r'E:\study\S1\taida_cap\PFC_Autotest\Auto_test.robot'
            ]
        # 打印标准输出
        thread = threading.Thread(
            target=capture_subprocess_realtime,
            args=(command, print),
        )
        thread.start()
        thread.join()

    except Exception as e:
        print(f"执行命令时发生错误: {str(e)}")


def read_inputVoltage(print):
    try:
        config_file_path = r'E:\study\S1\taida_cap\PFC_Autotest\instrument_config.json'

        with open(config_file_path, 'r', encoding='utf-8') as f:
            config = json.load(f)

        # 执行命令并指定编码为 UTF-8
        command = [
                'robot',
                '--test', '测量输入电压',
                '--variable', f'INSTRUMENT_IN:{config["inputmeas_inst"]}',
                r'E:\study\S1\taida_cap\PFC_Autotest\Auto_test.robot'
            ]
        # 打印标准输出
        thread = threading.Thread(
            target=capture_subprocess_realtime,
            args=(command, print),
        )
        thread.start()
        thread.join()

    except Exception as e:
        print(f"执行命令时发生错误: {str(e)}")

def read_inputPower(print):
    try:
        config_file_path = r'E:\study\S1\taida_cap\PFC_Autotest\instrument_config.json'

        with open(config_file_path, 'r', encoding='utf-8') as f:
            config = json.load(f)

        # 执行命令并指定编码为 UTF-8
        command = [
                'robot',
                '--test', '测量输入功率',
                '--variable', f'INSTRUMENT_IN:{config["inputmeas_inst"]}',
                r'E:\study\S1\taida_cap\PFC_Autotest\Auto_test.robot'
            ]
        # 打印标准输出
        thread = threading.Thread(
            target=capture_subprocess_realtime,
            args=(command, print),
        )
        thread.start()
        thread.join()

    except Exception as e:
        print(f"执行命令时发生错误: {str(e)}")

def read_outputPower(print):
    try:
        # 执行命令并指定编码为 UTF-8
        # 读取仪器配置JSON文件
        config_file_path = r'E:\study\S1\taida_cap\PFC_Autotest\instrument_config.json'

        with open(config_file_path, 'r', encoding='utf-8') as f:
            config = json.load(f)

        # 执行命令并指定编码为 UTF-8
        command = [
                'robot',
                '--test', '测量输出功率',
                '--variable', f'INSTRUMENT_OUT:{config["inputmeas_inst"]}',
                r'E:\study\S1\taida_cap\PFC_Autotest\Auto_test.robot'
            ]
        # 打印标准输出
        thread = threading.Thread(
            target=capture_subprocess_realtime,
            args=(command, print),
        )
        thread.start()
        thread.join()

    except Exception as e:
        print(f"执行命令时发生错误: {str(e)}")

def set_source(print,input_voltage,input_current_limit,frequency):
    try:
        # 执行命令并指定编码为 UTF-8
        # 读取仪器配置JSON文件
        config_file_path = r'E:\study\S1\taida_cap\PFC_Autotest\instrument_config.json'

        with open(config_file_path, 'r', encoding='utf-8') as f:
            config = json.load(f)
        result = subprocess.run(
            [
                'robot',
                '--test', '设置电源参数',
                '--variable', f'INSTRUMENT_SOURCE:{config["source"]}',
                '--variable', f'SOURCE_VOLTAGE:{input_voltage}',
                '--variable', f'SOURCE_CURRENT:{input_current_limit}',
                '--variable', f'FREQUENCY:{frequency}',
                r'E:\study\S1\taida_cap\PFC_Autotest\Auto_test.robot'
            ],
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

def source_on(print):
    try:
        # 执行命令并指定编码为 UTF-8
        # 读取仪器配置JSON文件
        config_file_path = r'E:\study\S1\taida_cap\PFC_Autotest\instrument_config.json'

        with open(config_file_path, 'r', encoding='utf-8') as f:
            config = json.load(f)

        # 执行命令并指定编码为 UTF-8
        command = [
                'robot',
                '--test', '打开电源开关',
                '--variable', f'INSTRUMENT_SOURCE:{config["source"]}',
                r'E:\study\S1\taida_cap\PFC_Autotest\Auto_test.robot'
            ]
        # 打印标准输出
        thread = threading.Thread(
            target=capture_subprocess_realtime,
            args=(command, print),
        )
        thread.start()
        thread.join()

    except Exception as e:
        print(f"执行命令时发生错误: {str(e)}")
def source_off(print):
    try:
        # 执行命令并指定编码为 UTF-8
        # 读取仪器配置JSON文件
        config_file_path = r'E:\study\S1\taida_cap\PFC_Autotest\instrument_config.json'

        with open(config_file_path, 'r', encoding='utf-8') as f:
            config = json.load(f)

        # 执行命令并指定编码为 UTF-8
        command = [
                'robot',
                '--test', '关闭电源开关',
                '--variable', f'INSTRUMENT_SOURCE:{config["source"]}',
                r'E:\study\S1\taida_cap\PFC_Autotest\Auto_test.robot'
            ]
        # 打印标准输出
        thread = threading.Thread(
            target=capture_subprocess_realtime,
            args=(command, print),
        )
        thread.start()
        thread.join()

    except Exception as e:
        print(f"执行命令时发生错误: {str(e)}")

def set_load(print,load_current):
    try:
        # 执行命令并指定编码为 UTF-8
        # 读取仪器配置JSON文件
        config_file_path = r'E:\study\S1\taida_cap\PFC_Autotest\instrument_config.json'

        with open(config_file_path, 'r', encoding='utf-8') as f:
            config = json.load(f)
        result = subprocess.run(
            [
                'robot',
                '--test', '设置负载',
                '--variable', f'INSTRUMENT_LOAD:{config["load"]}',
                '--variable', f'LOAD_CURRENT:{load_current}',
                r'E:\study\S1\taida_cap\PFC_Autotest\Auto_test.robot'
            ],
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

def load_on(print):
    try:
        # 执行命令并指定编码为 UTF-8
        # 读取仪器配置JSON文件
        config_file_path = r'E:\study\S1\taida_cap\PFC_Autotest\instrument_config.json'

        with open(config_file_path, 'r', encoding='utf-8') as f:
            config = json.load(f)

        # 执行命令并指定编码为 UTF-8
        command = [
                'robot',
                '--test', '打开负载开关',
                '--variable', f'INSTRUMENT_LOAD:{config["load"]}',
                r'E:\study\S1\taida_cap\PFC_Autotest\Auto_test.robot'
            ]
        # 打印标准输出
        thread = threading.Thread(
            target=capture_subprocess_realtime,
            args=(command, print),
        )
        thread.start()
        thread.join()

    except Exception as e:
        print(f"执行命令时发生错误: {str(e)}")


def load_off(print):
    try:
        # 执行命令并指定编码为 UTF-8
        # 读取仪器配置JSON文件
        config_file_path = r'E:\study\S1\taida_cap\PFC_Autotest\instrument_config.json'

        with open(config_file_path, 'r', encoding='utf-8') as f:
            config = json.load(f)
        # 执行命令并指定编码为 UTF-8
        command = [
            'robot',
            '--test', '关闭负载开关',
            '--variable', f'INSTRUMENT_LOAD:{config["load"]}',
            r'E:\study\S1\taida_cap\PFC_Autotest\Auto_test.robot'
        ]
        # 打印标准输出
        thread = threading.Thread(
            target=capture_subprocess_realtime,
            args=(command, print),
        )
        thread.start()
        thread.join()

    except Exception as e:
        print(f"执行命令时发生错误: {str(e)}")

def single_efficient_test(print,input_voltage,input_current_limit,frequency,load_current):
    try:
        # 执行命令并指定编码为 UTF-8
        # 读取仪器配置JSON文件
        config_file_path = r'E:\study\S1\taida_cap\PFC_Autotest\instrument_config.json'

        with open(config_file_path, 'r', encoding='utf-8') as f:
            config = json.load(f)



        result = subprocess.run(
            [
                'robot',
                '--test', '单点效率测试',
                '--variable', f'INSTRUMENT_SOURCE:{config["source"]}',
                '--variable', f'INSTRUMENT_LOAD:{config["load"]}',
                '--variable', f'INSTRUMENT_IN:{config["inputmeas_inst"]}',
                '--variable', f'INSTRUMENT_OUT:{config["outputmeas_inst"]}',
                '--variable', f'SOURCE_VOLTAGE:{input_voltage}',
                '--variable', f'SOURCE_CURRENT:{input_current_limit}',
                '--variable', f'FREQUENCY:{frequency}',
                '--variable', f'LOAD_CURRENT:{load_current}',
                r'E:\study\S1\taida_cap\PFC_Autotest\Auto_test.robot'
            ],
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

tools_auto_test=[
    {
        "type": "function",
        "function": {
            "name": "inst_setting",
            "description": "仪器配置函数，在自动化测试前，需要配置好输入源设备、负载设备、输入测量使用的设备、输出测量使用的设备",
            "parameters": {
                "type": "object",
                "properties": {
                    "source": {
                        "type": "str",
                        "description": "自动化测试供电源名，例如APS7100,EC7800,M3132"
                    },
                    "load": {
                        "type": "str",
                        "description": "自动化测试电子负载名，例如IT8800,IT8900"
                    },
                    "inputmeas_inst": {
                        "type": "str",
                        "description": "自动化测试时输入测量所使用的设备，例如APS7100,EC7800,M3132"
                    },
                    "outputmeas_inst": {
                        "type": "str",
                        "description": "自动化测试时输出测量所使用的设备，例如IT8800"
                    }
                },
                "required": ["source", "load", "inputmeas_inst","outputmeas_inst"]
            }
        }
    },
    {
        "type":"function",
        "function":{
            "name":"read_inputCurrent",
            "description":"测试时，读取输入的电流值",
            "parameters":{
                "type":"object",
                "properties":{},
                "required":[]
            }
        }
    },
    {
        "type":"function",
        "function":{
            "name":"read_inputVoltage",
            "description":"读取输入的电压值",
            "parameters":{
                "type":"object",
                "properties":{},
                "required":[]
            }
        }
    },
    {
        "type":"function",
        "function":{
            "name":"read_outputCurrent",
            "description":"读取输出的电流值",
            "parameters":{
                "type":"object",
                "properties":{},
                "required":[]
            }
        }
    },
    {
        "type":"function",
        "function":{
            "name":"read_outputVoltage",
            "description":"读取输出的电压值",
            "parameters":{
                "type":"object",
                "properties":{},
                "required":[]
            }
        }
    },
    {
        "type":"function",
        "function":{
            "name":"read_inputPower",
            "description":"读取输入功率",
            "parameters":{
                "type":"object",
                "properties":{},
                "required":[]
            }
        }
    },
    {
        "type":"function",
        "function":{
            "name":"read_outputPower",
            "description":"读取输出的功率",
            "parameters":{
                "type":"object",
                "properties":{},
                "required":[]
            }
        }
    },
    {
        "type": "function",
        "function": {
            "name": "set_source",
            "description": "测试时，设置供电电源的电压、限流和频率",
            "parameters": {
                "type": "object",
                "properties": {
                    "input_voltage": {
                        "type": "float",
                        "description": "效率测试时，输入交流电源设置的电压值"
                    },
                    "input_current_limit": {
                        "type": "float",
                        "description": "效率测试时，输入交流电源设置的限流值"
                    },
                    "frequency": {
                        "type": "float",
                        "description": "效率测试时，输入交流电源设置的频率"
                    }
                },
                "required": ["input_voltage", "input_current_limit", "frequency"]
            }
        }
    },
    {
        "type": "function",
        "function": {
            "name": "source_on",
            "description": "用于打开输入电源",
            "parameters": {
                "type": "object",
                "properties": {},
                "required": []
            }
        }
    },
    {
        "type": "function",
        "function": {
            "name": "source_off",
            "description": "用于关闭输入电源",
            "parameters": {
                "type": "object",
                "properties": {},
                "required": []
            }
        }
    },
    {
        "type": "function",
        "function": {
            "name": "set_load",
            "description": "测试时，设置输出负载的电流值",
            "parameters": {
                "type": "object",
                "properties": {
                    "load_current": {
                        "type": "float",
                        "description": "效率测试时，输出负载恒流模型下设置的电流值"
                    }
                },
                "required": ["load_current"]
            }
        }
    },
    {
        "type": "function",
        "function": {
            "name": "load_on",
            "description": "用于打开输出负载开关",
            "parameters": {
                "type": "object",
                "properties": {},
                "required": []
            }
        }
    },
    {
        "type": "function",
        "function": {
            "name": "load_off",
            "description": "用于关闭输出负载开关",
            "parameters": {
                "type": "object",
                "properties": {},
                "required": []
            }
        }
    },
    {
        "type":"function",
        "function":{
            "name":"single_efficient_test",
            "description":"测试电力电子转换器的效率",
            "parameters":{
                "type":"object",
                "properties":{
                    "input_voltage": {
                        "type": "float",
                        "description": "效率测试时，输入交流电源设置的电压值"
                    },
                    "input_current_limit": {
                        "type": "float",
                        "description": "效率测试时，输入交流电源设置的限流值"
                    },
                    "frequency": {
                        "type": "float",
                        "description": "效率测试时，输入交流电源设置的频率,对于直流源M3132，不需要设置频率"
                    },
                    "load_current": {
                        "type": "float",
                        "description": "效率测试时，输出负载恒流模型下设置的电流值"
                    }
                },
                "required":["input_voltage","input_current_limit","frequency","load_current"]
            }
        }
    }
]
# 使用示例
if __name__ == "__main__":
    # 如您要求的例子
    inst_setting(
        source="APS7100",
        load="IT8800",
        inputmeas_inst="APS7100",
        outputmeas_inst="IT8800",
    )
    set_source(print, 210, 3, 50)
    single_efficient_test(print,220,4,50,1)
    '''time.sleep(1)
    source_on(print)
    time.sleep(3)
    set_load(print, 1)
    load_on(print)
    read_inputCurrent(print)
    read_outputCurrent(print)
    read_inputVoltage(print)
    read_outputVoltage(print)
    read_inputPower(print)
    read_outputPower(print)
    source_off(print)
    time.sleep(3)
    load_off(print)'''
    # single_efficient_test(print, 220, 3, 50, 1)

