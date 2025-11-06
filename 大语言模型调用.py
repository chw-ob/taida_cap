from zai import ZhipuAiClient
import os
import json
from PyQt5.QtCore import QUrl
from 优化程序.大模型调用接口 import random,pso,GA,ddpg,td3
from 自动测试提取参数 import read_current,read_voltage,efficient_test,parse_stm32_test_xml_print
import sys
import io
import xml.etree.ElementTree as ET
import re
import asyncio
import tempfile
from 数据分析.数据分析接口  import async_run_plotter
tools_ansys=[{
        "type":"function",
        "function":{
            "name":"update_and_simulate",
            "description":"ansys电感仿真",
            "parameters":{
                "type":"object",
                "properties":{
                    "excitation":{
                        "type":"list",
                        "description":"励磁电流"
                    },
                    "N":{
                        "type":"float",
                        "description":"匝数"
                    },
                    'core_id':{
                        "type":"int",
                        "description":"磁芯型号"}
                    ,
                    "core_gap":{
                        "type":"float",
                        "description":"磁芯气隙，单位mm"
                    }
                },
                "required":["excitation","N","core_id","core_gap"]
            }
        }
    }]
tools_indutor=[
{
        "type":"function",
        "function":{
            "name":"random",
            "description":"电感优化算法(随机搜索)",
            "parameters":{
                "type":"object",
                "properties":{
                    "iters":{
                        "type":"int",
                        "description":"迭代次数"
                    },
                    "seed":{
                        "type":"int",
                        "description":"随机种子"
                    }

                },
                "required":["iters","seed"]
            }
        }
    },
{
        "type": "function",
        "function": {
            "name": "GA",
            "description": "电感优化算法(遗传算法)",
            "parameters": {
                "type": "object",
                "properties": {
                    "iters": {
                        "type": "int",
                        "description": "迭代次数"
                    },
                    "seed": {
                        "type": "int",
                        "description": "随机种子"
                    },
                    "pop_size":{
                        "type":"int",
                        "description":"种群大小"
                    }

                },
                "required": ["iters", "seed"]
            }
        }
    },
{
        "type": "function",
        "function": {
            "name": "pso",
            "description": "电感优化算法(PSO)",
            "parameters": {
                "type": "object",
                "properties": {
                    "iters": {
                        "type": "int",
                        "description": "迭代次数"
                    },
                    "seed": {
                        "type": "int",
                        "description": "随机种子"
                    },
                    "swarm_size":{
                        "type":"int",
                        "description":"种群大小"
                    }

                },
                "required": ["iters", "seed",'swarm_size']
            }
        }
    },
{
        "type": "function",
        "function": {
            "name": "td3",
            "description": "电感优化算法(td3)",
            "parameters": {
                "type": "object",
                "properties": {
                    "iters": {
                        "type": "int",
                        "description": "迭代次数"
                    },
                    "seed": {
                        "type": "int",
                        "description": "随机种子"
                    },
                    "batch_size":{
                        "type":"int",
                        "description":"batch的大小"
                    },
                    "pop":{
                        "type":"int",
                        "description":"运算种群大小，默认为64"
                    },
                    "lr_gamma":{
                        "type":"int",
                        "description":"学习率，默认取0.999"
                    }}

                },
                "required": ["iters", "seed","batch_size","pop","lr_gamma"]
            }
        },
{
        "type": "function",
        "function": {
            "name": "ddpg",
            "description": "电感优化算法(ddpg)",
            "parameters": {
                "type": "object",
                "properties": {
                    "iters": {
                        "type": "int",
                        "description": "迭代次数"
                    },
                    "seed": {
                        "type": "int",
                        "description": "随机种子"
                    },
                    "batch_size":{
                        "type":"int",
                        "description":"batch的大小"
                    },
                    "pop":{
                        "type":"int",
                        "description":"运算种群大小，默认为64"
                    },
                    "lr_gamma":{
                        "type":"int",
                        "description":"学习率，默认取0.999"
                    }}

                },
                "required": ["iters", "seed","batch_size","pop","lr_gamma"]
            }
        },
]
tools_measure=[
    {
        "type":"function",
        "function":{
            "name":"read_current",
            "description":"读取电流",
            "parameters":{
                "type":"object",
                "properties":{
                    "ID":{
                        "type":"int",
                        "description":"读取的设备ID,取值为1和2"
                    }
                },
                "required":["ID"]
            }
        }
    },
{
        "type":"function",
        "function":{
            "name":"read_voltage",
            "description":"读取电压",
            "parameters":{
                "type":"object",
                "properties":{
                    "ID":{
                        "type":"int",
                        "description":"读取的设备ID,取值为1和2"
                    }
                },
                "required":["ID"]
            }
        }
    },
{
        "type":"function",
        "function":{
            "name":"efficient_test",
            "description":"测试电力电子转换器效率",
            "parameters":{
                "type":"object",
                "properties":{
                },
                "required":[]
            }
        }
    }
]
tools_auto_test=[{
        "type": "function",
        "function": {
            "name": "inst_setting",
            "description": "仪器配置函数，在自动化测试前，需要配置好输入源设备、负载设备、输入测量使用的设备、输出测量使用的设备",
            "parameters": {
                "type": "object",
                "properties": {
                    "source": {
                        "type": "string",
                        "description": "自动化测试供电源名，可用的有:APS7100,EC7800,M3132"
                    },
                    "load": {
                        "type": "string",
                        "description": "自动化测试电子负载名，可用的有:IT8800,IT8900"
                    },
                    "inputmeas_inst": {
                        "type": "string",
                        "description": "自动化测试时输入测量所使用的设备，可用的有:APS7100,EC7800,ZXB001,EC7800"
                    },
                    "outputmeas_inst": {
                        "type": "string",
                        "description": "自动化测试时输出测量所使用的设备，可用的有:IT8800,IT8900,ZXB002"
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
                        "description": "效率测试时，输入交流电源设置的频率,对于直流源M3132,不需要输入频率"
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

tools_data_analysis=[
{
        "type":"function",
        "function":{
            "name":"plot_effencicy",
            "description":"绘制效率-功率图，仅适用于单根曲线的绘制，其他功能切忌使用此函数",
            "parameters":{
                "type":"object",
                "properties":{
                    "power_list":
                        {
                         "type": "list",
                         "description": "功率列表"
                        },
                    "effiency_list":
                        {
                         "type": "list",
                         "description": "效率列表"
                        }
                },
                "required":["power_list","effiency_list"]
            }
        }
    }
]
def plot_effencicy(power_list,effiency_list):
    import matplotlib.pyplot as plt
    plt.plot(power_list,effiency_list)
    plt.show()
    return
char_data=r"""
函数 \( \sin x \) 的泰勒展开（在 \( x = 0 \) 处展开，也称为麦克劳林展开）是一个非常重要的级数展开式。它通过无穷级数的形式精确地表示了正弦函数。

### 泰勒展开式
\[
\sin x = x - \frac{x^3}{3!} + \frac{x^5}{5!} - \frac{x^7}{7!} + \frac{x^9}{9!} - \cdots
\]

### 通项公式
\[
\sin x = \sum_{n=0}^{\infty} (-1)^n \frac{x^{2n+1}}{(2n+1)!}
\]

### 详细说明
1. **展开点**：在 \( x = 0 \) 处展开（麦克劳林级数）。
2. **结构特点**：
   - 只包含 **奇数次幂** 项（\( x, x^3, x^5, \ldots \)），因为 \( \sin x \) 是奇函数。
   - 系数符号 **交替变化**（正、负、正、负……）。
   - 分母是 **奇数的阶乘**（\( 1!, 3!, 5!, \ldots \)）。
3. **收敛性**：
   - 该级数对所有实数 \( x \) 都收敛（收敛半径为无穷大）。
   - 在收敛域内，级数和等于 \( \sin x \) 的精确值。

### 推导过程（简要）
泰勒展开公式为：
\[
f(x) = f(0) + f'(0)x + \frac{f''(0)}{2!}x^2 + \frac{f'''(0)}{3!}x^3 + \cdots
\]
计算 \( \sin x \) 在 \( x = 0 \) 处的导数：
- \( f(x) = \sin x \) → \( f(0) = 0 \)
- \( f'(x) = \cos x \) → \( f'(0) = 1 \)
- \( f''(x) = -\sin x \) → \( f''(0) = 0 \)
- \( f'''(x) = -\cos x \) → \( f'''(0) = -1 \)
- \( f^{(4)}(x) = \sin x \) → \( f^{(4)}(0) = 0 \)
- \( f^{(5)}(x) = \cos x \) → \( f^{(5)}(0) = 1 \)
- **循环规律**：导数在 \( x = 0 \) 处的值按 \( 0, 1, 0, -1, 0, 1, \ldots \) 循环。

代入泰勒公式，偶数阶导数项为 0，奇数阶导数项交替出现 \( \pm 1 \)，得到：
\[
\sin x = x - \frac{x^3}{3!} + \frac{x^5}{5!} - \frac{x^7}{7!} + \cdots
\]

### 应用示例
1. **近似计算**：
   - 当 \( |x| \) 很小时（如 \( x \approx 0 \)），可取前几项近似：
     \[
     \sin x \approx x \quad (\text{误差} \leq \frac{|x|^3}{6})
     \]
     \[
     \sin x \approx x - \frac{x^3}{6} \quad (\text{更高精度})
     \]
   - 例如：\( \sin(0.1) \approx 0.1 - \frac{(0.1)^3}{6} = 0.0998333 \)（实际值 \( \approx 0.0998334 \)）。

2. **理论应用**：
   - 用于推导极限（如 \( \lim_{x \to 0} \frac{\sin x}{x} = 1 \)）。
   - 在物理和工程中求解微分方程（如简谐振动）。
   - 作为数值算法的基础（如计算器中的正弦函数实现）。

### 图示理解
- **级数逼近过程**：
  - 1 项：直线 \( y = x \)
  - 2 项：三次曲线 \( y = x - \frac{x^3}{6} \)
  - 3 项：五次曲线 \( y = x - \frac{x^3}{6} + \frac{x^5}{120} \)
  - 随着项数增加，曲线逐渐逼近 \( \sin x \) 的真实波形。

> **关键点**：这个级数完美体现了 \( \sin x \) 的周期性和光滑性，是微积分中函数展开的典范之一。

"""
client = ZhipuAiClient(api_key="1b02f7a04dc0408b80b2dc0d5abdaf3b.IbChXpVHplI7urEd")

'''def extract_and_capture_python_output(text):#找到python代码块并执行
    # 提取Python代码块
    pattern = r'```python(.*?)```'
    matches = re.findall(pattern, text, re.DOTALL)

    if not matches:
        return "未找到Python代码块"

    results = []
    for i, code_block in enumerate(matches, 1):
        # 创建一个字符串缓冲区用于捕获输出
        buffer = io.StringIO()
        # 保存原有的标准输出
        original_stdout = sys.stdout
        try:
            # 重定向标准输出到缓冲区
            sys.stdout = buffer
            # 执行代码
            exec(code_block.strip())
            # 获取缓冲区内容（即print输出）
            output = buffer.getvalue()
            if output is None:
                output = "代码无输出结果"
            results.append(f"第{i}个python代码执行结果为：{output}")
        except Exception as e:
            results.append(f"{str(e)}")
        finally:
            # 恢复标准输出
            sys.stdout = original_stdout

    return results'''
import subprocess
import matplotlib.pyplot as plt
def extract_and_capture_python_output(text):
    """
    提取文本中的Python代码块，保存为临时文件并执行，返回控制台输出

    参数:
        text: 包含Python代码块的文本（代码块需用```python和```包裹）
    返回:
        执行结果字符串
    """
    # 提取Python代码块
    pattern = r'```python(.*?)```'
    matches = re.findall(pattern, text, re.DOTALL)

    if not matches:
        return "未找到Python代码块"

    results = []
    for i, code_block in enumerate(matches, 1):
        # 创建临时Python文件
        with tempfile.NamedTemporaryFile(
                mode='w',
                suffix='.py',
                delete=False,  # 执行完再手动删除，避免跨平台问题
                encoding='utf-8'
        ) as temp_file:
            temp_file_name = temp_file.name
            # 写入代码块（保留原始格式）
            temp_file.write(code_block.strip())

        try:
            # 执行临时文件，捕获 stdout 和 stderr
            result = subprocess.run(
                [sys.executable, temp_file_name],  # 使用当前Python解释器
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True,  # 输出为字符串（而非bytes）
                encoding='utf-8'
            )

            # 处理执行结果
            if result.returncode == 0:
                output = result.stdout.strip()
                output = output if output else "代码执行成功，无打印输出"
                results.append(f"第{i}个代码块执行结果：\n{output}")
            else:
                # 捕获错误信息
                results.append(f"第{i}个代码块执行出错：\n{result.stderr.strip()}")

        finally:
            # 确保临时文件被删除
            try:
                os.unlink(temp_file_name)
            except Exception as e:
                results.append(f"警告：临时文件 {temp_file_name} 删除失败：{str(e)}")

    return "\n\n".join(results)
def xml_print(print,message):
    xml_path=r"E:\study\S1\taida_cap\output.xml"
    tree = ET.parse(xml_path)
    root = tree.getroot()
    if message=="read_inputCurrent":
        for msg in root.iter("msg"):
            #print(msg.text)
            if "{current}" in msg.text and "交流电源" not in msg.text:
                # 构建完整的msg内容（标签+属性+文本）
                msg.text = re.sub(r"\$\{(\w+)\}", r"\1", msg.text)
                attrs = ' '.join([f'{k}="{v}"' for k, v in msg.attrib.items()])
                target_msg = f'<msg {attrs}>{msg.text}</msg>'
                print("测量结果如下:")
                print(target_msg)
                break
    if message=="read_outputCurrent":
        for msg in root.iter("msg"):
            if "{current}" in msg.text:
                # 构建完整的msg内容（标签+属性+文本）
                msg.text = re.sub(r"\$\{(\w+)\}", r"\1", msg.text)
                attrs = ' '.join([f'{k}="{v}"' for k, v in msg.attrib.items()])
                target_msg = f'<msg {attrs}>{msg.text}</msg>'
                print("测量结果如下:")
                print(target_msg)
    if message=='read_inputVoltage':
        for msg in root.iter("msg"):
            if "{voltage}" in msg.text:
                # 构建完整的msg内容（标签+属性+文本）
                msg.text = re.sub(r"\$\{(\w+)\}", r"\1", msg.text)
                attrs = ' '.join([f'{k}="{v}"' for k, v in msg.attrib.items()])
                target_msg = f'<msg {attrs}>{msg.text}</msg>'
                print("测量结果如下:")
                print(target_msg)
    if message=='read_outputVoltage':
        for msg in root.iter("msg"):
            if "{voltage}" in msg.text:
                # 构建完整的msg内容（标签+属性+文本）
                msg.text = re.sub(r"\$\{(\w+)\}", r"\1", msg.text)
                attrs = ' '.join([f'{k}="{v}"' for k, v in msg.attrib.items()])
                target_msg = f'<msg {attrs}>{msg.text}</msg>'
                print("测量结果如下:")
                print(target_msg)
    if message=='read_inputPower':
        for msg in root.iter("msg"):
            if "${power}" in msg.text:
                # 构建完整的msg内容（标签+属性+文本）
                msg.text = re.sub(r"\$\{(\w+)\}", r"\1", msg.text)
                attrs = ' '.join([f'{k}="{v}"' for k, v in msg.attrib.items()])
                target_msg = f'<msg {attrs}>{msg.text}</msg>'
                print("测量结果如下:")
                print(target_msg)
    if message == 'read_outputPower':
        for msg in root.iter("msg"):
            if "${power}" in msg.text:
                # 构建完整的msg内容（标签+属性+文本）
                msg.text = re.sub(r"\$\{(\w+)\}", r"\1", msg.text)
                attrs = ' '.join([f'{k}="{v}"' for k, v in msg.attrib.items()])
                target_msg = f'<msg {attrs}>{msg.text}</msg>'
                print("测量结果如下:")
                print(target_msg)
    if message == 'single_efficient_test':
        print("测量结果如下:\n")
        for msg in root.iter("msg"):
            if "输入功率:" in msg.text:
                # 构建完整的msg内容（标签+属性+文本）
                msg.text = re.sub(r"\$\{(\w+)\}", r"\1", msg.text)
                attrs = ' '.join([f'{k}="{v}"' for k, v in msg.attrib.items()])
                target_msg = f'<msg {attrs}>{msg.text}</msg>'
                print(target_msg+'\n')
            if "输出功率:" in msg.text:
                # 构建完整的msg内容（标签+属性+文本）
                msg.text = re.sub(r"\$\{(\w+)\}", r"\1", msg.text)
                attrs = ' '.join([f'{k}="{v}"' for k, v in msg.attrib.items()])
                target_msg = f'<msg {attrs}>{msg.text}</msg>'
                print(target_msg+'\n')
            if "效率" in msg.text:
                # 构建完整的msg内容（标签+属性+文本）
                msg.text = re.sub(r"\$\{(\w+)\}", r"\1", msg.text)
                attrs = ' '.join([f'{k}="{v}"' for k, v in msg.attrib.items()])
                target_msg = f'<msg {attrs}>{msg.text}</msg>'
                print(target_msg+'\n')



def chat_suanfa(message,mode,print):
    # 假设 message 是一个列表
    if mode=='电感选型':
        response = client.chat.completions.create(
            model="glm-4.5",
            messages=message,
            tools=tools_indutor,
            # tool_choice="auto",
            stream=True
        )
    elif mode=='仿真分析':
        response = client.chat.completions.create(
            model="glm-4.5",
            messages=message,
            tools=tools_ansys,
            # tool_choice="auto",
            stream=True
        )
    elif mode=='自动测试':
        response = client.chat.completions.create(
            model="glm-4.5",
            messages=message,
            tools=tools_auto_test,
            # tool_choice="auto",
            stream=True
        )
    elif mode=='数据分析':
        message.insert(len(message) - 1,
                       {"role": "system",
                        "content": "面对数据分析需求，如果已有函数工具，则直接调用。如果没有相应的工具，则编写python代码，并将python脚本放在代码块中,注意缩进，并使用```python开头和```结尾标记代码块。并将结果用print函数打印到控制台，使用plt代码时请注意中文字符适配"}
                       )
        response = client.chat.completions.create(
            model="glm-4.5",
            messages=message,
            tools=tools_data_analysis,
            stream=True
        )
    else:
        response = client.chat.completions.create(
            model="glm-4.5",
            messages=message,
            stream=True
        )
    string = ""
    for chunk in response:
        # 每个chunk是Completions对象，包含choices列表
        for choice in chunk.choices:
            delta = choice.delta  # 获取增量内容
            # 提取tool_calls（模型决定调用函数时出现）
            if hasattr(delta, 'tool_calls') and delta.tool_calls:
                tool_call = delta.tool_calls[0]  # 假设只有一个tool call
                function_name = tool_call.function.name
                arguments = tool_call.function.arguments
                try:
                    print(f"模型决定调用函数: {function_name}，参数: {arguments}")
                    #print(f"aruguments:{arguments}")
                    arguments = json.loads(arguments)
                except:
                    return
                if function_name=='read_current':
                    #print(f"转换后:{arguments}")
                    ID=arguments['ID'] if 'ID' in arguments else 1
                    read_current(ID,print)
                    parse_stm32_test_xml_print(print)

                    map_str="E:/study/S1/taida_cap/资源文件/磁性1号.png"
                    #print(os.getcwd())
                    print(f"<img src=\"{map_str}\", alt=\"示例图片\">")
                elif function_name=='read_voltage':
                    ID=arguments['ID'] if 'ID' in arguments else 1
                    read_voltage(ID,print)
                    parse_stm32_test_xml_print(print)
                elif function_name=='efficient_test':
                    efficient_test(print)
                    parse_stm32_test_xml_print(print)
                elif function_name=='ddpg':
                    iters=arguments['iters'] if 'iters' in arguments else 1000
                    seed=arguments['seed'] if 'seed' in arguments else 0
                    pop=arguments['pop'] if 'pop' in arguments else 64
                    noise_end=arguments['noise_end'] if 'noise_end' in arguments else 0.05
                    lr_gamma=arguments['lr_gamma'] if 'lr_gamma' in arguments else 0.999
                    ddpg(print,iters=iters,seed=seed,noise_end=noise_end,lr_gamma=lr_gamma,pop=pop)
                    map_str = "E:/study/S1/taida_cap/资源文件/磁性1号.png"
                    print(f"<img src=\"{map_str}\", alt=\"示例图片\">")
                elif function_name=='pso':
                    iters=arguments['iters'] if 'iters' in arguments else 1000
                    seed=arguments['seed'] if 'seed' in arguments else 0
                    pop_size=arguments['pop_size'] if 'pop_size' in arguments else 64
                    pso(print,iters=iters,seed=seed,swarm_size=pop_size)
                    map_str = "E:/study/S1/taida_cap/资源文件/磁性1号.png"
                    print(f"<img src=\"{map_str}\", alt=\"示例图片\">")
                elif function_name=='random':
                    iters=arguments['iters'] if 'iters' in arguments else 1000
                    seed=arguments['seed'] if 'seed' in arguments else 0
                    random(print,iters=iters,seed=seed)
                    map_str = "E:/study/S1/taida_cap/资源文件/磁性1号.png"
                    print(f"<img src=\"{map_str}\", alt=\"示例图片\">")
                elif function_name=='GA':
                    iters = arguments['iters'] if 'iters' in arguments else 1000
                    seed = arguments['seed'] if 'seed' in arguments else 0
                    pop_size = arguments['pop_size'] if 'pop_size' in arguments else 64
                    GA(print,iters=iters,seed=seed,pop_size=pop_size)
                    map_str = "E:/study/S1/taida_cap/资源文件/磁性1号.png"
                    print(f"<img src=\"{map_str}\", alt=\"示例图片\">")
                elif function_name=='td3':
                    iters = arguments['iters'] if 'iters' in arguments else 1000
                    seed = arguments['seed'] if 'seed' in arguments else 0
                    pop = arguments['pop'] if 'pop' in arguments else 64
                    noise_end = arguments['noise_end'] if 'noise_end' in arguments else 0.05
                    lr_gamma = arguments['lr_gamma'] if 'lr_gamma' in arguments else 0.999
                    td3(print,iters=iters,seed=seed,noise_end=noise_end,lr_gamma=lr_gamma,pop=pop)
                    map_str = "E:/study/S1/taida_cap/资源文件/磁性1号.png"
                    print(f"<img src=\"{map_str}\", alt=\"示例图片\">")
                elif function_name=='update_and_simulate':
                    from 函数调用接口 import ansys_validation
                    N=arguments['N'] if 'N' in arguments else 10.0
                    excitation=arguments['excitation'] if 'excitation' in arguments else [1.0]
                    core_id=arguments['core_id'] if 'core_id' in arguments else 1
                    core_gap=arguments['core_gap'] if 'core_gap' in arguments else 0.1
                    try:
                        ansys_validation(print,excitation,core_id,N,core_gap)
                    except:
                        print("ansys调用失败，请检查ansys软件及脚本")
                elif function_name=='read_inputCurrent':
                    from PFC_Autotest.函数调用 import read_inputCurrent
                    read_inputCurrent(print)
                    xml_print(print,'read_inputCurrent')
                elif function_name=='read_inputVoltage':
                    from PFC_Autotest.函数调用 import read_inputVoltage
                    read_inputVoltage(print)
                    xml_print(print,'read_inputVoltage')
                elif function_name=='read_outputCurrent':
                    from PFC_Autotest.函数调用 import read_outputCurrent
                    read_outputCurrent(print)
                    xml_print(print,'read_outputCurrent')
                elif function_name=='read_outputVoltage':
                    from PFC_Autotest.函数调用 import read_outputVoltage
                    read_outputVoltage(print)
                    xml_print(print,'read_outputVoltage')
                elif function_name=='read_inputPower':
                    from PFC_Autotest.函数调用 import read_inputPower
                    read_inputPower(print)
                    xml_print(print,'read_inputPower')
                elif function_name=='read_outputPower':
                    from PFC_Autotest.函数调用 import read_outputPower
                    read_outputPower(print)
                    xml_print(print,'read_outputPower')
                elif function_name=='set_source':
                    from PFC_Autotest.函数调用 import set_source
                    input_voltage=arguments['input_voltage'] if 'input_voltage' in arguments else 220.0
                    input_current_limit=arguments['input_current_limit'] if 'input_current_limit' in arguments else 4.0
                    frequency=arguments['frequency'] if 'frequency' in arguments else 50.0
                    set_source(print,input_voltage,input_current_limit,frequency)
                elif function_name=='source_on':
                    from PFC_Autotest.函数调用 import source_on
                    source_on(print)
                elif function_name=='source_off':
                    from PFC_Autotest.函数调用 import source_off
                    source_off(print)
                elif function_name=='set_load':
                    from PFC_Autotest.函数调用 import set_load
                    load_current=arguments['load_current'] if 'load_current' in arguments else 1.0
                    set_load(print,load_current)
                elif function_name=='load_on':
                    from PFC_Autotest.函数调用 import load_on
                    load_on(print)
                elif function_name=='load_off':
                    from PFC_Autotest.函数调用 import load_off
                    load_off(print)
                elif function_name=='single_efficient_test':
                    from PFC_Autotest.函数调用 import single_efficient_test
                    input_voltage=arguments['input_voltage'] if 'input_voltage' in arguments else 220.0
                    input_current_limit=arguments['input_current_limit'] if 'input_current_limit' in arguments else 4.0
                    frequency=arguments['frequency'] if 'frequency' in arguments else 50.0
                    load_current=arguments['load_current'] if 'load_current' in arguments else 1.0
                    single_efficient_test(print,input_voltage,input_current_limit,frequency,load_current)
                    #parse_stm32_test_xml_print(print)
                    xml_print(print, 'single_efficient_test')
                elif function_name == 'inst_setting':
                    from PFC_Autotest.函数调用 import inst_setting
                    source = arguments['source'] if 'source' in arguments else "APS7100"
                    load = arguments['load'] if 'load' in arguments else "IT8800"
                    inputmeas_inst = arguments['inputmeas_inst'] if 'inputmeas_inst' in arguments else "APS7100"
                    outputmeas_inst = arguments['outputmeas_inst'] if 'outputmeas_inst' in arguments else "IT8800"
                    inst_setting(print,source,load,inputmeas_inst,outputmeas_inst)
                elif function_name=='plot_effencicy':
                    power_list = arguments['power_list'] if 'power_list' in arguments else "power_list"
                    effiency_list = arguments['effiency_list'] if 'effiency_list' in arguments else "effiency_list"
                    try:
                        asyncio.run(async_run_plotter(power_list, effiency_list))
                    except:
                        pass
                else:
                    print("函数库未有此函数")
            # 提取普通文本内容（模型生成的回答）
            if hasattr(delta, 'content') and delta.content:
                if delta.content == "\n" and string == "":
                    break
                else:
                    string = string + delta.content
                    content = delta.content
                    print(content, end="", flush=True)
    try:
        result=extract_and_capture_python_output(string)
        if result == "未找到Python代码块":
            pass
        else:
            print("开始执行代码，结果如下\n")
            for res in result:
                print(res)
    except:
        print("执行代码出错")
if __name__ == '__main__':
    #GA(print, iters=iters, seed=seed, pop_size=pop_size)
    xml_print(print,"read_outputCurrent")
    pass