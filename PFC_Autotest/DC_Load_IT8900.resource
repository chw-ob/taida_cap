*** Settings ***
Library           DC_load/IT8900.py

*** Variables ***
${IT8900_ADDR}    TCPIP0::192.168.200.100::30000::SOCKET

*** Keywords ***
IT8900_初始化设备
    [Documentation]    初始化IT8900直流电子负载设备
    IT8900.initialize    ${IT8900_ADDR}

IT8900_设置远程模式
    [Documentation]    设置设备为远程控制模式
    IT8900.Set Remote Mode    ${IT8900_ADDR}

IT8900_设置本地模式
    [Documentation]    设置设备为本地控制模式
    IT8900.Set Local Mode    ${IT8900_ADDR}

IT8900_设置负载开关
    [Arguments]    ${onoff}
    [Documentation]    设置负载输入开关状态
    ...    ${onoff}: 1=打开, 0=关闭
    IT8900.Set Input State    ${IT8900_ADDR}    ${onoff}

IT8900_设置短路模式
    [Arguments]    ${state}
    [Documentation]    设置短路模式
    ...    ${state}: 1=开启短路, 0=关闭短路
    IT8900.Set Short State    ${IT8900_ADDR}    ${state}

IT8900_清除保护状态
    [Documentation]    清除所有保护锁定状态
    IT8900.Clear Protection    ${IT8900_ADDR}

IT8900_设置恒流模式
    [Documentation]    设置电子负载为恒流模式
    IT8900.Set Mode CC    ${IT8900_ADDR}

IT8900_设置恒流模式负载电流值
    [Arguments]    ${current}    ${onoff}
    [Documentation]    设置恒流模式的电流值
    ...    ${current}: 电流值，单位A
    IT8900.Set CC Current    ${IT8900_ADDR}    ${current}
    IT8900.Set Input State    ${IT8900_ADDR}    ${onoff}

IT8900_设置恒压模式
    [Documentation]    设置电子负载为恒压模式
    IT8900.Set Mode CV    ${IT8900_ADDR}

IT8900_设置恒压模式负载电压值
    [Arguments]    ${voltage}
    [Documentation]    设置恒压模式的电压值
    ...    ${voltage}: 电压值，单位V
    IT8900.Set CV Voltage    ${IT8900_ADDR}    ${voltage}

IT8900_设置恒阻模式
    [Documentation]    设置电子负载为恒阻模式
    IT8900.Set Mode CR    ${IT8900_ADDR}

IT8900_设置恒阻模式负载电阻值
    [Arguments]    ${resistance}
    [Documentation]    设置恒阻模式的电阻值
    ...    ${resistance}: 电阻值，单位Ω
    IT8900.Set CR Resistance    ${IT8900_ADDR}    ${resistance}

IT8900_设置恒功率模式
    [Documentation]    设置电子负载为恒功率模式
    IT8900.Set Mode CW    ${IT8900_ADDR}

IT8900_设置恒功率模式负载功率值
    [Arguments]    ${power}
    [Documentation]    设置恒功率模式的功率值
    ...    ${power}: 功率值，单位W
    IT8900.Set CW Power    ${IT8900_ADDR}    ${power}

IT8900_设置CC过流保护
    [Arguments]    ${state}    ${level}=${None}    ${delay}=${None}
    [Documentation]    设置恒流模式的过流保护
    ...    ${state}: 保护状态(True/False)
    ...    ${level}: 保护电流值(A)
    ...    ${delay}: 保护延迟时间(s)
    IT8900.Set CC Protection    ${IT8900_ADDR}    ${state}    ${level}    ${delay}

IT8900_设置CW过功率保护
    [Arguments]    ${state}    ${level}=${None}    ${delay}=${None}
    [Documentation]    设置恒功率模式的过功率保护
    ...    ${state}: 保护状态(True/False)
    ...    ${level}: 保护功率值(W)
    ...    ${delay}: 保护延迟时间(s)
    IT8900.Set CW Protection    ${IT8900_ADDR}    ${state}    ${level}    ${delay}

IT8900_设置CC动态模式
    [Arguments]    ${mode}    ${a_level}    ${b_level}    ${a_width}=${None}    ${b_width}=${None}
    [Documentation]    设置CC动态模式
    ...    ${mode}: 模式(CONTinuous/PULSe/TOGGle)
    ...    ${a_level}: A电平电流值(A)
    ...    ${b_level}: B电平电流值(A)
    ...    ${a_width}: A脉宽(s)
    ...    ${b_width}: B脉宽(s)
    IT8900.Set Dynamic CC    ${IT8900_ADDR}    ${mode}    ${a_level}    ${b_level}    ${a_width}    ${b_width}

IT8900_测量负载电压
    [Documentation]    测量负载电压，单位V
    ${voltage}    IT8900.Measure Voltage    ${IT8900_ADDR}
    [Return]    ${voltage}

IT8900_测量负载电流
    [Documentation]    测量负载电流，单位A
    ${current}    IT8900.Measure Current    ${IT8900_ADDR}
    [Return]    ${current}

IT8900_测量功率
    [Documentation]    测量负载功率，单位W
    ${power}    IT8900.Measure Power    ${IT8900_ADDR}
    [Return]    ${power}

IT8900_测量最大电压
    [Documentation]    测量最大电压值，单位V
    ${max_voltage}    IT8900.Measure Voltage Max    ${IT8900_ADDR}
    [Return]    ${max_voltage}

IT8900_测量最大电流
    [Documentation]    测量最大电流值，单位A
    ${max_current}    IT8900.Measure Current Max    ${IT8900_ADDR}
    [Return]    ${max_current}

IT8900_获取操作状态
    [Documentation]    获取设备操作状态寄存器值
    ${status}    IT8900.Get Operation Status    ${IT8900_ADDR}
    [Return]    ${status}

IT8900_获取查询状态
    [Documentation]    获取设备查询状态寄存器值
    ${status}    IT8900.Get Questionable Status    ${IT8900_ADDR}
    [Return]    ${status}

IT8900_获取错误信息
    [Documentation]    获取设备错误信息
    ${error}    IT8900.Get Error    ${IT8900_ADDR}
    [Return]    ${error}

IT8900_设备自检
    [Documentation]    执行设备自检
    ${result}    IT8900.Self Test    ${IT8900_ADDR}
    [Return]    ${result}

IT8900_重置设备
    [Documentation]    重置设备到默认设置
    IT8900.Reset    ${IT8900_ADDR}

IT8900_保存设置
    [Arguments]    ${location}
    [Documentation]    保存当前设置到指定位置
    ...    ${location}: 存储位置(1-100)
    IT8900.Save Setup    ${IT8900_ADDR}    ${location}

IT8900_调用设置
    [Arguments]    ${location}
    [Documentation]    从指定位置调用保存的设置
    ...    ${location}: 存储位置(1-100)
    IT8900.Recall Setup    ${IT8900_ADDR}    ${location}

IT8900_关闭连接
    [Documentation]    关闭设备连接
    IT8900.Close    ${IT8900_ADDR}
