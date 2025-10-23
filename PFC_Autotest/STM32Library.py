# STM32Library.py - Robot Framework封装库
from stm32_communicator import STM32Communicator, CommandType


class STM32Library:
    """Robot Framework STM32设备测试库"""

    def __init__(self):
        # 使用全局的communicator实例
        self.communicator = STM32Communicator.get_global_instance()
        if self.communicator is None:
            self.communicator = STM32Communicator()

    def initialize_stm32_device(self, device_id, vid, pid, baudrate=115200, timeout=1):
        """初始化STM32设备

        Args:
            device_id: 设备标识符
            vid: 供应商ID (如 "0483")
            pid: 产品ID (如 "5740")
            baudrate: 波特率，默认115200
            timeout: 超时时间，默认1秒
        """
        # 转换参数类型
        baudrate = int(baudrate)
        timeout = float(timeout)

        success = self.communicator.initialize(device_id, vid, pid, baudrate, timeout)
        return success

    def read_voltage_from_device(self, device_id):
        """从指定设备读取电压值

        Args:
            device_id: 设备标识符

        Returns:
            float: 电压值(V)
        """
        if not STM32Communicator.is_device_connected(device_id):
            raise Exception(f"设备 {device_id} 未初始化")

        voltage = self.communicator.read_voltage(device_id)

        if voltage is None:
            raise Exception(f"从设备 {device_id} 读取电压失败")

        return float(voltage)

    def read_current_from_device(self, device_id):
        """从指定设备读取电流值

        Args:
            device_id: 设备标识符

        Returns:
            float: 电流值(A)
        """
        if not STM32Communicator.is_device_connected(device_id):
            raise Exception(f"设备 {device_id} 未初始化")

        current = self.communicator.read_current(device_id)

        if current is None:
            raise Exception(f"从设备 {device_id} 读取电流失败")

        return float(current)

    def read_all_parameters_from_device(self, device_id):
        """从设备读取所有参数

        Args:
            device_id: 设备标识符

        Returns:
            dict: 包含电压和电流的字典
        """
        voltage = self.read_voltage_from_device(device_id)
        current = self.read_current_from_device(device_id)

        return {
            "voltage": voltage,
            "current": current
        }

    def voltage_should_be_within_range(self, device_id, min_voltage, max_voltage):
        """验证设备电压在指定范围内

        Args:
            device_id: 设备标识符
            min_voltage: 最小电压值
            max_voltage: 最大电压值
        """
        # 转换参数为浮点数
        min_voltage = float(min_voltage)
        max_voltage = float(max_voltage)

        voltage = self.read_voltage_from_device(device_id)

        if not (min_voltage <= voltage <= max_voltage):
            raise Exception(f"设备 {device_id} 电压 {voltage:.3f}V 不在范围 [{min_voltage}V, {max_voltage}V] 内")

    def current_should_be_within_range(self, device_id, min_current, max_current):
        """验证设备电流在指定范围内

        Args:
            device_id: 设备标识符
            min_current: 最小电流值
            max_current: 最大电流值
        """
        # 转换参数为浮点数
        min_current = float(min_current)
        max_current = float(max_current)

        current = self.read_current_from_device(device_id)

        if not (min_current <= current <= max_current):
            raise Exception(f"设备 {device_id} 电流 {current:.3f}A 不在范围 [{min_current}A, {max_current}A] 内")

    def close_all_connections(self):
        """关闭所有设备连接"""
        self.communicator.close()

    def get_connected_device_count(self):
        """获取已连接的设备数量"""
        return len(STM32Communicator.get_connected_devices())

    def device_should_be_connected(self, device_id):
        """验证设备是否已连接"""
        if not STM32Communicator.is_device_connected(device_id):
            connected_devices = list(STM32Communicator.get_connected_devices().keys())
            raise Exception(f"设备 {device_id} 未连接。当前已连接设备: {connected_devices}")
        return True

    def is_device_connected(self, device_id):
        """检查设备是否已连接（返回布尔值）"""
        return STM32Communicator.is_device_connected(device_id)

    def list_connected_devices(self):
        """列出所有已连接的设备ID"""
        return list(STM32Communicator.get_connected_devices().keys())


if __name__ == "__main__":
    # 测试代码
    stm32 = STM32Library()
    print("初始化设备1:", stm32.initialize_stm32_device("STM32_Device1", "0483", "5740"))
    print("初始化设备2:", stm32.initialize_stm32_device("STM32_Device2", "0484", "5741"))
    print("已连接设备:", stm32.list_connected_devices())
    print("设备1连接状态:", stm32.device_should_be_connected("STM32_Device1"))
    print("设备2连接状态:", stm32.device_should_be_connected("STM32_Device2"))

    # 测试读取数据
    try:
        voltage = stm32.read_voltage_from_device("STM32_Device2")
        voltage1 = stm32.read_voltage_from_device("STM32_Device1")
        print(f"设备2电压: {voltage} V")
    except Exception as e:
        print(f"读取电压失败: {e}")
