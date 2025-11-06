*** Settings ***
Resource          DC_Load_IT8800.resource
Resource          DC_Load_IT8900.resource
Resource          AC_Source_APS7100.resource
Resource          STM32Keywords.resource
Resource          AC_Source_EC7800.resource
Resource          DC_Source_M3132.resource

*** Keywords ***
测量电压
    [Arguments]    ${instrument}
    [Documentation]    统一电压测量关键字
    ...    参数说明：
    ...    ${instrument} - 仪器类型 (APS7100|IT8800|ZXB001|ZXB002|EC7800|IT8900|M3132)
    ...    返回值：测量得到的电压值(单位:V)
    ...
    ...    示例：
    ...    ${voltage} = 测量电压 APS7100 读取交流源APS7100的电压
    ...    ${voltage} = 测量电压 IT8800 测量电子负载仪器IT8800电压
    ...    ${voltage} = 测量电压 ZXB001 使用ZXB001测量电压
    ${result}=    Run Keyword If    '${instrument}' == 'APS7100'    APS7100_测量电压
    ...    ELSE IF    '${instrument}' == 'IT8800'    IT8800_测量负载电压
    ...    ELSE IF    '${instrument}' == 'IT8900'    IT8900_测量负载电压
    ...    ELSE IF    '${instrument}' == 'EC7800'    EC7800_测量电压
    ...    ELSE IF    '${instrument}' == 'ZXB001'    ZXB001_测量交流电压
    ...    ELSE IF    '${instrument}' == 'ZXB002'    ZXB002_测量直流电压
    ...    ELSE IF    '${instrument}' == 'M3132'    M3132_读取电源电压
    ...    ELSE    Fail    不支持的仪器类型或参数: ${instrument}
    [Return]    ${result}

测量电流
    [Arguments]    ${instrument}
    [Documentation]    统一电流测量关键字
    ...    参数说明：
    ...    ${instrument} - 仪器类型 (APS7100|IT8800|ZXB001|ZXB002|EC7800|IT8900)
    ...    返回值：测量得到的电流值(单位:A)
    ...    示例：
    ...    ${current} = 测量电流 APS7100 读取交流源APS7100的输出电流
    ...    ${current} = 测量电流 IT8800 测量电子负载仪器IT8800电流
    ...    ${current} = 测量电流 ZXB001 使用ZXB001测量电流
    ${result}=    Run Keyword If    '${instrument}' == 'APS7100'    APS7100_测量电流
    ...    ELSE IF    '${instrument}' == 'IT8800'    IT8800_测量负载电流
    ...    ELSE IF    '${instrument}' == 'IT8900'    IT8900_测量负载电流
    ...    ELSE IF    '${instrument}' == 'EC7800'    EC7800_测量电流
    ...    ELSE IF    '${instrument}' == 'ZXB001'    ZXB001_测量交流电流
    ...    ELSE IF    '${instrument}' == 'ZXB002'    ZXB002_测量直流电流
    ...    ELSE IF    '${instrument}' == 'M3132'    M3132_读取电源电流
    ...    ELSE    Fail    不支持的仪器类型: ${instrument}
    [Return]    ${result}

测量功率因数
    [Arguments]    ${instrument}
    [Documentation]    统一功率因数测量关键字
    ...    参数说明：
    ...    ${instrument} - 仪器类型 (ZXB001|APS7100|EC7800)
    ...    返回值：测量得到的功率因数
    ...    示例：
    ...    ${pf} = 测量功率因数 APS7100 使用交流源APS7100读取功率因数
    ...    ${pf} = 测量功率因数 ZXB001 使用ZXB001读取功率因数
    ${result}=    Run Keyword If    '${instrument}' == 'APS7100'    APS7100_测量功率因数
    ...    ELSE IF    '${instrument}' == 'EC7800'    EC7800_测量功率因数
    ...    ELSE IF    '${instrument}' == 'ZXB001'    ZXB001_测量功率因数
    ...    ELSE    Fail    不支持的仪器类型: ${instrument}
    [Return]    ${result}

