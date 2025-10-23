# _*_coding : utf-8 _*_
# @Time : 2025/10/7 17:06
# @Author : 曾宪博
# @File : test2
# @Project : PFC_Autotest
import serial
import struct
import time
from enum import IntEnum


class CommandType(IntEnum):
    READ_VOLTAGE = 0x01
    READ_CURRENT = 0x02
    SET_PARAM = 0x03


class STM32Communicator:
    def __init__(self, port='COM12', baudrate=115200, timeout=1):
        """
        初始化串口通信
        :param port: 串口设备路径 (Windows: 'COMx', Linux: '/dev/ttyACM0')
        :param baudrate: 波特率 (应与STM32配置一致)
        :param timeout: 超时时间(秒)
        """
        self.ser = serial.Serial(port=port, baudrate=baudrate, timeout=timeout)
        time.sleep(2)  # 等待串口初始化完成

    def build_frame(self, cmd):
        """
        构建发送帧
        :param cmd: 命令字节 (使用CommandType枚举)
        :return: 完整的帧字节数组
        """
        # 简单命令帧: [START][LEN][CMD][END]
        frame_len = 2  # 1+1+1+1
        frame = bytearray([0xAA, frame_len, int(cmd), 0x55])
        return frame

    def parse_response(self, response):
        """
        解析接收到的响应帧
        :param response: 接收到的字节数据
        :return: 元组 (command_type, data) 或 None(如果解析失败)
        """
        if len(response) < 8:
            print(f"响应帧长度不足: {len(response)}字节")
            return None

        if response[0] != 0xAA or response[-1] != 0x55:
            print("帧头或帧尾不匹配")
            return None

        cmd = response[2]
        # 提取float数据 (字节3-6)
        data = struct.unpack('f', response[3:7])[0]
        return (cmd, data)

    def send_command(self, cmd):
        """
        发送命令并接收响应
        :param cmd: 命令字节 (使用CommandType枚举)
        :return: 接收到的数据或None
        """
        frame = self.build_frame(cmd)
        self.ser.write(frame)
        print(f"发送: {[hex(b) for b in frame]}")

        # 等待并读取响应
        time.sleep(0.1)  # 等待设备响应
        response = self.ser.read_all()

        if not response:
            print("未收到响应")
            return None

        print(f"接收: {[hex(b) for b in response]}")
        return self.parse_response(response)

    def close(self):
        """关闭串口连接"""
        self.ser.close()

# 使用示例
if __name__ == "__main__":
    try:
        # 初始化通信器
        # 注意: 根据你的系统修改串口设备路径
        # stm32 = STM32Communicator(port='/dev/ttyACM0')  # Linux
        stm32 = STM32Communicator(port='COM11')  # Windows

        while True:
            print("\n选择操作:")
            print("1. 读取电压")
            print("2. 读取电流")
            print("3. 退出")
            choice = input("请输入选项(1-3): ")

            if choice == '1':
                print("发送读取电压命令...")
                result = stm32.send_command(CommandType.READ_VOLTAGE)
                if result is not None:
                    cmd, value = result
                    print(f"电压值: {value:.3f} V")
            elif choice == '2':
                print("发送读取电流命令...")
                result = stm32.send_command(CommandType.READ_CURRENT)
                if result is not None:
                    cmd, value = result
                    print(f"电流值: {value:.3f} A")
            elif choice == '3':
                break
            else:
                print("无效输入，请重新选择")

    except Exception as e:
        print(f"发生错误: {str(e)}")
    finally:
        if 'stm32' in locals():
            stm32.close()
        print("程序结束")
