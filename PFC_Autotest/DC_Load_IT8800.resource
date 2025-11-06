*** Settings ***
Library           DC_load/IT8800.py

*** Variables ***
${IT8800_ADDR}    USB0::0xFFFF::0x8800::600237011697230001::INSTR

*** Keywords ***
IT8800_初始化设备
    [Documentation]    初始化IT8800电子负载设备
    IT8800.initialize    ${IT8800_ADDR}

IT8800_设置远程模式
    [Documentation]    设置设备为远程控制模式
    IT8800.Set Remote Mode    ${IT8800_ADDR}

IT8800_设置本地模式
    [Documentation]    设置设备为本地控制模式
    IT8800.Set Local Mode    ${IT8800_ADDR}

IT8800_设置负载开关
    [Arguments]    ${onoff}
    [Documentation]    设置负载输入开关状态
    ...    ${onoff}: 1=打开, 0=关闭
    IT8800.Set Input State    ${IT8800_ADDR}    ${onoff}

IT8800_设置恒流模式
    [Documentation]    设置电子负载为恒流模式
    IT8800.Set Mode CC    ${IT8800_ADDR}

IT8800_设置恒流模式负载电流值
    [Arguments]    ${current}    ${onoff}
    [Documentation]    设置恒流模式的电流值
    ...    ${current}: 电流值，单位A
    IT8800.Set CC Current    ${IT8800_ADDR}    ${current}
    IT8800.Set Input State    ${IT8800_ADDR}    ${onoff}

IT8800_设置恒压模式
    [Documentation]    设置电子负载为恒压模式
    IT8800.Set Mode CV    ${IT8800_ADDR}

IT8800_设置恒压模式负载电压值
    [Arguments]    ${voltage}    ${onoff}
    [Documentation]    设置恒压模式的电压值
    ...    ${voltage}: 电压值，单位V
    IT8800.Set CV Voltage    ${IT8800_ADDR}    ${voltage}
    IT8800.Set Input State    ${IT8800_ADDR}    ${onoff}

IT8800_设置恒阻模式
    [Documentation]    设置电子负载为恒阻模式
    IT8800.Set Mode CR    ${IT8800_ADDR}

IT8800_设置恒阻模式负载电阻值
    [Arguments]    ${resistance}    ${onoff}
    [Documentation]    设置恒阻模式的电阻值
    ...    ${resistance}: 电阻值，单位Ω
    IT8800.Set CR Resistance    ${IT8800_ADDR}    ${resistance}
    IT8800.Set Input State    ${IT8800_ADDR}    ${onoff}

IT8800_设置恒功率模式
    [Documentation]    设置电子负载为恒功率模式
    IT8800.Set Mode CW    ${IT8800_ADDR}

IT8800_设置恒功率模式负载功率值
    [Arguments]    ${power}
    [Documentation]    设置恒功率模式的功率值
    ...    ${power}: 功率值，单位W
    IT8800.Set CW Power    ${IT8800_ADDR}    ${power}

IT8800_设置CC过流保护
    [Arguments]    ${state}    ${level}=${None}    ${delay}=${None}
    [Documentation]    设置恒流模式的过流保护
    ...    ${state}: 保护状态(True/False)
    ...    ${level}: 保护电流值(A)
    ...    ${delay}: 保护延迟时间(s)
    IT8800.Set CC Protection    ${IT8800_ADDR}    ${state}    ${level}    ${delay}

IT8800_设置CW过功率保护
    [Arguments]    ${state}    ${level}=${None}    ${delay}=${None}
    [Documentation]    设置恒功率模式的过功率保护
    ...    ${state}: 保护状态(True/False)
    ...    ${level}: 保护功率值(W)
    ...    ${delay}: 保护延迟时间(s)
    IT8800.Set CW Protection    ${IT8800_ADDR}    ${state}    ${level}    ${delay}

IT8800_清除保护状态
    [Documentation]    清除所有保护锁定状态
    IT8800.Clear Protection    ${IT8800_ADDR}