测量功率
    [Arguments]    ${instrument}
    [Documentation]    统一功率测量关键字
    ...    参数说明：
    ...    ${instrument} - 仪器类型 (ZXB001|ZXB002|APS7100|EC7800|IT8800|IT8900)
    ...    返回值：测量得到的功率
    ...    示例：
    ...    ${result} = 测量功率 APS7100 使用交流源APS7100读取功率
    ...    ${result} = 测量功率 ZXB001 使用ZXB001读取功率
    ${result}=    Run Keyword If    '${instrument}' == 'APS7100'    APS7100_测量功率
    ...    ELSE IF    '${instrument}' == 'EC7800'    EC7800_测量功率
    ...    ELSE IF    '${instrument}' == 'IT8800'    IT8800_测量功率
    ...    ELSE IF    '${instrument}' == 'IT8900'    IT8900_测量功率
    ...    ELSE IF    '${instrument}' == 'ZXB001'    ZXB001_测量功率
    ...    ELSE IF    '${instrument}' == 'ZXB002'    ZXB002_测量功率
    ...    ELSE IF    '${instrument}' == 'M3132'    M3132_读取电源功率
    ...    ELSE    Fail    不支持的仪器类型: ${instrument}
    [Return]    ${result}

设置电源
    [Arguments]    ${instrument}    ${voltage}    ${current}=${None}    ${fre}=${None}
    [Documentation]    统一电源设置关键字
    ...    参数说明：
    ...    ${instrument} - 仪器类型 (APS7100|EC7800)
    ...    ${voltage} - 要设置的电压值(单位: V)
    ...    ${current} - 可选，要设置的限流值(单位: A)，默认为None表示不修改电流设置
    ...    ${fre} - 可选，要设置交流的频率，默认为None
    ...    示例:
    ...    设置电源 APS7100 220 设置APS7100交流电源220V交流电压
    ...    设置电源 EC7800 220 3.0 50设置EC7800电源220V交流电压和3A输出电流限制，50Hz
    # 参数有效性检查
    Should Be True    '${instrument}' in ['APS7100', 'EC7800', 'M3132']    不支持的仪器类型: ${instrument} (支持: APS7100, EC7800)
    Should Be True    ${voltage} >= 0    电压值不能为负数
    # 根据仪器类型设置电压
    Run Keyword If    '${instrument}' == 'APS7100'    APS7100_设置电压    ${voltage}
    ...    ELSE IF    '${instrument}' == 'EC7800'    EC7800_设置电压    ${voltage}
    ...    ELSE IF    '${instrument}' == 'M3132'    M3132_设置电源电压    ${voltage}
    ...    ELSE    Fail    不支持的仪器类型: ${instrument}
    # 如果提供了电流参数，则设置电流限制
    Run Keyword If    ${current} != ${None}
        ...    Run Keyword If    '${instrument}' == 'APS7100'    APS7100_设置电流    ${current}
    Run Keyword If    ${current} != ${None} and '${instrument}' == 'EC7800'
        ...    EC7800_设置电流    ${current}
    Run Keyword If    ${current} != ${None} and '${instrument}' == 'M3132'
        ...    M3132_设置电源电流    ${current}
        # 如果提供了频率
    Run Keyword If    ${fre} != ${None}
        ...    Run Keyword If    '${instrument}' == 'APS7100'    APS7100_设置频率    ${fre}
    Run Keyword If    ${fre} != ${None} and '${instrument}' == 'EC7800'
        ...    EC7800_设置频率    ${fre}

开关电源
    [Arguments]    ${instrument}    ${state}
    [Documentation]    控制电源输出开关
    ...    参数说明:
    ...    ${instrument} - 仪器类型 (APS7100|EC7800)
    ...    ${state} - 开关状态 (1|0)
    # 参数有效性检查
    Should Be True    '${instrument}' in ['APS7100', 'EC7800', 'M3132']    不支持的仪器类型: ${instrument} (支持: APS7100, EC7800)
    # 检查 state 是否合法
    Should Be True    '${state}' in ['0', '1']    无效的电源状态: ${state} (应为1或0)
    # 执行电源控制
    Run Keyword If    '${instrument}' == 'APS7100' and '${state}' == '1'    APS7100_打开输出
    Run Keyword If    '${instrument}' == 'APS7100' and '${state}' == '0'    APS7100_关闭输出
    Run Keyword If    '${instrument}' == 'EC7800' and '${state}' == '1'    EC7800_打开输出
    Run Keyword If    '${instrument}' == 'EC7800' and '${state}' == '0'    EC7800_关闭输出
    Run Keyword If    '${instrument}' == 'M3132' and '${state}' == '1'    M3132_打开电源
    Run Keyword If    '${instrument}' == 'M3132' and '${state}' == '0'    M3132_关闭电源

