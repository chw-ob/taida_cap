*** Settings ***
Library           DC_source/M3132.py

*** Variables ***
${DC_Source_ADDR}    USB0::0x2EC7::0x314C::805437011807610009::2::INSTR

*** Keywords ***
M3132_初始化电源
    [Documentation]    初始化电源连接
    ${status}    M3132.initialize    ${DC_Source_ADDR}
    Should Be True    ${status}    电源初始化失败
    M3132.Set Remote Mode    ${DC_Source_ADDR}

M3132_设置电源电压
    [Arguments]    ${vol}
    [Documentation]    设置输出电压，单位：V
    M3132.setVoltage    ${DC_Source_ADDR}    ${vol}

M3132_设置电源电流
    [Arguments]    ${cur}
    [Documentation]    设置输出电流，单位：A
    M3132.setCurrent    ${DC_Source_ADDR}    ${cur}

M3132_设置电源电压电流
    [Arguments]    ${vol}    ${cur}
    [Documentation]    同时设置输出电压和电流
    M3132.setVoltageCurrent    ${DC_Source_ADDR}    ${vol}    ${cur}

M3132_打开电源
    [Documentation]    开启电源输出
    M3132.outputOn    ${DC_Source_ADDR}

M3132_关闭电源
    [Documentation]    关闭电源输出
    M3132.outputOff    ${DC_Source_ADDR}

M3132_读取电源电压
    [Documentation]    读取当前输出电压，单位：V
    ${vol}    M3132.readVoltage    ${DC_Source_ADDR}
    [Return]    ${vol}

M3132_读取电源电流
    [Documentation]    读取当前输出电流，单位：A
    ${cur}    M3132.readCurrent    ${DC_Source_ADDR}
    [Return]    ${cur}

M3132_读取电源功率
    [Documentation]    读取当前输出功率，单位：W
    ${pow}    M3132.readPower    ${DC_Source_ADDR}
    [Return]    ${pow}

M3132_设置过压保护
    [Arguments]    ${ovp_vol}
    [Documentation]    设置过压保护值，单位：V
    M3132.setOVP    ${DC_Source_ADDR}    ${ovp_vol}

M3132_设置过流保护
    [Arguments]    ${ocp_cur}
    [Documentation]    设置过流保护值，单位：A
    M3132.setOCP    ${DC_Source_ADDR}    ${ocp_cur}

M3132_设置过功率保护
    [Arguments]    ${opp_pow}
    [Documentation]    设置过功率保护值，单位：W
    M3132.setOPP    ${DC_Source_ADDR}    ${opp_pow}

M3132_清除保护状态
    [Documentation]    清除保护锁定状态
    M3132.clearProtection    ${DC_Source_ADDR}

M3132_设置输出开启延迟
    [Arguments]    ${delay}
    [Documentation]    设置输出开启延迟时间，单位：s
    M3132.setOutputDelayOn    ${DC_Source_ADDR}    ${delay}

M3132_设置输出关闭延迟
    [Arguments]    ${delay}
    [Documentation]    设置输出关闭延迟时间，单位：s
    M3132.setOutputDelayOff    ${DC_Source_ADDR}    ${delay}

M3132_设置功能优先级
    [Arguments]    ${priority}
    [Documentation]    设置控制环优先级：VOLTage(电压优先) 或 CURRent(电流优先)
    M3132.setFunctionPriority    ${DC_Source_ADDR}    ${priority}

M3132_获取错误信息
    [Documentation]    获取电源错误信息
    ${error_info}    M3132.getError    ${DC_Source_ADDR}
    [Return]    ${error_info}

M3132_恢复出厂设置
    [Documentation]    恢复电源出厂设置
    M3132.reset    ${DC_Source_ADDR}

M3132_设置远程模式
    [Documentation]    设置电源为远程控制模式
    M3132.setRemoteMode    ${DC_Source_ADDR}

M3132_设置本地模式
    [Documentation]    设置电源为本地控制模式
    M3132.setLocalMode    ${DC_Source_ADDR}

M3132_关闭连接
    [Documentation]    关闭电源连接
    M3132.close    ${DC_Source_ADDR}
