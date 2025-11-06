# _*_coding : utf-8 _*_
import serial
import serial.tools.list_ports
import struct
import time
from enum import IntEnum


class CommandType(IntEnum):
    READ_VOLTAGE = 0x01
    READ_CURRENT = 0x02
    SET_PARAM = 0x03
    READ_PF = 0x04


class STM32Communicator:
    # 添加类变量来管理全局实例
    _global_instance = None
    _connected_devices = {}

    def __init__(self):
        """初始化STM32通信器"""
        self._insts = {}  # 格式: {device_id: inst}
        self.default_timeout = 1
        self.default_baudrate = 115200

        # 设置全局实例
        STM32Communicator._global_instance = self

    def _getInst(self, device_id, vid, pid, baudrate=None, timeout=None):
        """
        获取串口实例
        :param device_id: 设备标识符（自定义，用于区分不同设备）
        :param vid: 供应商ID（十六进制字符串，如 "0483"）
        :param pid: 产品ID（十六进制字符串，如 "5740"）
        :param baudrate: 波特率
        :param timeout: 超时时间
        :return: 串口实例
        """
        if self._insts.get(device_id) is None:
            # 直接根据VID和PID查找设备
            found_device = None
            ports = serial.tools.list_ports.comports()

            for port in ports:
                port_vid = f"{port.vid:04X}" if port.vid else None
                port_pid = f"{port.pid:04X}" if port.pid else None

                if port_vid == vid.upper() and port_pid == pid.upper():
                    found_device = {
                        'device': port.device,
                        'vid': port_vid,
                        'pid': port_pid,
                        'serial_number': port.serial_number,
                        'description': port.description,
                        'manufacturer': port.manufacturer
                    }
                    break

            if not found_device:
                raise Exception(f"未找到VID={vid}, PID={pid}的设备")

            baud = baudrate if baudrate else self.default_baudrate
            tout = timeout if timeout else self.default_timeout

            try:
                inst = serial.Serial(
                    port=found_device['device'],
                    baudrate=baud,
                    timeout=tout
                )
                time.sleep(2)  # 等待串口初始化完成
                self._insts[device_id] = {
                    'inst': inst,
                    'device_info': found_device
                }
                # 更新全局连接状态
                STM32Communicator._connected_devices[device_id] = {
                    "vid": vid,
                    "pid": pid,
                    "initialized": True
                }
                print(f'STM32设备[ID={device_id}, VID={vid}, PID={pid}, port={found_device["device"]}]')
            except Exception as e:
                raise Exception(f"无法打开串口 {found_device['device']}: {str(e)}")

        return self._insts[device_id]['inst']

    def build_frame(self, cmd):
        """构建发送帧"""
        frame_len = 2
        frame = bytearray([0xAA, frame_len, int(cmd), 0x55])
        return frame

    def parse_response(self, response):
        """解析接收到的响应帧"""
        if len(response) < 8:
            print(f"响应帧长度不足: {len(response)}字节")
            return None

        if response[0] != 0xAA or response[-1] != 0x55:
            print("帧头或帧尾不匹配")
            return None

        cmd = response[2]
        data = struct.unpack('f', response[3:7])[0]
        return (cmd, data)

    def initialize(self, device_id, vid, pid, baudrate=None, timeout=None):
        """
        初始化STM32设备
        :param device_id: 设备标识符（自定义，用于区分不同设备）
        :param vid: 供应商ID（十六进制字符串）
        :param pid: 产品ID（十六进制字符串）
        :param baudrate: 波特率
        :param timeout: 超时时间
        :return: True if success, False otherwise
        """
        try:
            inst = self._getInst(device_id, vid, pid, baudrate, timeout)

            # 发送测试命令验证连接
            test_result = self.send_command(device_id, CommandType.READ_VOLTAGE, vid, pid)
            if test_result is not None:
                device_info = self._insts[device_id]['device_info']
                print(f"STM32设备初始化成功 [ID={device_id}, VID={vid}, PID={pid}, Port={device_info['device']}]")
                return True
            else:
                print("STM32设备响应异常")
                return False

        except Exception as e:
            print(f"STM32设备初始化失败: {str(e)}")
            return False

    def send_command(self, device_id, cmd, vid=None, pid=None):
        """
        发送命令并接收响应
        :param device_id: 设备标识符
        :param cmd: 命令字节
        :param vid: 供应商ID（可选，如果设备已初始化则不需要）
        :param pid: 产品ID（可选，如果设备已初始化则不需要）
        :return: 接收到的数据或None
        """
        try:
            if device_id not in self._insts and (vid is None or pid is None):
                raise Exception("设备未初始化，需要提供VID和PID参数")

            if device_id not in self._insts:
                inst = self._getInst(device_id, vid, pid)
            else:
                inst = self._insts[device_id]['inst']

            frame = self.build_frame(cmd)
            inst.write(frame)
            # print(f"发送到 ID{device_id}: {[hex(b) for b in frame]}")

            time.sleep(0.1)
            response = inst.read_all()

            if not response:
                print("未收到响应")
                return None

            # print(f"从 ID{device_id} 接收: {[hex(b) for b in response]}")
            return self.parse_response(response)

        except Exception as e:
            print(f"发送命令失败: {str(e)}")
            return None

    def read_voltage(self, device_id, vid=None, pid=None):
        """读取电压值"""
        result = self.send_command(device_id, CommandType.READ_VOLTAGE, vid, pid)
        if result is not None:
            cmd, value = result
            return value
        return None

    def read_current(self, device_id, vid=None, pid=None):
        """读取电流值"""
        result = self.send_command(device_id, CommandType.READ_CURRENT, vid, pid)
        if result is not None:
            cmd, value = result
            return value
        return None
    def read_pf(self, device_id, vid=None, pid=None):
        result = self.send_command(device_id, CommandType.READ_PF, vid, pid)
        if result is not None:
            cmd, value = result
            return value
        return None
    def get_device_info(self, device_id):
        """获取设备信息"""
        if device_id in self._insts:
            return self._insts[device_id]['device_info']
        return None

    def close(self, device_id=None):
        """关闭连接"""
        if device_id:
            if device_id in self._insts:
                self._insts[device_id]['inst'].close()
                del self._insts[device_id]
                if device_id in STM32Communicator._connected_devices:
                    del STM32Communicator._connected_devices[device_id]
                print(f"已关闭设备 ID{device_id}")
        else:
            for device_id, device_data in self._insts.items():
                device_data['inst'].close()
                print(f"已关闭设备 ID{device_id}")
            self._insts.clear()
            STM32Communicator._connected_devices.clear()

    # 添加类方法用于全局访问
    @classmethod
    def get_global_instance(cls):
        """获取全局实例"""
        return cls._global_instance

    @classmethod
    def get_connected_devices(cls):
        """获取所有连接的设备"""
        return cls._connected_devices.copy()

    @classmethod
    def is_device_connected(cls, device_id):
        """检查设备是否连接"""
        return device_id in cls._connected_devices