IT8800_设置CC动态模式
    [Arguments]    ${mode}    ${a_level}    ${b_level}    ${a_width}=${None}    ${b_width}=${None}
    [Documentation]    设置CC动态模式
    ...    ${mode}: 模式(CONTinuous/PULSe/TOGGle)
    ...    ${a_level}: A电平电流值(A)
    ...    ${b_level}: B电平电流值(A)
    ...    ${a_width}: A脉宽(s)
    ...    ${b_width}: B脉宽(s)
    IT8800.Set Dynamic CC    ${IT8800_ADDR}    ${mode}    ${a_level}    ${b_level}    ${a_width}    ${b_width}

IT8800_触发动态操作
    [Documentation]    触发动态模式操作
    IT8800.Trigger Dynamic    ${IT8800_ADDR}

IT8800_设置列表模式
    [Arguments]    ${steps}    ${levels}    ${widths}=${None}    ${slews}=${None}    ${count}=1
    [Documentation]    设置列表模式
    ...    ${steps}: 步数
    ...    ${levels}: 电平列表
    ...    ${widths}: 宽度列表(s)
    ...    ${slews}: 斜率列表
    ...    ${count}: 循环次数
    IT8800.Setup List Mode    ${IT8800_ADDR}    ${steps}    ${levels}    ${widths}    ${slews}    ${count}

IT8800_测量负载电压
    [Documentation]    测量负载电压，单位V
    ${voltage}    IT8800.Measure Voltage    ${IT8800_ADDR}
    [Return]    ${voltage}

IT8800_测量负载电流
    [Documentation]    测量负载电流，单位A
    ${current}    IT8800.Measure Current    ${IT8800_ADDR}
    [Return]    ${current}

IT8800_测量功率
    [Documentation]    测量负载功率，单位W
    ${power}    IT8800.Measure Power    ${IT8800_ADDR}
    [Return]    ${power}

IT8800_测量所有参数
    [Documentation]    一次性测量电压、电流、功率
    ${voltage}    ${current}    ${power}    IT8800.Measure All    ${IT8800_ADDR}
    [Return]    ${voltage}    ${current}    ${power}

IT8800_测量最大电压
    [Documentation]    测量最大电压值，单位V
    ${max_voltage}    IT8800.Measure Voltage Max    ${IT8800_ADDR}
    [Return]    ${max_voltage}

IT8800_测量最大电流
    [Documentation]    测量最大电流值，单位A
    ${max_current}    IT8800.Measure Current Max    ${IT8800_ADDR}
    [Return]    ${max_current}

IT8800_获取操作状态
    [Documentation]    获取设备操作状态寄存器值
    ${status}    IT8800.Get Operation Status    ${IT8800_ADDR}
    [Return]    ${status}

IT8800_获取查询状态
    [Documentation]    获取设备查询状态寄存器值
    ${status}    IT8800.Get Questionable Status    ${IT8800_ADDR}
    [Return]    ${status}

IT8800_获取错误信息
    [Documentation]    获取设备错误信息
    ${error}    IT8800.Get Error    ${IT8800_ADDR}
    [Return]    ${error}

IT8800_设备自检
    [Documentation]    执行设备自检
    ${result}    IT8800.Self Test    ${IT8800_ADDR}
    [Return]    ${result}

IT8800_重置设备
    [Documentation]    重置设备到默认设置
    IT8800.Reset    ${IT8800_ADDR}

IT8800_保存设置
    [Arguments]    ${location}
    [Documentation]    保存当前设置到指定位置
    ...    ${location}: 存储位置(0-100)
    IT8800.Save Setup    ${IT8800_ADDR}    ${location}

IT8800_调用设置
    [Arguments]    ${location}
    [Documentation]    从指定位置调用保存的设置
    ...    ${location}: 存储位置(0-100)
    IT8800.Recall Setup    ${IT8800_ADDR}    ${location}

IT8800_设置短路模式
    [Arguments]    ${state}
    [Documentation]    设置短路模式
    ...    ${state}: 1=开启短路, 0=关闭短路
    IT8800.Set Short State    ${IT8800_ADDR}    ${state}

IT8800_关闭连接
    [Documentation]    关闭设备连接
    IT8800.Close    ${IT8800_ADDR}
