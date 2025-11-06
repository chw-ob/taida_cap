*** Settings ***
Resource          Autotest_Source.resource

*** Variables ***
${INSTRUMENT_IN}    EC7800    # 从命令行传入的仪器参数
${INSTRUMENT_OUT}    IT8900    # 从命令行传入的仪器参数
${INSTRUMENT_SOURCE}    EC7800    # 从命令行传入的仪器参数
${INSTRUMENT_LOAD}    IT8900    # 从命令行传入的仪器参数
${SOURCE_VOLTAGE}    220
${SOURCE_CURRENT}    4
${FREQUENCY}      50
${LOAD_CURRENT}    1

*** Test Cases ***
测量输入电流
    [Documentation]    测量输入电流
    Log    开始使用仪器 ${INSTRUMENT_IN} 测量输入电流
    ${current_value}=    测量电流    ${INSTRUMENT_IN}
    Log    测量得到的电流值: ${current_value}A

测量输入电压
    [Documentation]    根据传入的仪器参数测量输入电压
    Log    开始使用仪器 ${INSTRUMENT_IN} 测量输入电压
    ${voltage_value}=    测量电压    ${INSTRUMENT_IN}
    Log    测量得到的电压值: ${voltage_value} V

测量输入功率
    [Documentation]    根据传入的仪器参数测量功率
    Log    开始使用仪器 ${INSTRUMENT_IN} 测量功率
    ${power_value}=    测量功率    ${INSTRUMENT_IN}
    Log    测量得到的功率值: ${power_value} W

测量输出电流
    [Documentation]    根据传入的仪器参数测量输入电流
    ...    使用方式: robot --variable INSTRUMENT_IN_CUR:ZXB001 --test "测量输入电流" Auto_test.robot
    Log    开始使用仪器 ${INSTRUMENT_OUT}测量输入电流
    ${current_value}=    测量电流    ${INSTRUMENT_OUT}
    Log    测量得到的电流值: ${current_value} A

测量输出电压
    [Documentation]    根据传入的仪器参数测量输入电压
    Log    开始使用仪器 ${INSTRUMENT_OUT} 测量输入电压
    ${voltage_value}=    测量电压    ${INSTRUMENT_OUT}
    Log    测量得到的电压值: ${voltage_value} V

测量输出功率
    [Documentation]    根据传入的仪器参数测量功率
    Log    开始使用仪器 ${INSTRUMENT_OUT} 测量功率
    ${power_value}=    测量功率    ${INSTRUMENT_OUT}
    Log    测量得到的功率值: ${power_value} W

测量功率因数
    [Documentation]    根据传入的仪器参数测量功率因数
    Log    开始使用仪器 ${INSTRUMENT_IN} 测量功率因数
    ${pf_value}=    测量功率因数    ${INSTRUMENT_IN}
    Log    测量得到的功率因数值: ${pf_value}

设置电源参数
    [Documentation]    设置电源参数测试
    [Tags]    setup
    Log    开始设置电源参数，仪器: ${INSTRUMENT_SOURCE}
    Run Keyword If    '${INSTRUMENT_SOURCE}' in ['APS7100', 'EC7800','M3132']
    ...    设置电源    ${INSTRUMENT_SOURCE}    ${SOURCE_VOLTAGE}    ${SOURCE_CURRENT}    ${FREQUENCY}
    ...    ELSE
    ...    Log    仪器 ${INSTRUMENT_SOURCE} 不支持电源设置功能

打开电源开关
    [Documentation]    控制电源开关测试
    [Tags]    control
    Log    开始控制电源开关，仪器: ${INSTRUMENT_SOURCE}
    Run Keyword If    '${INSTRUMENT_SOURCE}' in ['APS7100', 'EC7800','M3132']
    ...    开关电源    ${INSTRUMENT_SOURCE}    1
    ...    ELSE
    ...    Log    仪器 ${INSTRUMENT_SOURCE} 不支持电源开关控制

