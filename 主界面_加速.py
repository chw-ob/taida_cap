import sys
from PyQt5.QtWidgets import (QApplication, QMainWindow, QWidget, QVBoxLayout,
                             QHBoxLayout, QPushButton, QLineEdit, QFrame, QTextEdit, QLabel)
from PyQt5.QtCore import Qt, pyqtSignal, QThread
from PyQt5.QtGui import QFont, QIcon,QPixmap
from PyQt5.QtWebEngineWidgets import QWebEngineView
from 大语言模型调用 import chat,chat_suanfa
import re
from PyQt5.QtSvg import QSvgWidget
def markdown_to_html(markdown_text):
    """
    将 Markdown 文本转换为 HTML 格式
    支持：标题、加粗、斜体、链接、图片、无序列表、有序列表、代码块、行内代码、引用、水平线
    """
    html = markdown_text

    # 1. 处理标题（# 到 ######）
    # 例如：## 标题 → <h2>标题</h2>
    for i in range(6, 0, -1):
        html = re.sub(
            rf'^(#{i})\s+(.*?)$',
            rf'<h{i}>\2</h{i}>',
            html,
            flags=re.MULTILINE
        )

    # 2. 处理加粗（**文字** 或 __文字__）
    # 例如：**加粗** → <strong>加粗</strong>
    html = re.sub(r'\*\*(.*?)\*\*', r'<strong>\1</strong>', html, flags=re.DOTALL)
    html = re.sub(r'__(.*?)__', r'<strong>\1</strong>', html, flags=re.DOTALL)

    # 3. 处理斜体（*文字* 或 _文字_）
    # 例如：*斜体* → <em>斜体</em>
    html = re.sub(r'\*(.*?)\*', r'<em>\1</em>', html, flags=re.DOTALL)
    html = re.sub(r'_(.*?)_', r'<em>\1</em>', html, flags=re.DOTALL)

    # 4. 处理链接（[文本](链接 "标题")）
    # 例如：[百度](https://www.baidu.com "百度一下") → <a href="https://www.baidu.com" title="百度一下">百度</a>
    html = re.sub(
        r'\[(.*?)\]\((.*?)( ".*?")?\)',
        r'<a href="\2"\3>\1</a>',
        html
    )
    # 去除标题中的引号（可选，根据需要调整）
    html = html.replace('" title=', ' title=')

    # 5. 处理图片（![alt](图片链接 "标题")）
    # 例如：![示例图片](https://picsum.photos/200/300 "示例") → <img src="https://picsum.photos/200/300" alt="示例图片" title="示例">
    html = re.sub(
        r'!\[(.*?)\]\((.*?)( ".*?")?\)',
        r'<img src="\2" alt="\1"\3>',
        html
    )

    # 6. 处理无序列表（- 或 * 开头）
    # 先将列表项标记为 <li>，再用 <ul> 包裹
    html = re.sub(r'^[*-]\s+(.*?)$', r'<li>\1</li>', html, flags=re.MULTILINE)
    html = re.sub(
        r'(<li>.*?</li>)(?=\s*<li>)',
        r'\1',
        html,
        flags=re.DOTALL
    )
    html = re.sub(
        r'(<li>.*?</li>)',
        r'<ul>\n\1\n</ul>',
        html,
        flags=re.DOTALL
    )

    # 7. 处理有序列表（数字. 开头）
    # 先将列表项标记为 <li>，再用 <ol> 包裹
    html = re.sub(r'^\d+\.\s+(.*?)$', r'<li>\1</li>', html, flags=re.MULTILINE)
    html = re.sub(
        r'(<li>.*?</li>)(?=\s*<li>)',
        r'\1',
        html,
        flags=re.DOTALL
    )
    html = re.sub(
        r'(<li>.*?</li>)',
        r'<ol>\n\1\n</ol>',
        html,
        flags=re.DOTALL
    )

    # 8. 处理代码块（```语言 内容 ```）
    # 例如：```python print("hello") ``` → <pre><code class="language-python">print("hello")</code></pre>
    html = re.sub(
        r'```(\w*)\n(.*?)\n```',
        r'<pre><code class="language-\1">\2</code></pre>',
        html,
        flags=re.DOTALL
    )

    # 9. 处理行内代码（`代码`）
    # 例如：`print()` → <code>print()</code>
    html = re.sub(r'`(.*?)`', r'<code>\1</code>', html, flags=re.DOTALL)

    # 10. 处理引用（> 开头）
    # 例如：> 引用内容 → <blockquote>引用内容</blockquote>
    html = re.sub(r'^>\s*(.*?)$', r'<blockquote>\1</blockquote>', html, flags=re.MULTILINE)

    # 11. 处理水平线（--- 或 ***）
    html = re.sub(r'^---$', r'<hr>', html, flags=re.MULTILINE)
    html = re.sub(r'^\*\*\*$', r'<hr>', html, flags=re.MULTILINE)

    # 12. 处理换行（空行分隔的段落用 <p> 包裹）
    paragraphs = re.split(r'\n\s*\n', html)
    processed_paragraphs = []
    for para in paragraphs:
        # 保留段落内的换行
        para = para.replace('\n', '<br>')
        # 非标题/列表/引用等块级元素用 <p> 包裹
        if not re.match(r'^<h[1-6]>|<ul>|<ol>|<blockquote>|<pre>|<hr>', para):
            para = f'<p>{para}</p>'
        processed_paragraphs.append(para)
    html = '\n'.join(processed_paragraphs)

    return html


