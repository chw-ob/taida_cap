*** Settings ***
Library           AC_source/APS7100.py

*** Variables ***
${AC_Source_ADDR}    TCPIP0::172.16.5.125::2268::SOCKET

*** Keywords ***
APS7100_初始化仪器
    [Documentation]    初始化交流电源仪器
    ${result}=    APS7100.initialize    ${AC_Source_ADDR}
    [Return]    ${result}

APS7100_复位仪器
    [Documentation]    恢复出厂设置
    APS7100.reset    ${AC_Source_ADDR}

APS7100_打开输出
    [Documentation]    开启交流电源输出
    APS7100.setOutput    ${AC_Source_ADDR}    ON

APS7100_关闭输出
    [Documentation]    关闭交流电源输出
    APS7100.setOutput    ${AC_Source_ADDR}    OFF

APS7100_获取输出状态
    [Documentation]    查询输出状态
    ${state}=    APS7100.getOutputState    ${AC_Source_ADDR}
    [Return]    ${state}

APS7100_设置电压
    [Arguments]    ${voltage}
    [Documentation]    设置输出电压(V)
    APS7100.setVoltage    ${AC_Source_ADDR}    ${voltage}

APS7100_设置电流
    [Arguments]    ${current}
    [Documentation]    设置输出电流限制(A)
    APS7100.setCurrent    ${AC_Source_ADDR}    ${current}

APS7100_设置频率
    [Arguments]    ${frequency}
    [Documentation]    设置输出频率(Hz)
    APS7100.setFrequency    ${AC_Source_ADDR}    ${frequency}

APS7100_设置相位
    [Arguments]    ${phase}
    [Documentation]    设置相位(度)
    APS7100.setPhase    ${AC_Source_ADDR}    ${phase}

APS7100_获取电压设定值
    [Documentation]    查询设定的电压值
    ${voltage}=    APS7100.getVoltageSetting    ${AC_Source_ADDR}
    [Return]    ${voltage}

APS7100_获取电流设定值
    [Documentation]    查询设定的电流值
    ${current}=    APS7100.getCurrentSetting    ${AC_Source_ADDR}
    [Return]    ${current}

APS7100_获取频率设定值
    [Documentation]    查询设定的频率值
    ${frequency}=    APS7100.getFrequencySetting    ${AC_Source_ADDR}
    [Return]    ${frequency}

APS7100_测量电压
    [Documentation]    测量实际输出电压
    ${voltage}=    APS7100.measureVoltage    ${AC_Source_ADDR}
    [Return]    ${voltage}

APS7100_测量电流
    [Documentation]    测量实际输出电流
    ${current}=    APS7100.measureCurrent    ${AC_Source_ADDR}
    [Return]    ${current}

APS7100_测量功率
    [Documentation]    测量实际输出功率
    ${power}=    APS7100.measurePower    ${AC_Source_ADDR}
    [Return]    ${power}

APS7100_测量功率因数
    ${pf}=    APS7100.measurePfactor    ${AC_Source_ADDR}
    [Return]    ${pf}

APS7100_测量频率
    [Documentation]    测量实际输出频率
    ${frequency}=    APS7100.measureFrequency    ${AC_Source_ADDR}
    [Return]    ${frequency}

APS7100_设置过压保护
    [Arguments]    ${voltage}
    [Documentation]    设置过压保护点(V)
    APS7100.setOVP    ${AC_Source_ADDR}    ${voltage}

APS7100_设置过流保护
    [Arguments]    ${current}
    [Documentation]    设置过流保护点(A)
    APS7100.setOCP    ${AC_Source_ADDR}    ${current}

APS7100_获取过压保护点
    [Documentation]    查询过压保护点
    ${ovp}=    APS7100.getOVP    ${AC_Source_ADDR}
    [Return]    ${ovp}

APS7100_获取过流保护点
    [Documentation]    查询过流保护点
    ${ocp}=    APS7100.getOCP    ${AC_Source_ADDR}
    [Return]    ${ocp}

APS7100_清除保护状态
    [Documentation]    清除保护状态
    APS7100.clearProtection    ${AC_Source_ADDR}

APS7100_获取系统错误
    [Documentation]    查询系统错误信息
    ${errors}=    APS7100.getSystemErrors    ${AC_Source_ADDR}
    [Return]    ${errors}

APS7100_清除状态寄存器
    [Documentation]    清除状态寄存器
    APS7100.clearStatus    ${AC_Source_ADDR}
