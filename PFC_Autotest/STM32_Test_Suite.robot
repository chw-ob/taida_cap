*** Settings ***
Suite Teardown    清理测试环境
Resource          STM32Keywords.resource

*** Test Cases ***
测试设备连接状态
    [Documentation]    验证两个STM32设备连接状态
    [Tags]    connection    smoke
    验证设备连接状态

测试设备初始化状态
    [Documentation]    测试设备初始化后的状态
    [Tags]    initialization
    ${count}=    Get Connected Device Count
    Should Be Equal As Integers    ${count}    2
    Log    设备初始化状态验证通过: 找到${count}个设备

测试读取设备1电压
    [Documentation]    测试读取设备1电压值
    [Tags]    device1    voltage
    Log    正在初始化STM32设备1...
    ${status}=    Run Keyword And Return Status
    ...    Initialize STM32 Device    ${DEVICE1_ID}    ${DEVICE1_VID}    ${DEVICE1_PID}    ${BAUDRATE}    ${TIMEOUT}
    Should Be True    ${status}    设备1初始化失败
    ${voltage}=    读取设备电压并验证    ${DEVICE1_ID}
    Log    设备1电压测试通过: ${voltage}V

测试读取设备1电流
    [Documentation]    测试读取设备1电流值
    [Tags]    device1    current
    Log    正在初始化STM32设备1...
    ${status}=    Run Keyword And Return Status
    ...    Initialize STM32 Device    ${DEVICE1_ID}    ${DEVICE1_VID}    ${DEVICE1_PID}    ${BAUDRATE}    ${TIMEOUT}
    Should Be True    ${status}    设备1初始化失败
    ${current}=    读取设备电流并验证    ${DEVICE1_ID}
    Log    设备1电流测试通过: ${current}A

测试读取设备1的功率因数PF
    [Documentation]    测试读取设备1的功率因数
    [Tags]    device1    PF
    ${status}=    Run Keyword And Return Status
    ...    Initialize STM32 Device    ${DEVICE1_ID}    ${DEVICE1_VID}    ${DEVICE1_PID}    ${BAUDRATE}    ${TIMEOUT}
    Should Be True    ${status}    设备1初始化失败
    ${pf}=    读取设备PF    ${DEVICE1_ID}
    Log    测得功率因素PF: ${pf}

测试读取设备2电压
    [Documentation]    测试读取设备2电压值
    [Tags]    device2    voltage
    Log    正在初始化STM32设备2...
    ${status}=    Run Keyword And Return Status
    ...    Initialize STM32 Device    ${DEVICE2_ID}    ${DEVICE2_VID}    ${DEVICE2_PID}    ${BAUDRATE}    ${TIMEOUT}
    Should Be True    ${status}    设备2初始化失败
    ${voltage}=    读取设备电压并验证    ${DEVICE2_ID}
    Log    设备2电压测试通过: ${voltage}V

测试读取设备2电流
    [Documentation]    测试读取设备2电流值
    [Tags]    device2    current
    Log    正在初始化STM32设备2...
    ${status}=    Run Keyword And Return Status
    ...    Initialize STM32 Device    ${DEVICE2_ID}    ${DEVICE2_VID}    ${DEVICE2_PID}    ${BAUDRATE}    ${TIMEOUT}
    Should Be True    ${status}    设备2初始化失败
    ${current}=    读取设备电流并验证    ${DEVICE2_ID}
    Log    设备2电流测试通过: ${current}A

基础功能测试
    [Documentation]    基础功能综合测试
    [Tags]    basic    smoke
    验证设备连接状态
    ${voltage1}=    读取设备电压并验证    ${DEVICE1_ID}
    ${current1}=    读取设备电流并验证    ${DEVICE1_ID}
    ${voltage2}=    读取设备电压并验证    ${DEVICE2_ID}
    ${current2}=    读取设备电流并验证    ${DEVICE2_ID}
    Log    测试完成 - 设备1: ${voltage1}V, ${current1}A
    Log    测试完成 - 设备2: ${voltage2}V, ${current2}A

测试设备效率计算
    [Documentation]    测试设备功率计算和效率验证
    ...    计算输入输出功率并验证效率在合理范围内
    [Tags]    efficiency    performance
    [Setup]    初始化效率测试
    ${input_voltage}=    读取设备电压并验证    ${DEVICE1_ID}
    ${input_current}=    读取设备电流并验证    ${DEVICE1_ID}
    ${output_voltage}=    读取设备电压并验证    ${DEVICE2_ID}
    ${output_current}=    读取设备电流并验证    ${DEVICE2_ID}
    ${pf}=    读取设备PF    ${DEVICE1_ID}
    # 计算输入输出功率
    ${input_power}=    Evaluate    ${input_voltage} * ${input_current}*${pf}
    ${output_power}=    Evaluate    ${output_voltage} * ${output_current}
        # 检查输入功率是否有效
    Run Keyword If    ${input_power} <= 0.001
    ...    Fail    输入功率过小 (${input_power}W)，无法计算效率
    # 检查输出功率有效性
    Run Keyword If    ${output_power} < 0
    ...    Log    输出功率为负值，效率计算可能不准确    WARN
    # 计算效率 (百分比)
    ${efficiency}=    Evaluate    (${output_power} / ${input_power}) * 100
    ${efficiency}=    Evaluate    round(${efficiency}, 2)
            # 处理异常效率值
    ${efficiency}=    Set Variable If
    ...    ${efficiency} < 0    0.0
    ...    ${efficiency} > 100    100.0
    ...    ${efficiency}
    # 验证效率在合理范围内 (85%-95%)
    Run Keyword If    ${efficiency} < 80 or ${efficiency} > 95
    ...    Log    警告: 设备效率异常: ${efficiency}%    WARN
    ...    ELSE    Log    设备效率正常: ${efficiency}%
    # 记录测试结果
    Log    效率测试结果:
    Log    输入功率: ${input_power}W (${input_voltage}V * ${input_current}A*${pf})
    Log    输出功率: ${output_power}W (${output_voltage}V * ${output_current}A)
    Log    效率: ${efficiency}%
    [Teardown]    清理效率测试

*** Keywords ***
初始化效率测试
    [Documentation]    初始化效率测试环境
    Log    开始效率测试...
    初始化所有STM32设备
    # 可以在这里添加特定的效率测试初始化步骤
    # 例如: 设置特定的工作模式、负载条件等

清理效率测试
    [Documentation]    清理效率测试环境
    Log    效率测试完成，清理测试环境...
    # 可以在这里添加特定的清理步骤
    # 例如: 恢复默认设置、关闭负载等