class CustomTextEdit(QTextEdit):
    """自定义文本输入框：Shift+Enter触发发送，纯Enter仅换行"""
    def __init__(self, parent=None):
        super().__init__(parent)
        self.send_callback = None  # 发送消息的回调函数

    def keyPressEvent(self, event):
        # 判断是否按下Enter键（包括主键盘和小键盘的Enter）
        if event.key() in (Qt.Key_Return, Qt.Key_Enter):
            # 检查是否同时按下Shift键
            if event.modifiers() & Qt.ShiftModifier:
                # Shift+Enter：触发发送消息
                if self.send_callback:
                    self.send_callback()
                # 阻止默认换行（避免发送后额外换行）
                return
            else:
                # 纯Enter：仅执行默认换行，不发送
                super().keyPressEvent(event)
                return
        # 其他按键：正常处理
        super().keyPressEvent(event)
class ChatThread(QThread):
    """处理对话函数的线程类"""
    message_received = pyqtSignal(str)
    def __init__(self,message,mode):
        super(ChatThread, self).__init__()
        self.message = message
        self.mode = mode
        print(f"")

    def output(self, *args, sep=' ', end='', **kwargs):
        """输出方法，默认不换行"""
        message = sep.join(map(str, args)) + end
        #print(message, end='')
        self.message_received.emit(str(message))

    def run(self):
        """模拟流式输出，包含函数调用示例"""
        #chat(self.output)
        if self.mode=='auto_test':
            #from 自动测试 import auto_test
            chat_suanfa(self.message,'measurement',self.output)
            self.message_received.emit("结束#auto_test结束")
                #self.message_received.emit(f"{key}#电压和电流数据如下：{value}")
        elif self.mode=='L_choose':
            chat_suanfa(self.message,self.mode,self.output)
            self.message_received.emit("结束#结束")
        else:
            self.message_received.emit("结束#结束")


