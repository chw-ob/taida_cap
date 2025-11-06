import sys
import io
import re


def extract_and_capture_python_output(text):
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
            results.append(f"第{i}个代码块的输出：\n{output}")
        except Exception as e:
            results.append(f"第{i}个代码块执行出错：\n{str(e)}")
        finally:
            # 恢复标准输出
            sys.stdout = original_stdout

    return results
sample_text = """
代码块1：
```python
printf("Hello, World!")
printf("这是第一个代码块")
```
"""
outputs = extract_and_capture_python_output(sample_text)
print(outputs)