关闭电源开关
    [Documentation]    控制电源开关测试
    [Tags]    control
    Log    开始控制电源开关，仪器: ${INSTRUMENT_SOURCE}
    Run Keyword If    '${INSTRUMENT_SOURCE}' in ['APS7100', 'EC7800', 'M3132']
    ...    开关电源    ${INSTRUMENT_SOURCE}    0
    ...    ELSE
    ...    Log    仪器 ${INSTRUMENT_SOURCE} 不支持电源开关控制

设置负载
    [Documentation]    设置负载模式测试
    [Tags]    load
    Log    开始设置负载模式，仪器: ${INSTRUMENT_LOAD}
    Run Keyword If    '${INSTRUMENT_LOAD}' in ['IT8800', 'IT8900']
    ...    设置负载模式    ${INSTRUMENT_LOAD}    CC    ${LOAD_CURRENT}    0
    ...    ELSE
    ...    Log    仪器 ${INSTRUMENT_LOAD} 不支持负载设置功能

打开负载开关
    Run Keyword If    '${INSTRUMENT_LOAD}' in ['IT8800', 'IT8900']
    ...    开关负载    ${INSTRUMENT_LOAD}    1
    ...    ELSE
    ...    Log    仪器 ${INSTRUMENT_LOAD} 不支持负载开关控制

关闭负载开关
    Run Keyword If    '${INSTRUMENT_LOAD}' in ['IT8800', 'IT8900']
    ...    开关负载    ${INSTRUMENT_LOAD}    0
    ...    ELSE
    ...    Log    仪器 ${INSTRUMENT_LOAD} 不支持负载开关控制

单点效率测试
    [Documentation]    单点效率测试 - 在特定工作点测量效率
    ...    使用方式:
    ...    robot --variable INSTRUMENT_SOURCE:APS7100 --variable INSTRUMENT_LOAD:IT8800 --variable INSTRUMENT_IN:ZXB001 --variable INSTRUMENT_OUT:ZXB002 --variable SOURCE_VOLTAGE:220 --variable SOURCE_CURRENT:5.0 --variable FREQUENCY:50 --variable LOAD_CURRENT:2.0 STM32_Test_Suite.robot
    [Tags]    efficiency    single-point
    # 参数检查
    Log    开始单点效率测试...
    Log    测试参数: 输入电压=${SOURCE_VOLTAGE}V, 输入限流=${SOURCE_CURRENT}A, 频率=${FREQUENCY}Hz, 负载电流=${LOAD_CURRENT}A
    # 初始化设备状态
    开关电源    ${INSTRUMENT_SOURCE}    0
    开关负载    ${INSTRUMENT_LOAD}    0
    # 设置电源参数
    设置电源    ${INSTRUMENT_SOURCE}    ${SOURCE_VOLTAGE}    ${SOURCE_CURRENT}    ${FREQUENCY}
    Sleep    1s
    # 开启电源
    开关电源    ${INSTRUMENT_SOURCE}    1
    Sleep    2s
    # 设置并开启负载
    设置负载模式    ${INSTRUMENT_LOAD}    CC    ${LOAD_CURRENT}    0
    开关负载    ${INSTRUMENT_LOAD}    1
    Sleep    4s
    # 测量功率
    ${input_power}=    测量功率    ${INSTRUMENT_IN}
    ${output_power}=    测量功率    ${INSTRUMENT_OUT}
    # 计算效率
    ${efficiency}=    Evaluate    (${output_power} / (${input_power} + 0.01)) * 100
    ${efficiency}=    Evaluate    round(${efficiency}, 2)
    Log    输入功率: ${input_power} W
    Log    输出功率: ${output_power} W
    Log    效率: ${efficiency}%
    # 关闭设备
    开关电源    ${INSTRUMENT_SOURCE}    0
    Sleep    3s
    开关负载    ${INSTRUMENT_LOAD}    0
    Log    单点效率测试完成

