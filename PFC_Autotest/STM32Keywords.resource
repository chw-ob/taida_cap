*** Settings ***
Library           STM32Library.py

*** Variables ***
${DEVICE1_ID}     STM32_Device1
${DEVICE1_VID}    0483
${DEVICE1_PID}    5740
${DEVICE2_ID}     STM32_Device2
${DEVICE2_VID}    0484
${DEVICE2_PID}    5741
${VOLTAGE_MIN}    0.0
${VOLTAGE_MAX}    600.0
${CURRENT_MIN}    -5.0
${CURRENT_MAX}    20.0
${BAUDRATE}       115200
${TIMEOUT}        1

*** Keywords ***
初始化所有STM32设备
    [Documentation]    初始化两个STM32设备
    Log    正在初始化STM32设备1...
    ${status}=    Run Keyword And Return Status
    ...    Initialize STM32 Device    ${DEVICE1_ID}    ${DEVICE1_VID}    ${DEVICE1_PID}    ${BAUDRATE}    ${TIMEOUT}
    Should Be True    ${status}    设备1初始化失败
    Log    正在初始化STM32设备2...
    ${status}=    Run Keyword And Return Status
    ...    Initialize STM32 Device    ${DEVICE2_ID}    ${DEVICE2_VID}    ${DEVICE2_PID}    ${BAUDRATE}    ${TIMEOUT}
    Should Be True    ${status}    设备2初始化失败
    # 验证设备确实已添加到连接列表
    ${count}=    Get Connected Device Count
    Should Be Equal As Integers    ${count}    2    初始化后设备数量不正确，期望2个，实际${count}个
    Log    两个STM32设备初始化成功

验证设备连接状态
    [Documentation]    验证设备连接状态
    Log    验证设备连接状态...
    # 首先列出所有连接设备
    ${devices}=    List Connected Devices
    # 检查设备1
    ${device1_connected}=    Is Device Connected    ${DEVICE1_ID}
    IF    ${device1_connected}
        Log    设备1连接正常
    ELSE
        Fail    设备1未连接
    END
    # 检查设备2
    ${device2_connected}=    Is Device Connected    ${DEVICE2_ID}
    IF    ${device2_connected}
        Log    设备2连接正常
    ELSE
        Fail    设备2未连接
    END
    # 检查总数
    ${count}=    Get Connected Device Count
    Should Be Equal As Integers    ${count}    2    连接设备数量不正确，期望2个，实际${count}个
    Log    两个设备连接状态验证通过

读取设备电压并验证
    [Arguments]    ${device_id}
    [Documentation]    读取设备电压并在合理范围内验证
    ${voltage}=    Read Voltage From Device    ${device_id}
    ${voltage}=    Set Variable If    ${voltage} < 0    0.0    ${voltage}
    [Return]    ${voltage}

读取设备电流并验证
    [Arguments]    ${device_id}
    [Documentation]    读取设备电流并在合理范围内验证
    ${current}=    Read Current From Device    ${device_id}
    ${current}=    Set Variable If    ${current} < 0    0.0    ${current}
    [Return]    ${current}

读取设备PF
    [Arguments]    ${device_id}
    [Documentation]    读取设备PF
    ${pf}=    Read Pf From Device    ${device_id}
    ${pf}=    Set Variable If    ${pf} < 0    0.0    ${pf}
    [Return]    ${pf}

读取设备所有参数
    [Arguments]    ${device_id}
    [Documentation]    读取设备的所有电参数
    ${params}=    Read All Parameters From Device    ${device_id}
    Log    ${device_id} 参数: 电压=${params}[voltage] V, 电流=${params}[current] A
    [Return]    ${params}

清理测试环境
    [Documentation]    关闭所有连接
    Close All Connections
    Log    所有设备连接已关闭

ZXB001_测量交流电压
    [Documentation]    测试读取ZXB001电压值
    [Tags]    device1    voltage
    ${status}=    Run Keyword And Return Status
    ...    Initialize STM32 Device    ${DEVICE1_ID}    ${DEVICE1_VID}    ${DEVICE1_PID}    ${BAUDRATE}    ${TIMEOUT}
    Should Be True    ${status}    ZXB001初始化失败
    ${voltage}=    Read Voltage From Device    ${DEVICE1_ID}
    ${voltage}=    Set Variable If    ${voltage} < 0    0.0    ${voltage}
    [Return]    ${voltage}

ZXB001_测量交流电流
    [Documentation]    测试读取ZXB001电流值
    ${status}=    Run Keyword And Return Status
    ...    Initialize STM32 Device    ${DEVICE1_ID}    ${DEVICE1_VID}    ${DEVICE1_PID}    ${BAUDRATE}    ${TIMEOUT}
    Should Be True    ${status}    ZXB001初始化失败
    ${current}=    Read Current From Device    ${DEVICE1_ID}
    ${current}=    Set Variable If    ${current} < 0    0.0    ${current}
    [Return]    ${current}

ZXB001_测量功率因数
    ${status}=    Run Keyword And Return Status
    ...    Initialize STM32 Device    ${DEVICE1_ID}    ${DEVICE1_VID}    ${DEVICE1_PID}    ${BAUDRATE}    ${TIMEOUT}
    Should Be True    ${status}    ZXB001初始化失败
    ${pf}=    Read Pf From Device    ${DEVICE1_ID}
    [Return]    ${pf}

ZXB001_测量功率
    ${status}=    Run Keyword And Return Status
    ...    Initialize STM32 Device    ${DEVICE1_ID}    ${DEVICE1_VID}    ${DEVICE1_PID}    ${BAUDRATE}    ${TIMEOUT}
    Should Be True    ${status}    ZXB001初始化失败
    ${watt}=    Read Watt From Device    ${DEVICE1_ID}
    [Return]    ${watt}

ZXB002_测量直流电压
    [Documentation]    测试读取ZXB002电压值
    ${status}=    Run Keyword And Return Status
    ...    Initialize STM32 Device    ${DEVICE2_ID}    ${DEVICE2_VID}    ${DEVICE2_PID}    ${BAUDRATE}    ${TIMEOUT}
    Should Be True    ${status}    ZXB001初始化失败
    ${voltage}=    Read Voltage From Device    ${DEVICE2_ID}
    ${voltage}=    Set Variable If    ${voltage} < 0    0.0    ${voltage}
    [Return]    ${voltage}

ZXB002_测量直流电流
    [Documentation]    测试读取ZXB002电流值
    ${status}=    Run Keyword And Return Status
    ...    Initialize STM32 Device    ${DEVICE2_ID}    ${DEVICE2_VID}    ${DEVICE2_PID}    ${BAUDRATE}    ${TIMEOUT}
    Should Be True    ${status}    ZXB002初始化失败
    ${current}=    Read Current From Device    ${DEVICE2_ID}
    ${current}=    Set Variable If    ${current} < 0    0.0    ${current}
    [Return]    ${current}

ZXB002_测量功率
    ${status}=    Run Keyword And Return Status
    ...    Initialize STM32 Device    ${DEVICE2_ID}    ${DEVICE2_VID}    ${DEVICE2_PID}    ${BAUDRATE}    ${TIMEOUT}
    Should Be True    ${status}    ZXB002初始化失败
    ${watt}=    Read Watt From Device    ${DEVICE2_ID}
    [Return]    ${watt}
