import sys
from PyQt5.QtWidgets import (QApplication, QMainWindow, QWidget, QVBoxLayout,
                             QHBoxLayout, QPushButton, QLineEdit, QFrame, QTextEdit, QLabel)
from PyQt5.QtCore import Qt, pyqtSignal, QThread
from PyQt5.QtGui import QFont, QIcon,QPixmap
from PyQt5.QtWebEngineWidgets import QWebEngineView
from 大语言模型调用 import chat_suanfa
from PyQt5.QtSvg import QSvgWidget
import re
def format_python_text(text):
    """
    处理包含Python代码的文本，为代码块添加美观的样式
    """
    # 定义代码块的CSS样式（黑色背景、语法高亮基础样式、等宽字体）
    code_style = """
    background-color: #1e1e1e;  /* 深色背景 */
    color: #dcdcdc;             /* 基础文字颜色 */
    font-family: 'Consolas', 'Monaco', monospace;  /* 等宽代码字体 */
    padding: 15px;
    border-radius: 6px;
    overflow-x: auto;           /* 横向滚动（防止长代码换行） */
    display: block;
    """

    # 为Python关键字、注释、字符串等添加基础语法高亮（通过正则替换）
    def highlight_code(match):
        code = match.group(1)
        # 替换注释（绿色）
        code = re.sub(r'(#.*?)\n', r'<span style="color: #6a9955">\1</span>\n', code)
        # 替换字符串（黄色）
        code = re.sub(r'(\'\'\'.*?\'\'\'|".*?"|\'.*?\')', r'<span style="color: #ce9178">\1</span>', code,
                      flags=re.DOTALL)
        # 替换关键字（蓝色）
        keywords = r'\b(False|None|True|and|as|assert|async|await|break|class|continue|def|del|elif|else|except|finally|for|from|global|if|import|in|is|lambda|nonlocal|not|or|pass|raise|return|try|while|with|yield)\b'
        code = re.sub(keywords, r'<span style="color: #569cd6">\1</span>', code)
        # 替换数字（青色）
        code = re.sub(r'\b(\d+)\b', r'<span style="color: #b5cea8">\1</span>', code)
        return f'<pre style="{code_style}">python代码如下:{code}</pre>'

    # 匹配```python开头的代码块并应用高亮样式
    formatted_text = re.sub(
        r'```python(.*?)```',
        highlight_code,
        text,
        flags=re.DOTALL
    )

    return formatted_text
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
        if self.mode=='自动测试':
            print("function:自动测试")
            print(f"self.mode:{self.mode}")
            chat_suanfa(self.message,self.mode,self.output)
            self.message_received.emit("结束#结束")
        elif self.mode=='电感选型':
            chat_suanfa(self.message,self.mode,self.output)
            self.message_received.emit("结束#结束")
        elif self.mode=='仿真分析':
            chat_suanfa(self.message,self.mode,self.output)
            self.message_received.emit("结束#结束")
        elif self.mode=='数据分析':
            chat_suanfa(self.message,self.mode,self.output)
            self.message_received.emit("结束#结束")
        else:
            chat_suanfa(self.message, self.mode, self.output)
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
        #self.update_chat_display()
        self.chat_message=[]
        self.chat_container=[]
        def init():
            self.add_message("system", "欢迎使用Pe Agent！")
        self.is_stream=False
        self.chat_display.loadFinished.connect(init)
        self.auto_test_clicked=False
        self.suanfa_selected=False
        self.data_selected=False

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
        self.ansys_simulate_btn = QPushButton("仿真分析")
        self.auto_test_btn = QPushButton("自动测试")
        self.data_ana_btn = QPushButton("数据分析")
        self.new_chat_btn = QPushButton("新对话")
        self.left_button_index={"电感选型":self.suanfa_xuanze_btn,"仿真分析":self.ansys_simulate_btn,
                                "自动测试":self.auto_test_btn,"新对话":self.new_chat_btn,"数据分析":self.data_ana_btn}
        for key,btn in self.left_button_index.items():
            btn.setFont(QFont("SimHei", 12))
            btn.setStyleSheet("""
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
            btn.setCheckable(True)
            btn.setMinimumHeight(70)

        self.left_button_layout_index=['电感选型','仿真分析','自动测试','数据分析','新对话']

        for key in self.left_button_layout_index:
            btn=self.left_button_index[key]
            self.left_layout.addWidget(btn)

        self.left_layout.addStretch()


        self.pfc_picture=QLabel()
        self.pfc_picture.setStyleSheet("border: none;background-color: transparent;")
        self.left_layout.addWidget(self.pfc_picture)
        self.pfc_picture.setPixmap(self.adjust_image_size(r"资源文件/绘图1.png", 270))


        '''self.new_chat_btn.clicked.connect(self.clear_chat)
        self.auto_test_btn.clicked.connect(self.on_auto_test_clicked)
        self.suanfa_xuanze_btn.clicked.connect(self.on_suanfa_clicked)
        self.data_ana_btn.clicked.connect(self.on_data_ana_clicked)
        self.ansys_simulate_btn.clicked.connect(self.on_ansys_simulate_clicked)'''

        self.new_chat_btn.clicked.connect(self.clear_chat)
        for key,btn in self.left_button_index.items():
            if key=='新对话':
                continue
            else:
                btn.clicked.connect(lambda checked,k=key: self.on_function_call_clicked(k))
                print("key:",key)
        self.main_layout.addWidget(self.left_panel)
    def on_function_call_clicked(self,key):
        print("key:",key,"checked:",self.left_button_index[key].isChecked())
        if not self.left_button_index[key].isChecked():
            self.add_message("system", f"已取消{key}模式")
            self.left_button_index[key].setChecked(False)
            return
        else:
            for key_,btn in self.left_button_index.items():
                print(f"key_:{key_},key:{key}")
                if key_==key:
                    continue
                if btn.isChecked():
                    self.add_message("system", f"已取消{key_}模式")
                    btn.setChecked(False)
            self.left_button_index[key].setChecked(True)
            self.add_message("system", f"{key}模式")
        pass
    def clear_chat(self):
        """清空对话"""
        self.new_chat_btn.setChecked(False)
        print(f":self.chat_history:{self.chat_history}")
        self.chat_history = []
        self.chat_message = []
        self.add_message("system", "已开始新对话，请输入您的问题...")
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
        sender_dict={"你":"用户","system":"system","LLM":"LLM"}
        new_msg_html=f"""
        <div id='{self.chat_container[-1]}' style="{self.style_dict['div_'+sender]};">
            <p>
                <span style="{self.style_dict[sender]}">{sender_dict[sender]}:</span>
                <span style="{self.style_dict['message']}">{escaped_message}</span>
            </p>
        </div>
        """
        self.update_display(new_msg_html)
        # 执行JS代码

        # 执行JS并在控制台打印结果

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
        mode=None
        for key,btn in self.left_button_index.items():
            if btn.isChecked():
                mode=key

        self.chat_message.append({"role": "user", "content":f"{message}"})
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
        self.chat_thread = ChatThread(self.chat_message, mode)
        self.chat_thread.message_received.connect(self.append_llm_message)
        self.chat_thread.start()

    def append_llm_message(self, message):
        """追加LLM消息（核心：不自动换行但保留手动换行）"""
        # 检查是否是第一条LLM消息
        if message=='结束#结束':
            import re
            text = self.chat_message[-1]['content']
            plain_text = text
            #text=text.replace(' ','&nbsp;')
            text=format_python_text(text)
            pattern = r'###(.*?)<br>'
            replacement = r'<strong>\1</strong><br>'
            text = re.sub(pattern, replacement, text)
            # 2. 再处理 **文字**（成对强调）：无需特殊标志
            pattern_emphasis = re.compile(r'\*\*(.*?)\*\*', re.DOTALL)
            text = pattern_emphasis.sub(r'<strong>\1</strong>', text)
            print(f"转换后:{text}")
            #self.chat_display.page().runJavaScript(js_code)
            new_msg_html = f"""
                                                         <span style="{self.style_dict["message"]}">{text}</span>
                                                    """
            new_msg_html = new_msg_html.replace("`", "\\`")
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
            self.temp_message = ''
            return
        message=message.replace('\\','\\\\')#="<br>" if message=='\n' else message
        message=message.replace('\n','<br>')
        self.temp_message+=message
        self.chat_message[-1]['content']+=message
        self.temp_message=self.temp_message.replace(' ','&nbsp;')
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




if __name__ == "__main__":
    app = QApplication(sys.argv)
    app.setFont(QFont("SimHei"))
    from PyQt5.QtWebEngineWidgets import QWebEngineProfile

    default_profile = QWebEngineProfile.defaultProfile()
    QApplication.setAttribute(Qt.AA_EnableHighDpiScaling, True)
    window = LLMChatInterface()
    sys.exit(app.exec_())
