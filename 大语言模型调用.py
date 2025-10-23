from zai import ZhipuAiClient
import os
import json
from PyQt5.QtCore import QUrl
from 优化程序.param_optimization import main
from 优化程序.param_optimization import ddpg
from 优化程序.param_optimization import pso
from 优化程序.param_optimization import random
from 优化程序.param_optimization import GA
from 优化程序.param_optimization import td3
from 自动测试提取参数 import read_current,read_voltage,efficient_test,parse_stm32_test_xml_print
def inductor_optimization(print):
    main(print)
def chw_a_b(a,b):
    return a/b
tools=[
    {
        "type":"function",
        "function":{
            "name":"chw_a_b",
            "description":"自定义算法（chw算法）函数，输入a和b，输出算法结果c",
            "parameters":{
                "type":"object",
                "properties":{
                    "a":{
                        "type":"int",
                        "description":"参数a"
                    },
                    "b":{
                        "type":"int",
                        "description":"参数b"
                    }
                },
                "required":["a","b"]
            }
        }
    },
    {
        "type":"function",
        "function":{
            "name":"inductor_optimization",
            "description":"电感优化算法",
            "parameters":{
                "type":"object",
                "properties":{
                    "a":{
                        "type":"int",
                        "description":"电感大小,单位为nH"
                    }
                },
                "required":["a"]
            }
        }
    }
]
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
                    "start_random":{
                        "type":"int",
                        "description":"初始化种子"
                    },
                    "batch_size":{
                        "type":"int",
                        "description":"batch的大小"
                    },
                    "noise_end":{
                        "type":"int",
                        "description":"结束点，默认取0.05"
                    },
                    "lr_gamma":{
                        "type":"int",
                        "description":"学习率，默认取0.999"
                    }}

                },
                "required": ["iters", "seed","start_random","batch_size","noise_end","lr_gamma"]
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
                    "start_random":{
                        "type":"int",
                        "description":"初始化种子"
                    },
                    "batch_size":{
                        "type":"int",
                        "description":"batch的大小"
                    },
                    "noise_end":{
                        "type":"int",
                        "description":"结束点，默认取0.05"
                    },
                    "lr_gamma":{
                        "type":"int",
                        "description":"学习率，默认取0.999"
                    }}

                },
                "required": ["iters", "seed","start_random","batch_size","noise_end","lr_gamma"]
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
def example():
    return "调用成功"
client = ZhipuAiClient(api_key="1b02f7a04dc0408b80b2dc0d5abdaf3b.IbChXpVHplI7urEd")
def chat(print):
    response = client.chat.completions.create(
        model="glm-4.5",
        messages=[
            {"role": "user", "content": "请调用函数帮我优化电感，大小为50nH"}
        ],
        tools=tools,
        # tool_choice="auto",
        stream=True
    )
    string=""
    for chunk in response:
        # 每个chunk是Completions对象，包含choices列表
        for choice in chunk.choices:
            delta = choice.delta  # 获取增量内容
            # 提取tool_calls（模型决定调用函数时出现）
            if hasattr(delta, 'tool_calls') and delta.tool_calls:
                tool_call = delta.tool_calls[0]  # 假设只有一个tool call
                function_name = tool_call.function.name
                arguments = tool_call.function.arguments
                print(f"模型决定调用函数: {function_name}，参数: {arguments}")
                if function_name == "inductor_optimization":
                    inductor_optimization(print)
            # 提取普通文本内容（模型生成的回答）
            if hasattr(delta, 'content') and delta.content:
                if delta.content == "\n" and string == "":
                    break
                else:
                    string = string + delta.content
                    content = delta.content
                    print(content, end="", flush=True)  # 流式打印文本'''
def chat_():
    response = client.chat.completions.create(
        model="glm-4.5",
        messages=[
            {"role": "user", "content": "请调用函数帮我优化电感，大小为50nH"}
        ],
        tools=tools,
        # tool_choice="auto",
        stream=True
    )
    string=""
    for chunk in response:
        # 每个chunk是Completions对象，包含choices列表
        for choice in chunk.choices:
            delta = choice.delta  # 获取增量内容
            # 提取tool_calls（模型决定调用函数时出现）
            if hasattr(delta, 'tool_calls') and delta.tool_calls:
                tool_call = delta.tool_calls[0]  # 假设只有一个tool call
                function_name = tool_call.function.name
                arguments = tool_call.function.arguments
                print(f"模型决定调用函数: {function_name}，参数: {arguments}")
                if function_name == "inductor_optimization":
                    inductor_optimization(print)
            # 提取普通文本内容（模型生成的回答）
            if hasattr(delta, 'content') and delta.content:
                if delta.content =="\n" and string == "":
                    break
                else:
                    string = string + delta.content
                    content = delta.content
                    print(content, end="", flush=True)  # 流式打印文本'''
    print()
    print("string")
    print(string)