扫描效率测试
    [Documentation]    完整效率扫描测试 - 在不同负载条件下测量效率曲线
    ...    使用方式:
    ...    robot --variable INSTRUMENT_SOURCE:EC7800 --variable INSTRUMENT_LOAD:IT8900 --variable INSTRUMENT_IN:ZXB001 --variable INSTRUMENT_OUT:ZXB002 --variable SOURCE_VOLTAGE:220 --variable SOURCE_CURRENT:10.0 --variable FREQUENCY:50 --variable LOAD_CURRENT_LIST:0.5,1.0,2.0,3.0,4.0,5.0 STM32_Test_Suite.robot
    [Tags]    efficiency    sweep
    # 参数检查
    Log    开始完整效率扫描测试...
    # 解析负载电流列表
    ${load_currents}=    Evaluate    [float(x.strip()) for x in '${LOAD_CURRENT_LIST}'.split(',')] if '${LOAD_CURRENT_LIST}' != '${EMPTY}' else [1.0, 2.0, 3.0, 4.0, 5.0]
    # 初始化设备状态
    开关电源    ${INSTRUMENT_SOURCE}    0
    开关负载    ${INSTRUMENT_LOAD}    0
    Sleep    1s
    # 设置电源参数
    设置电源    ${INSTRUMENT_SOURCE}    ${SOURCE_VOLTAGE}    ${SOURCE_CURRENT}    ${FREQUENCY}
    Sleep    1s
    # 开启电源
    开关电源    ${INSTRUMENT_SOURCE}    1
    Sleep    2s
    # 效率扫描
    @{efficiency_results}=    Create List
    FOR    ${load_current}    IN    @{load_currents}
        Log    测试负载电流: ${load_current}A
        # 设置负载
        设置负载模式    ${INSTRUMENT_LOAD}    CC    ${load_current}    0
        开关负载    ${INSTRUMENT_LOAD}    1
        Sleep    3s    # 等待稳定
        # 测量参数
        ${input_voltage}=    测量电压    ${INSTRUMENT_IN}
        ${input_current}=    测量电流    ${INSTRUMENT_IN}
        ${input_power}=    测量功率    ${INSTRUMENT_IN}
        ${output_voltage}=    测量电压    ${INSTRUMENT_OUT}
        ${output_current}=    测量电流    ${INSTRUMENT_OUT}
        ${output_power}=    测量功率    ${INSTRUMENT_OUT}
        # 计算效率
        ${efficiency}=    Evaluate    (${output_power} / ${input_power}) * 100
        ${efficiency}=    Evaluate    round(${efficiency}, 2)
        # 记录结果
        ${result}=    Create Dictionary
        ...    load_current=${load_current}
        ...    input_voltage=${input_voltage}
        ...    input_current=${input_current}
        ...    input_power=${input_power}
        ...    output_voltage=${output_voltage}
        ...    output_current=${output_current}
        ...    output_power=${output_power}
        ...    efficiency=${efficiency}
        Append To List    ${efficiency_results}    ${result}
        Log    负载 ${load_current}A: 输入=${input_power}W, 输出=${output_power}W, 效率=${efficiency}%
        # 短暂关闭负载准备下一个测试点
        开关负载    ${INSTRUMENT_LOAD}    0
        Sleep    1s
    END
    # 关闭设备
    开关电源    ${INSTRUMENT_SOURCE}    0
    Sleep    2s
    # 输出效率报告
    生成效率报告    ${efficiency_results}
    Log    完整效率扫描测试完成

