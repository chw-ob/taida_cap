import sys
from PyQt5.QtWidgets import (QApplication, QMainWindow, QWidget, QVBoxLayout,
                             QHBoxLayout, QPushButton, QLineEdit, QFrame)
from PyQt5.QtCore import Qt, pyqtSignal, QThread
from PyQt5.QtGui import QFont
from PyQt5.QtWebEngineWidgets import QWebEngineView

from 大语言模型调用 import chat,chat_suanfa

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
        chat_suanfa(self.message,self.mode,self.output)
        self.message_received.emit("结束#结束")


class LLMChatInterface(QMainWindow):
    def __init__(self):
        super().__init__()

        # 窗口基本设置
        self.setWindowTitle("LLM对话界面")
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
        self.create_left_panel()
        self.create_right_panel()

        # 初始化界面
        self.init_ui()
        self.update_chat_display()
        self.chat_message=[]
        self.chat_container=[]
        def init():
            self.add_message("system", "欢迎使用Pe Agent！")
            self.add_message("你", "函数\\(sinx\\)在\\(x = 0\\)处的泰勒展开（麦克劳林级数）是：\n")
            self.add_message("system", "欢迎使用Pe Agent！")
        self.is_stream=False
        self.chat_display.loadFinished.connect(init)

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
        self.left_panel.setMaximumWidth(200)
        self.left_layout = QVBoxLayout(self.left_panel)

        self.suanfa_xuanze_btn = QPushButton("电感选型")
        self.suanfa_xuanze_btn.setFont(QFont("SimHei", 12))
        self.suanfa_xuanze_btn.setStyleSheet("""
            QPushButton {
                background-color: #FFFFFF;
                border-radius: 8px;
                border: 1px solid #DDDDDD;
                padding: 10px;
                text-align: left;
                font-size: 20px;
            }
            QPushButton:hover { background-color: #B4C7E7; }
            QPushButton:checked {
                background-color: #1B5E20;
                border: 2px solid #FFC107;
            }
        """)
        self.suanfa_xuanze_btn.setCheckable(True)

        self.new_chat_btn = QPushButton("新对话")
        self.new_chat_btn.setStyleSheet("""
            QPushButton {
                background-color: #FFFFFF;
                border-radius: 8px;
                border: 1px solid #DDDDDD;
                padding: 10px;
                text-align: left;
                font-size: 20px;
            }
            QPushButton:hover { background-color: #B4C7E7; }
        """)

        self.suanfa_xuanze_btn.setMinimumHeight(50)
        self.new_chat_btn.setMinimumHeight(50)

        self.left_layout.addWidget(self.suanfa_xuanze_btn)
        self.left_layout.addWidget(self.new_chat_btn)
        self.left_layout.addStretch()

        self.new_chat_btn.clicked.connect(self.clear_chat)
        self.suanfa_xuanze_btn.clicked.connect(self.on_suanfa_clicked)

        self.main_layout.addWidget(self.left_panel)

    def on_suanfa_clicked(self):
        self.suanfa_selected = self.suanfa_xuanze_btn.isChecked()
        if self.suanfa_selected:
            self.add_message("system:", "电感选型模式")
        else:
            pass#self.add_message("system:", "已取消算法模式")

    def create_right_panel(self):
        # 右侧对话区域
        def change_status(succes):
            self.chat_status=succes
            print(f"self.chat_status={self.chat_status}")
        self.right_panel = QFrame()
        self.right_layout = QVBoxLayout(self.right_panel)

        # 使用QWebEngineView显示内容
        self.chat_display = QWebEngineView()
        self.chat_display.setHtml(self.base_html)
        self.chat_display.loadFinished.connect(change_status)
        #self.chat_display.page().toHtml(lambda html: print("HTML内容:", html))
        self.chat_display.page().setDevToolsPage(self.chat_display.page())

        # 输入区域
        self.input_layout = QHBoxLayout()
        self.message_input = QLineEdit()
        self.message_input.setPlaceholderText("请输入消息...")
        self.message_input.returnPressed.connect(self.send_message)

        self.send_btn = QPushButton("对话")
        self.send_btn.clicked.connect(self.send_message)

        self.input_layout.addWidget(self.message_input, 7)
        self.input_layout.addWidget(self.send_btn, 1)

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
        message = self.message_input.text().strip()
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

        self.chat_message.append({"role": "system", "content":"0"})

        self.chat_container.append("content" + str(len(self.chat_container)))
        self.temp_message=''
        self.last_char="0"
        self.last_last_char='0'
        self.last_s='0'
        self.last_last_s = '0'
        self.last_last_last_s = '0'
        self.flag_strong='0'
        self.flag_em = 0
        self.is_latex=0
        self.latex_f = 0
        self.chat_thread.message_received.connect(self.append_llm_message)
        self.chat_thread.start()

    def append_llm_message(self, message):
        """追加LLM消息（核心：不自动换行但保留手动换行）"""
        # 检查是否是第一条LLM消息
        if message=='结束#结束':
            self.is_stream=False
            return

            #self.chat_message[-1]["content"] = self.chat_message[-1]["content"].replace("\\", "\\\\")
        for char in message:
            if char=="*":
                pass
            elif char=="#":
                pass
            elif char=='\\':
                pass
            elif char in ['(',')','[',']']:
                pass
            else:
                if self.last_char=="*" and self.last_last_char=="*":
                    self.flag_em=1 if self.flag_em==0 else 0

                elif self.last_char=="*" and self.last_last_char!="*":
                    self.temp_message+="*"

                elif self.last_s=="#" and self.last_last_s=="#" and self.last_last_last_s=="#":
                    self.flag_strong=1

                elif self.last_s == "#" and self.last_last_s != "#" :
                    self.temp_message+="#"

                elif self.last_s=="#" and self.last_last_s=="#" and self.last_last_last_s!="#":
                    self.temp_message+="##"

                elif self.last_s=="(" and self.last_last_s=='\\' :
                    self.is_latex=1
                    self.temp_message+="\\\\("
                elif self.last_s=="[" and self.last_last_s=='\\':
                    self.is_latex=1
                    self.temp_message += "\\\\["

                elif self.last_s==")" and self.last_last_s=='\\':
                    self.is_latex=0
                    self.latex_f=1
                    self.temp_message += "\\\\)"
                elif self.last_s==")" and self.last_last_s!="\\":
                    self.temp_message +=')'
                elif self.last_s == "\\":
                    self.temp_message += '\\\\'
                elif self.last_s=="]" and self.last_last_s=='\\':
                    self.is_latex=0
                    self.latex_f = 1
                    self.temp_message += "\\\\]"
                elif char=="\n":
                    self.flag_strong=0
                #char='\\\\' if char=='\\' else char
                if self.latex_f!=1:
                    char='<br>' if char=='\n' else char
                if self.latex_f==1 and char!=' ':
                    #print(f"latex_f:{char}")
                    pass
                self.temp_message+=char

            self.last_last_last_s=self.last_last_s
            self.last_last_s=self.last_s
            self.last_s=char

            self.last_last_char=self.last_char
            self.last_char=char
        if self.is_latex:
            return
        elif self.latex_f==1:
            self.latex_f=0
            #print(self.temp_message)
            #self.chat_container.append("content" + str(len(self.chat_container)))
            new_msg_html = f"""
                             <span style="{self.style_dict["message"]}">{self.temp_message}</span>
                            """
            print(f"new_meg_html:{new_msg_html}")
            js_code = f"""
                                var container = document.getElementById('content-container');
                                var container_temp = document.getElementById('{self.chat_container[-1]}');
                                if (!container) {{
                                    console.error('容器元素未找到！请检查HTML中是否存在id="content-container"的元素');
                                }} else {{
                                    try {{
                                        if (!container_temp) {{
                                            // 新增元素：使用innerHTML追加模板字符串
                                            container.innerHTML += `<div id='{self.chat_container[-1]}' style="{self.style_dict['div_' + "LLM"]};">{new_msg_html}</div>`;
                                        }} else {{
                                            // 更新已有元素：设置innerHTML（修复赋值语法）
                                            container_temp.innerHTML += `{new_msg_html}`;
                                        }}
                                        // 滚动到底部
                                        window.scrollTo(0, document.body.scrollHeight);
                                        requestAnimationFrame(() => {{
                                            var container_temp = document.getElementById('{self.chat_container[-1]}');
                                            if (container_temp) {{ 
                                                MathJax.typesetPromise([container_temp]).catch(err => console.error('MathJax渲染失败:', err));
                                            }} else {{
                                                console.error('未找到容器元素:', '{self.chat_container[-1]}');
                                            }}
                                        }});
                                    }} catch (e) {{
                                        console.error('操作失败:', e);
                                    }}
                                }}
                                """
            self.chat_display.page().runJavaScript(js_code)
            #self.chat_display.page().toHtml(lambda html: print("HTML内容:", html))
            #self.chat_container.append("content" + str(len(self.chat_container)))
            self.temp_message = ''

        elif self.temp_message!='':
            if self.flag_em:
                #print(f"emd_inf:{self.temp_message}")
                new_msg_html = f"""
                               <span style="{self.style_dict["message"]}"><strong>{self.temp_message}</strong></span>
                               """
            elif self.flag_strong:
                new_msg_html = f"""
                               <span style="{self.style_dict["message"]}"><strong>{self.temp_message}</strong></span>
                               """
            else:
                new_msg_html = f"""
                                <span style="{self.style_dict["message"]}">{self.temp_message}</span>
                                """
            print(f"new_meg_html:{new_msg_html}")
            #self.chat_container.append("content" + str(len(self.chat_container)))
            js_code = f"""
                    var container = document.getElementById('content-container');
                    var container_temp = document.getElementById('{self.chat_container[-1]}');
                    if (!container) {{
                        console.error('容器元素未找到！请检查HTML中是否存在id="content-container"的元素');
                    }} else {{
                        try {{
                            if (!container_temp) {{
                                // 新增元素：使用innerHTML追加模板字符串
                                container.innerHTML += `<div id='{self.chat_container[-1]}' style="{self.style_dict['div_' + "LLM"]};">{new_msg_html}</div>`;
                            }} else {{
                                // 更新已有元素：设置innerHTML（修复赋值语法）
                                container_temp.innerHTML += `{new_msg_html}`;
                            }}
                            // 滚动到底部
                            window.scrollTo(0, document.body.scrollHeight);
                            requestAnimationFrame(() => {{
                                var container_temp = document.getElementById('{self.chat_container[-1]}');
                                console.log(container_temp ? container_temp.innerHTML : '元素不存在');
                                if (container_temp) {{ 
                                    MathJax.typesetPromise([container_temp]).catch(err => console.error('MathJax渲染失败:', err));
                                }} else {{
                                    console.error('未找到容器元素:', '{self.chat_container[-1]}');
                                }}
                            }});
                        }} catch (e) {{
                            console.error('操作失败:', e);
                        }}
                    }}
                    """
            self.chat_display.page().runJavaScript(js_code)
            self.temp_message=''





    def clear_chat(self):
        """清空对话"""
        print(f":self.chat_history:{self.chat_history}")
        self.chat_history = []
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


if __name__ == "__main__":
    app = QApplication(sys.argv)
    app.setFont(QFont("SimHei"))
    QApplication.setAttribute(Qt.AA_EnableHighDpiScaling, True)
    window = LLMChatInterface()
    window.show()
    sys.exit(app.exec_())