class LLMChatInterface(QMainWindow):
    def __init__(self):
        super().__init__()

        # 窗口基本设置
        self.setWindowTitle("PE Agent")
        self.setWindowIcon(QIcon(r"资源文件/pe_agent.ico"))
        screen_geometry = QApplication.primaryScreen().geometry()
        screen_width = screen_geometry.width()
        screen_height = screen_geometry.height()

        # 计算窗口大小为屏幕的一半
        window_width = screen_width // 2
        window_height = screen_height // 2

        # 计算窗口居中位置
        x = (screen_width - window_width) // 2
        y = (screen_height - window_height) // 2

        # 设置窗口大小和位置
        self.setGeometry(x, y, window_width, window_height)

        # 存储对话历史
        self.chat_history = []

        # 基础HTML模板，注意转义大括号
        self.base_html = r"""
                        <!DOCTYPE html>
                        <html>
                        <head>
                            <meta charset="UTF-8">
                            <title>LLM对话</title>
                            <script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3.2.2/es5/tex-mml-chtml.js"></script>
                            <script>
                                MathJax = {{
                                    tex: {{
                                        inlineMath: [['$', '$'], ['\\(', '\\)']],
                                        displayMath: [['$$', '$$'], ['\\[', '\\]']],
                                        processEscapes: true
                                    }},
                                    svg: {{
                                        fontCache: 'global'
                                    }}
                                }};
                            </script>
                            <style>
                        body {{
                            /* 修复1：正确拼写字体名称并添加引号 */
                            font-family: "Times New Roman", SimHei;
                            padding: 15px;
                            /* 修复2：调整行高为更舒适的1.6 */
                            line-height: 1.5;
                            font-size: 35px; /* 修复3：适当调整字体大小（35px过大） */
                        }}
                        .user-message {{ 
                            color: #2196F3; 
                            font-weight: bold;
                            font-size: 1em;
                        }}
                        .llm-message {{ 
                            color: #2F5597; 
                            font-weight: bold;
                            font-size: 1em;
                        }}
                        .system-message {{ 
                            color: #D32F2F; 
                            font-weight: bold;
                            font-size: 1em;
                        }}
                        .message-content {{ 
                            margin-bottom: 10px;
                            padding: 5px 0;
                        }}
                        .function-call {{ 
                            color: #8E44AD; 
                            font-style: italic;
                            font-size: 1em;
                        }}
                        .MathJax {{
                            font-size: 1em !important;
                        }}
                        /* 修复4：确保pre标签使用相同字体设置 */
                        pre {{
                            font-family: "Times New Roman", SimHei, Arial, sans-serif;
                            white-space: pre-wrap;
                            margin: 0;
                        }}
                    </style>
                        </head>
                        <body>
                            <div id="content-container"></div>
                        </body>
                        </html>
                        """

        # 创建布局
        self.style_dict={"你":"color: #2196F3;font-weight: bold;font-size: 35px;text-align: right;",
                         "system":"color: #D32F2F;font-weight: bold;font-size: 35px;",
                         "LLM":"color: #2F5597;font-weight: bold;font-size:35px;",
                         "message":"margin-bottom: 0px;padding: 0px 0;font-size:35px;font-family: 'Times New Roman', '宋体';",
                         "div_你":"text-align: left; margin: 8px 0;background-color: #e6f2ff;width: 50%;margin-left: auto;border-radius: 8px;padding: 10px 15px;",
                         "div_system": "",
                         "div_LLM": "",
                         "div_other": ""
        }
        self.central_widget = QWidget()
        self.setCentralWidget(self.central_widget)
        self.main_layout = QHBoxLayout(self.central_widget)

        # 创建左右面板
        self.show()
        self.create_left_panel()
        self.create_right_panel()

        # 初始化界面
        self.init_ui()
        self.update_chat_display()
        self.chat_message=[]
        self.chat_container=[]
        def init():
            self.add_message("system", "欢迎使用Pe Agent！")
            #self.add_message("system", "电感选型模式")
            #self.add_message("你", "函数\\(sinx\\)在\\(x = 0\\)处的泰勒展开（麦克劳林级数）是：\n")
            #self.add_message("system", "欢迎使用Pe Agent！")
        self.is_stream=False
        self.chat_display.loadFinished.connect(init)
        self.auto_test_clicked=False
        self.suanfa_selected=False

    def init_ui(self):
        # 样式设置
        self.setStyleSheet("""
            QMainWindow { background-color: #f0f0f0; }
            QPushButton {
                background-color: white;
                color: #000000;
                border-radius: 5px;
                padding: 10px;
                text-align: left;
                font-size: 14px;
                border: 2px solid #000000;
                padding: 6px 10px;
            }
            QPushButton:hover { background-color: #B4C7E7; }
            QPushButton:checked {
                background-color: #1B5E20;
                border: 2px solid #FFC107;
            }
            QLineEdit {
                border: 1px solid #d0d0d0;
                border-radius: 5px;
                padding: 8px;
                font-size: 14px;
            }
            QFrame {
                border: 1px solid #d0d0d0;
                border-radius: 5px;
                background-color: white;
            }
        """)

        # 初始消息

    def adjust_image_size(self, image_path,width):
        """核心方法：图片宽度=按钮宽度，高度自适应"""
        # 加载图片
        pixmap = QPixmap(image_path)
        if pixmap.isNull():
            self.image_label.setText("图片加载失败")
            return

        # 获取按钮当前宽度（锚定目标）
        target_width = width
        # 计算图片自适应高度（按原宽高比）
        target_height = int(pixmap.height() * (target_width / pixmap.width()))
        print(f"target_width={target_width},target_height={target_height}")
        # 缩放图片：宽度=按钮宽度，高度=自适应高度
        scaled_pixmap = pixmap.scaled(
            target_width, target_height,
            aspectRatioMode=Qt.IgnoreAspectRatio,  # 强制匹配目标宽高（此处因比例计算，实际无变形）
            transformMode=Qt.SmoothTransformation  # 平滑缩放
        )

        # 显示图片（Label高度随图片自动调整）
        return scaled_pixmap
    def create_left_panel(self):
        # 左侧面板和按钮
        self.left_panel = QFrame()
        self.left_panel.setStyleSheet("""
            QFrame {
            background-color: #F3F4F6;
            border: 5px solid #d0d0d0;
            border-radius: 5px;
            }
            """)
        self.left_panel.setMaximumWidth(300)
        self.left_panel.setMinimumWidth(300)
        self.left_layout = QVBoxLayout(self.left_panel)

        self.suanfa_xuanze_btn = QPushButton("电感选型")
        self.suanfa_xuanze_btn.setFont(QFont("SimHei", 12))
        self.suanfa_xuanze_btn.setStyleSheet("""
            QPushButton {
                background-color: #FFFFFF;
                border-radius: 8px;
                border: 1px solid #DDDDDD;
                padding: 10px;
                text-align: center;
                font-size: 20px;
            }
            QPushButton:hover { background-color: #B4C7E7; }
            QPushButton:checked {
                background-color: #8FAADC;
                border: 2px solid #8FAADC;
            }
        """)
        self.suanfa_xuanze_btn.setCheckable(True)
        self.auto_test_btn = QPushButton("自动测试")
        self.auto_test_btn.setFont(QFont("SimHei", 12))
        self.auto_test_btn.setStyleSheet("""
                    QPushButton {
                        background-color: #FFFFFF;
                        border-radius: 8px;
                        border: 1px solid #DDDDDD;
                        padding: 10px;
                        text-align: center;
                        font-size: 20px;
                    }
                    QPushButton:hover { background-color: #B4C7E7; }
                    QPushButton:checked {
                        background-color: #8FAADC;
                        border: 2px solid #8FAADC;
                    }
                """)
        self.auto_test_btn.setCheckable(True)


        self.new_chat_btn = QPushButton("新对话")
        self.new_chat_btn.setStyleSheet("""
            QPushButton {
                background-color: #FFFFFF;
                border-radius: 8px;
                border: 1px solid #DDDDDD;
                padding: 10px;
                text-align: center;
                font-size: 20px;
            }
            QPushButton:hover { background-color: #B4C7E7; }
        """)

        self.pfc_picture=QLabel()
        self.pfc_picture.setStyleSheet("border: none;background-color: transparent;")





        self.suanfa_xuanze_btn.setMinimumHeight(70)
        self.auto_test_btn.setMinimumHeight(70)
        self.new_chat_btn.setMinimumHeight(70)


        self.left_layout.addWidget(self.suanfa_xuanze_btn)
        self.left_layout.addWidget(self.auto_test_btn)
        self.left_layout.addWidget(self.new_chat_btn)
        self.left_layout.addStretch()
        self.left_layout.addWidget(self.pfc_picture)
        print(self.suanfa_xuanze_btn.width())

        self.pfc_picture.setPixmap(self.adjust_image_size(r"资源文件/绘图1.png", 270))
        self.new_chat_btn.clicked.connect(self.clear_chat)
        self.auto_test_btn.clicked.connect(self.on_auto_test_clicked)
        self.suanfa_xuanze_btn.clicked.connect(self.on_suanfa_clicked)

        self.main_layout.addWidget(self.left_panel)

    def on_suanfa_clicked(self):
        if self.auto_test_clicked and self.suanfa_xuanze_btn.isChecked():
            self.auto_test_btn.setChecked(False)
            self.on_auto_test_clicked()
        self.suanfa_selected = self.suanfa_xuanze_btn.isChecked()
        if self.suanfa_selected:
            self.add_message("system", "电感选型模式")
        else:
            self.add_message("system", "已取消电感选型模式")
    def on_auto_test_clicked(self):
        if self.suanfa_selected and self.auto_test_btn.isChecked():
            self.suanfa_xuanze_btn.setChecked(False)
            self.on_suanfa_clicked()
        self.auto_test_clicked = self.auto_test_btn.isChecked()
        if self.auto_test_clicked:
            self.add_message("system", "自动测试模式")
        else:
            self.add_message("system", "已取消自动测试模式")
    def create_right_panel(self):
        # 右侧对话区域
        def change_status(succes):
            self.chat_status=succes
            print(f"self.chat_status={self.chat_status}")
        self.right_panel = QFrame()
        self.right_layout = QVBoxLayout(self.right_panel)

        # 使用QWebEngineView显示内容
        self.chat_display = QWebEngineView()

        import os
        local_image_path = "E:/study/S1/taida_cap/资源文件/绘图1.jpg"
        from PyQt5.QtCore import QUrl
        image_url = QUrl.fromLocalFile(local_image_path).toString()
        print(f"image_url:{image_url}")
        image_dir = os.path.dirname(local_image_path)  # 获取图片所在文件夹路径
        base_url = QUrl.fromLocalFile(image_dir)

        self.chat_display.setHtml(self.base_html,baseUrl=base_url)
        self.chat_display.loadFinished.connect(change_status)
        #self.chat_display.page().toHtml(lambda html: print("HTML内容:", html))
        self.chat_display.page().setDevToolsPage(self.chat_display.page())

        # 输入区域
        self.input_layout = QHBoxLayout()
        self.message_input = CustomTextEdit()

        self.message_input.setPlaceholderText("请输入消息...")
        self.message_input.send_callback = self.send_message
        #self.message_input.clicked.connect(self.send_message)

        self.send_btn = QPushButton("对话")
        self.send_btn.setStyleSheet("""
                                    QPushButton {
                                        
                                        text-align: center;
                                        font-size: 25px;
                                        padding: 6px 12px;
                                        font-family: 'Times New Roman', '宋体';
                                    }
                                    /* 可选： hover 时的样式（鼠标悬浮效果） */
                                    QPushButton:hover {
                                        background-color: #f0f0f0;
                                    }
                                """)
        self.message_input.setMinimumHeight(80)
        self.send_btn.setMinimumHeight(80)
        #self.send_btn.setMinimumWidth(100)


        self.send_btn.clicked.connect(self.send_message)

        self.input_layout.addWidget(self.message_input, 5)
        self.input_layout.addWidget(self.send_btn,1)

        self.right_layout.addWidget(self.chat_display, 8)
        self.right_layout.addLayout(self.input_layout, 1)

        self.main_layout.addWidget(self.right_panel, 4)

    def add_message(self, sender, message, is_new_line=True):
        """添加消息到历史记录，is_new_line控制是否自动换行"""
        # 确定发送者样式类
        # 关键修复：保留原始换行符，转换为HTML的<br>标签
        # 先处理Windows风格的\r\n，再处理Unix风格的\n
        message = message.replace("\n", "<br>")
        self.chat_container.append("content"+str(len(self.chat_container)))
        # 添加到历史记录，控制是否自动换行
        escaped_message = message.replace("\\", "\\\\")
        new_msg_html=f"""
        <div id='{self.chat_container[-1]}' style="{self.style_dict['div_'+sender]};">
            <p>
                <span style="{self.style_dict[sender]}">{sender}:</span>
                <span style="{self.style_dict['message']}">{escaped_message}</span>
            </p>
        </div>
        """
        self.update_display(new_msg_html)
        # 执行JS代码

        # 执行JS并在控制台打印结果



    def update_chat_display(self):
        """更新网页显示"""
        #content = ''.join(self.chat_history)
        #html = self.base_html.format(content=content)
        #self.chat_display.setHtml(html)
        #self.chat_display.page().runJavaScript("window.scrollTo(0, document.body.scrollHeight);")

    def send_message(self):
        """发送用户消息"""
        message = self.message_input.toPlainText().strip()
        #self.chat_message.append(message)
        if message:
            self.add_message("你", message)
            self.message_input.clear()
            self.get_llm_response(message)

    def get_llm_response(self, message):
        """获取LLM响应"""
        if self.suanfa_xuanze_btn.isChecked():
            mode="L_choose"
        else:
            mode=None
        if self.auto_test_clicked:
            mode="auto_test"
        self.chat_message.append({"role": "user", "content":f"{message}"})
        self.chat_thread = ChatThread(self.chat_message,mode)
        self.is_stream=True

        self.chat_container.append("content" + str(len(self.chat_container)))
        # 添加到历史记录，控制是否自动换
        new_msg_html = f"""
                <div id='{self.chat_container[-1]}' style="{self.style_dict['div_' + "LLM"]};">
                    <p>
                        <span style="{self.style_dict["LLM"]}">LLM:</span>
                    </p>
                </div>
                """
        self.update_display(new_msg_html)
        self.chat_history.append({"role": "user", "content":f"{message}"})
        self.chat_history.append({"role": "system", "content":""})

        self.chat_message.append({"role": "system", "content":""})

        self.chat_container.append("content" + str(len(self.chat_container)))
        self.temp_message=""
        self.chat_thread.message_received.connect(self.append_llm_message)
        self.chat_thread.start()

    def append_llm_message(self, message):
        """追加LLM消息（核心：不自动换行但保留手动换行）"""
        # 检查是否是第一条LLM消息
        if message=='结束#结束':
            import re
            text=self.chat_message[-1]['content']
            plain_text=text
            print(f"转换前:{plain_text}")
            pattern = r'###(.*?)<br>'
            replacement = r'<strong>\1</strong><br>'
            #text = re.sub(pattern, replacement, text)
            # 2. 再处理 **文字**（成对强调）：无需特殊标志
            pattern_emphasis = re.compile(r'\*\*(.*?)\*\*', re.DOTALL)
            text = pattern_emphasis.sub(r'<strong>\1</strong>', text)
            import markdown
            #text=markdown.markdown(plain_text)
            print(f"转换后:{text}")
            new_msg_html = f"""
                                             <span style="{self.style_dict["message"]}">{plain_text}</span>
                                        """

            print(f"finl_meg_html:{new_msg_html}")
            js_code = f"""
                        var container_temp = document.getElementById('{self.chat_container[-1]}');
                         container_temp.innerHTML = `{new_msg_html}`;
                                // 滚动到底部
                         window.scrollTo(0, document.body.scrollHeight)
                         MathJax.typesetPromise([container_temp])
                         window.scrollTo(0, document.body.scrollHeight)
                        """
            #self.chat_display.page().runJavaScript(js_code)
            new_msg_html = f"""
                                                         <span style="{self.style_dict["message"]}">{text}</span>
                                                    """

            print(f"finl_meg_html:{new_msg_html}")
            js_code = f"""
                                    var container_temp = document.getElementById('{self.chat_container[-1]}');
                                     container_temp.innerHTML = `{new_msg_html}`;
                                            // 滚动到底部
                                     window.scrollTo(0, document.body.scrollHeight)
                                     MathJax.typesetPromise([container_temp])
                                     window.scrollTo(0, document.body.scrollHeight)
                                    """
            self.chat_display.page().runJavaScript(js_code)
            js_code = f"""
                                                var container_temp = document.getElementById('{self.chat_container[-1]}');
                                                 MathJax.typesetPromise([container_temp])
                                                 window.scrollTo(0, document.body.scrollHeight)
                                                """
            self.chat_display.page().runJavaScript(js_code)
            # self.chat_display.page().toHtml(lambda html: print("HTML内容:", html))
            # self.chat_container.append("content" + str(len(self.chat_container)))
            self.temp_message = ''
            return
        elif message=='结束#auto_test结束':
            import re
            text = self.chat_message[-1]['content']
            plain_text = text
            print(f"转换前:{plain_text}")
            pattern = r'###(.*?)<br>'
            replacement = r'<strong>\1</strong><br>'
            text = re.sub(pattern, replacement, text)
            # 2. 再处理 **文字**（成对强调）：无需特殊标志
            pattern_emphasis = re.compile(r'\*\*(.*?)\*\*', re.DOTALL)
            text = pattern_emphasis.sub(r'<strong>\1</strong>', text)
            import markdown
            # text=markdown.markdown(plain_text)
            print(f"转换后:{text}")
            new_msg_html = f"""
                                                         <span style="{self.style_dict["message"]}">{plain_text}</span>
                                                    """

            print(f"finl_meg_html:{new_msg_html}")
            js_code = f"""
                                    var container_temp = document.getElementById('{self.chat_container[-1]}');
                                     container_temp.innerHTML = `{new_msg_html}`;
                                            // 滚动到底部
                                     window.scrollTo(0, document.body.scrollHeight)
                                     MathJax.typesetPromise([container_temp])
                                     window.scrollTo(0, document.body.scrollHeight)
                                    """
            # self.chat_display.page().runJavaScript(js_code)
            new_msg_html = f"""
                                                                     <span style="{self.style_dict["message"]}">{text}</span>
                                                                """

            print(f"finl_meg_html:{new_msg_html}")
            js_code = f"""
                                                var container_temp = document.getElementById('{self.chat_container[-1]}');
                                                 container_temp.innerHTML = `{new_msg_html}`;
                                                        // 滚动到底部
                                                 window.scrollTo(0, document.body.scrollHeight)
                                                 MathJax.typesetPromise([container_temp])
                                                 window.scrollTo(0, document.body.scrollHeight)
                                                """
            self.chat_display.page().runJavaScript(js_code)
            js_code = f"""
                                                            var container_temp = document.getElementById('{self.chat_container[-1]}');
                                                             MathJax.typesetPromise([container_temp])
                                                             window.scrollTo(0, document.body.scrollHeight)
                                                            """
            self.chat_display.page().runJavaScript(js_code)
            # self.chat_display.page().toHtml(lambda html: print("HTML内容:", html))
            # self.chat_container.append("content" + str(len(self.chat_container)))
            self.temp_message = ''
            '''from PyQt5.QtCore import QUrl
            html=QUrl.fromLocalFile(r'E:\study\S1\taida_cap\report.html')
            new_msg_html = f"""
                    <iframe src="E:\\\\study\\\\S1\\\\taida_cap\\\\report.html",style="width: 100%; height: 1000px; border: 1px solid #ccc;"></iframe>
                    """
            js_code = f"""
                                                            var container_temp = document.getElementById('{self.chat_container[-1]}');
                                                             container_temp.innerHTML += `{new_msg_html}`;
                                                                    // 滚动到底部
                                                             window.scrollTo(0, document.body.scrollHeight)
                                                             MathJax.typesetPromise([container_temp])
                                                             window.scrollTo(0, document.body.scrollHeight)
                                                            """
            self.chat_display.page().runJavaScript(js_code)'''
            return
        message=message.replace('\\','\\\\')#="<br>" if message=='\n' else message
        message=message.replace('\n','<br>')
        self.temp_message+=message
        self.chat_message[-1]['content']+=message
        if len(self.temp_message)>=5:
            new_msg_html = f"""
                                 <span style="{self.style_dict["message"]}">{self.temp_message}</span>
                            """

            #print(f"new_meg_html:{new_msg_html}")
            js_code = f"""
                                    var container = document.getElementById('content-container');
                                    var container_temp = document.getElementById('{self.chat_container[-1]}');
                                    if (!container) {{
                                        console.error('容器元素未找到！请检查HTML中是否存在id="content-container"的元素');
                                    }} else {{
                                            if (!container_temp) {{
                                                // 新增元素：使用innerHTML追加模板字符串
                                                container.innerHTML += `<div id='{self.chat_container[-1]}' style="{self.style_dict['div_' + "LLM"]};">{new_msg_html}</div>`;
                                            }} else {{
                                                // 更新已有元素：设置innerHTML（修复赋值语法）
                                                container_temp.innerHTML += `{new_msg_html}`;
                                            }}
                                            // 滚动到底部
                                            window.scrollTo(0, document.body.scrollHeight)
                                    }}
                                    """
            self.chat_display.page().runJavaScript(js_code)
                #self.chat_display.page().toHtml(lambda html: print("HTML内容:", html))
                #self.chat_container.append("content" + str(len(self.chat_container)))
            self.temp_message = ''


    def clear_chat(self):
        """清空对话"""
        print(f":self.chat_history:{self.chat_history}")
        self.chat_history = []
        self.chat_message = []
        self.add_message("系统", "已开始新对话，请输入您的问题...")
    def on_page_loaded(self, success):
        """页面加载完成后执行JS收集元素并打印到控制台"""
        if not success:
            print("页面加载失败")
            return

        # 执行JavaScript收集所有带id的元素
        js_code = """
            const allElements = document.getElementsByTagName('*');
            const elementsWithId = [];

            for (let elem of allElements) {
                if (elem.id) {
                    elementsWithId.push({
                        id: elem.id,
                        tag: elem.tagName.toLowerCase(),
                        class: elem.className,
                        content: elem.innerText.substring(0, 50)
                    });
                }
            }
            elementsWithId;
        """

        # 执行JS并在控制台打印结果
        self.chat_display.page().runJavaScript(js_code, self.print_to_console)

    def print_to_console(self, elements):
        """将元素信息打印到控制台"""
        if not elements:
            print("未找到带有id属性的元素")
            return

        print(f"\n===== 共找到 {len(elements)} 个带id的元素 =====")
        for i, elem in enumerate(elements, 1):
            print(f"\n元素 {i}:")
            print(f"  id: {elem['id']}")
            print(f"  标签: {elem['tag']}")
            print(f"  类名: {elem['class'] or '无'}")
            print(f"  内容: {elem['content'] or '无'}")
        print("\n======================================")
    def update_display(self,msg_html):
        js_code = f"""
                        var container = document.getElementById('content-container');
                        if (!container) {{
                            console.error('容器元素未找到！请检查HTML中是否存在id="content-container"的元素');
                        }} else {{
                            try {{
                                // 安全追加HTML内容
                                container.innerHTML += `{msg_html}`;
                                // 滚动到底部
                                window.scrollTo(0, document.body.scrollHeight);
                                requestAnimationFrame(() => {{
                                var container_temp = document.getElementById('{self.chat_container[-1]}');
                                console.log(container_temp.innerHTML);
                                if (container_temp) {{ // 确保元素存在
                                    MathJax.typesetPromise([container_temp]).catch(err => console.error('MathJax渲染失败:', err));
                                }} 
                                else {{
                                    console.error('未找到容器元素:', '{self.chat_container[-1]}');
                                }}
                                }});
                            }} catch (e) {{
                                console.error('HTML插入失败:', e);
                            }}
                        }}
                    """
        self.chat_display.page().runJavaScript(js_code)
    def auto_test(self,message=None):
        mode="auto_test"
        self.chat_message.append({"role": "user", "content": f"{message}"})
        self.chat_thread = ChatThread(self.chat_message, mode)
        self.is_stream = True

        self.chat_container.append("content" + str(len(self.chat_container)))
        # 添加到历史记录，控制是否自动换
        new_msg_html = f"""
                <div id='{self.chat_container[-1]}' style="{self.style_dict['div_' + "LLM"]};">
                    <p>
                        <span style="{self.style_dict["LLM"]}">LLM:</span>
                    </p>
                </div>
                """
        self.update_display(new_msg_html)
        self.chat_history.append({"role": "user", "content": f"{message}"})
        self.chat_history.append({"role": "system", "content": ""})

        self.chat_message.append({"role": "system", "content": ""})

        self.chat_container.append("content" + str(len(self.chat_container)))
        self.temp_message = ""
        self.chat_thread.message_received.connect(self.append_llm_message)
        self.chat_thread.start()



if __name__ == "__main__":
    app = QApplication(sys.argv)
    app.setFont(QFont("SimHei"))
    from PyQt5.QtWebEngineWidgets import QWebEngineProfile

    default_profile = QWebEngineProfile.defaultProfile()
    QApplication.setAttribute(Qt.AA_EnableHighDpiScaling, True)
    window = LLMChatInterface()
    sys.exit(app.exec_())