电压扫描效率测试
    [Documentation]    在不同输入电压下进行效率测试
    ...    使用方式:
    ...    robot --variable INSTRUMENT_SOURCE:APS7100 --variable INSTRUMENT_LOAD:IT8800 --variable INSTRUMENT_IN:ZXB001 --variable INSTRUMENT_OUT:ZXB002 --variable SOURCE_VOLTAGE_LIST:180,200,220,240,260 --variable SOURCE_CURRENT:5.0 --variable FREQUENCY:50 --variable LOAD_CURRENT:3.0 STM32_Test_Suite.robot
    [Tags]    efficiency    voltage-sweep
    Log    开始电压扫描效率测试...
    # 解析电压列表
    ${voltages}=    Evaluate    [float(x.strip()) for x in '${SOURCE_VOLTAGE_LIST}'.split(',')] if '${SOURCE_VOLTAGE_LIST}' != '${EMPTY}' else [180, 200, 220, 240, 260]
    # 初始化设备状态
    开关电源    ${INSTRUMENT_SOURCE}    0
    开关负载    ${INSTRUMENT_LOAD}    0
    Sleep    1s
    # 设置负载
    设置负载模式    ${INSTRUMENT_LOAD}    CC    ${LOAD_CURRENT}    0
    @{voltage_results}=    Create List
    FOR    ${voltage}    IN    @{voltages}
        Log    测试输入电压: ${voltage}V
        # 设置电源
        设置电源    ${INSTRUMENT_SOURCE}    ${voltage}    ${SOURCE_CURRENT}    ${FREQUENCY}
        Sleep    1s
        # 开启电源
        开关电源    ${INSTRUMENT_SOURCE}    1
        Sleep    2s
        # 开启负载
        开关负载    ${INSTRUMENT_LOAD}    1
        Sleep    3s
        # 测量参数
        ${input_power}=    测量功率    ${INSTRUMENT_IN}
        ${output_power}=    测量功率    ${INSTRUMENT_OUT}
        # 计算效率
        ${efficiency}=    Evaluate    (${output_power} / ${input_power}) * 100
        ${efficiency}=    Evaluate    round(${efficiency}, 2)
        # 记录结果
        ${result}=    Create Dictionary
        ...    input_voltage=${voltage}
        ...    input_power=${input_power}
        ...    output_power=${output_power}
        ...    efficiency=${efficiency}
        Append To List    ${voltage_results}    ${result}
        Log    电压 ${voltage}V: 效率=${efficiency}%
        # 关闭电源准备下一个测试点
        开关电源    ${INSTRUMENT_SOURCE}    0
        Sleep    2s
        开关负载    ${INSTRUMENT_LOAD}    0
        Sleep    1s
    END
    # 生成电压扫描报告
    生成电压扫描报告    ${voltage_results}
    Log    电压扫描效率测试完成

*** Keywords ***
生成效率报告
    [Arguments]    ${results}
    [Documentation]    生成效率测试报告
    Log    \n=== 效率测试报告 ===
    Log    负载电流(A)\t输入功率(W)\t输出功率(W)\t效率(%)
    FOR    ${result}    IN    @{results}
        Log    ${result}[load_current]\t${result}[input_power]\t${result}[output_power]\t${result}[efficiency]
    END
    # 计算平均效率
    ${efficiencies}=    Evaluate    [r['efficiency'] for r in ${results}]
    ${avg_efficiency}=    Evaluate    sum(${efficiencies}) / len(${efficiencies})
    ${avg_efficiency}=    Evaluate    round(${avg_efficiency}, 2)
    ${max_efficiency}=    Evaluate    max(${efficiencies})
    Log    平均效率: ${avg_efficiency}%
    Log    最高效率: ${max_efficiency}%

生成电压扫描报告
    [Arguments]    ${results}
    [Documentation]    生成电压扫描测试报告
    Log    \n=== 电压扫描效率测试报告 ===
    Log    输入电压(V)\t输入功率(W)\t输出功率(W)\t效率(%)
    FOR    ${result}    IN    @{results}
        Log    ${result}[input_voltage]\t${result}[input_power]\t${result}[output_power]\t${result}[efficiency]
    END