def chat_suanfa(message,mode,print):
    if mode=='L_choose':
        response = client.chat.completions.create(
            model="glm-4.5",
            messages=message,
            tools=tools_indutor,
            # tool_choice="auto",
            stream=True
        )
    elif mode=='measurement':
        response = client.chat.completions.create(
            model="glm-4.5",
            messages=message,
            tools=tools_measure,
            # tool_choice="auto",
            stream=True
        )
    else:
        response = client.chat.completions.create(
            model="glm-4.5",
            messages=message,
            # tool_choice="auto",
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
                print(f"模型决定调用函数: {function_name}，参数: {arguments}")
                arguments = json.loads(arguments)
                if function_name=='read_current':
                    #print(f"转换后:{arguments}")
                    ID=arguments['ID'] if 'ID' in arguments else 1
                    read_current(ID,print)
                    parse_stm32_test_xml_print(print)
                    local_image_path = "E:/study/S1/taida_cap/资源文件/绘图1.png"
                    image_url = QUrl.fromLocalFile(local_image_path).toString()
                    print(f'''<img src="{image_url}" alt="图片描述"><br>''')
                    with open("report.html", "r", encoding="utf-8") as file:
                        html_content = file.read()
                    print('''<iframe src="report.html" width="800" height="800" frameborder="1"></iframe>''')
                    print('''<p style="color:red;font-size:15px">已嵌入本地HTML文件作为iframe。<p>''')
                    #print(os.getcwd())
                    #print(f"<img src=\"{map_str}\", alt=\"示例图片\">")
                elif function_name=='read_voltage':
                    ID=arguments['ID'] if 'ID' in arguments else 1
                    read_voltage(ID,print)
                    parse_stm32_test_xml_print(print)
                elif function_name=='efficient_test':
                    efficient_test(print)
                    parse_stm32_test_xml_print(print)
                elif function_name == "inductor_optimization":
                    inductor_optimization(print)
                elif function_name=='ddpg':
                    iters=arguments['iters'] if 'iters' in arguments else 1000
                    seed=arguments['seed'] if 'seed' in arguments else 0
                    start_random=arguments['start_random'] if 'start_random' in arguments else 0
                    batch_size=arguments['batch_size'] if 'batch_size' in arguments else 64
                    noise_end=arguments['noise_end'] if 'noise_end' in arguments else 0.05
                    lr_gamma=arguments['lr_gamma'] if 'lr_gamma' in arguments else 0.999
                    ddpg(print,iters=iters,seed=seed,start_random=start_random,batch_size=batch_size,noise_end=noise_end,lr_gamma=lr_gamma)
                elif function_name=='pso':
                    iters=arguments['iters'] if 'iters' in arguments else 1000
                    seed=arguments['seed'] if 'seed' in arguments else 0
                    pop_size=arguments['pop_size'] if 'pop_size' in arguments else 50
                    pso(print,iters=iters,seed=seed,swarm_size=pop_size)
                elif function_name=='random':
                    iters=arguments['iters'] if 'iters' in arguments else 1000
                    seed=arguments['seed'] if 'seed' in arguments else 0
                    random(print,iters=iters,seed=seed)
                elif function_name=='GA':
                    iters = arguments['iters'] if 'iters' in arguments else 1000
                    seed = arguments['seed'] if 'seed' in arguments else 0
                    pop_size = arguments['pop_size'] if 'pop_size' in arguments else 50
                    GA(print,iters=iters,seed=seed,pop_size=pop_size)
                elif function_name=='td3':
                    iters = arguments['iters'] if 'iters' in arguments else 1000
                    seed = arguments['seed'] if 'seed' in arguments else 0
                    start_random = arguments['start_random'] if 'start_random' in arguments else 0
                    batch_size = arguments['batch_size'] if 'batch_size' in arguments else 64
                    noise_end = arguments['noise_end'] if 'noise_end' in arguments else 0.05
                    lr_gamma = arguments['lr_gamma'] if 'lr_gamma' in arguments else 0.999
                    td3(print, iters=iters, seed=seed, start_random=start_random, batch_size=batch_size,
                         noise_end=noise_end, lr_gamma=lr_gamma)
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
if __name__ == '__main__':
    chat_()