设置负载模式
    [Arguments]    ${instrument}    ${mode}    ${value}    ${state}=0
    [Documentation]    设置负载工作模式
    ...    参数说明:
    ...    ${instrument} - 仪器类型 (IT8800|IT8900)
    ...    ${mode} - 负载模式 (CC|CV|CR)
    ...    ${value} - 模式设定值 (CC:A, CV:V, CR:Ω)
    ...    ${state} - 负载开关状态 (ON|OFF或1|0, 默认OFF)
    ...
    ...    示例:
    ...    设置负载模式 IT8800 CC 5.0 电子负载IT8800恒流模式5A
    ...    设置负载模式 IT8900 CV 200 ON IT8900恒压模式200V，并开启负载
    # 参数有效性检查
    Should Be True    '${instrument}' in ['IT8800', 'IT8900']    不支持的负载类型: ${instrument}
    Should Be True    '${mode}' in ['CC', 'CV', 'CR']    不支持的负载模式: ${mode}
    # 统一状态转换
    ${onoff}=    Evaluate    '1'if '${state}'.upper() in ['ON', '1'] else ('0' if '${state}'.upper() in ['OFF', '0'] else None)
    Should Not Be Equal    ${onoff}    None    无效的开关状态: ${state} (应为ON/OFF或1/0)
    # 根据仪器类型执行操作
    Run Keyword If    '${instrument}' == 'IT8800'    Run Keywords
    ...    Run Keyword If    '${mode}' == 'CC'    IT8800_设置恒流模式负载电流值    ${value}    ${onoff}
    ...    AND    Run Keyword If    '${mode}' == 'CV'    IT8800_设置恒压模式负载电压值    ${value}    ${onoff}
    ...    AND    Run Keyword If    '${mode}' == 'CR'    IT8800_设置恒阻模式负载电阻值    ${value}    ${onoff}
    Run Keyword If    '${instrument}' == 'IT8900'    Run Keywords
    ...    Run Keyword If    '${mode}' == 'CC'    IT8900_设置恒流模式负载电流值    ${value}    ${onoff}
    ...    AND    Run Keyword If    '${mode}' == 'CV'    IT8900_设置恒压模式负载电压值    ${value}    ${onoff}
    ...    AND    Run Keyword If    '${mode}' == 'CR'    IT8900_设置恒阻模式负载电阻值    ${value}    ${onoff}

开关负载
    [Arguments]    ${instrument}    ${state}
    [Documentation]    控制负载开关，支持IT8800、IT8900
    ...    参数说明:
    ...    ${instrument} - 仪器类型 (IT8800|IT8900)
    ...    ${state} - 开关状态 (ON|OFF或1|0)
    ...
    ...    示例:
    ...    开关负载 IT8800 ON
    ...    开关负载 IT8900 0
    # 统一状态转换
    ${onoff}=    Evaluate    '1' if '${state}'.upper() in ['ON', '1'] else ('0' if '${state}'.upper() in ['OFF', '0'] else None)
    Should Not Be Equal    ${onoff}    None    无效的开关状态: ${state} (应为ON/OFF或1/0)
    # 根据仪器类型执行操作
    Run Keyword If    '${instrument}' == 'IT8800'
    ...    IT8800_设置负载开关    ${onoff}
    ...    ELSE IF    '${instrument}' == 'IT8900'
    ...    IT8900_设置负载开关    ${onoff}
    ...    ELSE
    ...    Fail    不支持的负载类型: ${instrument}
