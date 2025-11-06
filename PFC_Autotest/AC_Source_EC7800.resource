*** Settings ***
Library           AC_source/EC7800.py

*** Variables ***
${EC7800_ADDR}    USB0::0x2EC7::0x7800::804765035807640001::INSTR

*** Keywords ***
EC7800_初始化仪器
    [Documentation]    初始化EC7800交流电源仪器
    ${result}=    EC7800.initialize    ${EC7800_ADDR}
    [Return]    ${result}

EC7800_复位仪器
    [Documentation]    恢复出厂设置
    EC7800.reset    ${EC7800_ADDR}

EC7800_打开输出
    [Documentation]    开启EC7800交流电源输出
    EC7800.setOutput    ${EC7800_ADDR}    ON

EC7800_关闭输出
    [Documentation]    关闭EC7800交流电源输出
    EC7800.setOutput    ${EC7800_ADDR}    OFF

EC7800_获取输出状态
    [Documentation]    查询EC7800输出状态
    ${state}=    EC7800.getOutputState    ${EC7800_ADDR}
    [Return]    ${state}

EC7800_设置电压
    [Arguments]    ${voltage}
    [Documentation]    设置EC7800输出电压(V)
    EC7800.setVoltage    ${EC7800_ADDR}    ${voltage}

EC7800_设置电流
    [Arguments]    ${current}
    [Documentation]    设置EC7800输出电流限制(A)
    EC7800.setCurrent    ${EC7800_ADDR}    ${current}

EC7800_设置频率
    [Arguments]    ${frequency}
    [Documentation]    设置EC7800输出频率(Hz)
    EC7800.setFrequency    ${EC7800_ADDR}    ${frequency}

EC7800_设置相位
    [Arguments]    ${phase}
    [Documentation]    设置EC7800相位(度)
    EC7800.setPhase    ${EC7800_ADDR}    ${phase}

EC7800_获取电压设定值
    [Documentation]    查询EC7800设定的电压值
    ${voltage}=    EC7800.getVoltageSetting    ${EC7800_ADDR}
    [Return]    ${voltage}

EC7800_获取电流设定值
    [Documentation]    查询EC7800设定的电流值
    ${current}=    EC7800.getCurrentSetting    ${EC7800_ADDR}
    [Return]    ${current}

EC7800_获取频率设定值
    [Documentation]    查询EC7800设定的频率值
    ${frequency}=    EC7800.getFrequencySetting    ${EC7800_ADDR}
    [Return]    ${frequency}

EC7800_测量电压
    [Documentation]    测量EC7800实际输出电压
    ${voltage}=    EC7800.measureVoltage    ${EC7800_ADDR}
    [Return]    ${voltage}

EC7800_测量电流
    [Documentation]    测量EC7800实际输出电流
    ${current}=    EC7800.measureCurrent    ${EC7800_ADDR}
    [Return]    ${current}

EC7800_测量功率
    [Documentation]    测量EC7800实际输出功率
    ${power}=    EC7800.measurePower    ${EC7800_ADDR}
    [Return]    ${power}

EC7800_测量频率
    [Documentation]    测量EC7800实际输出频率
    ${frequency}=    EC7800.measureFrequency    ${EC7800_ADDR}
    [Return]    ${frequency}

EC7800_测量功率因数
    ${pf}=    EC7800.measurePfactor    ${EC7800_ADDR}
    [Return]    ${pf}

EC7800_设置过压保护
    [Arguments]    ${voltage}
    [Documentation]    设置EC7800过压保护点(V)
    EC7800.setOVP    ${EC7800_ADDR}    ${voltage}

EC7800_设置过流保护
    [Arguments]    ${current}
    [Documentation]    设置EC7800过流保护点(A)
    EC7800.setOCP    ${EC7800_ADDR}    ${current}

EC7800_获取过压保护点
    [Documentation]    查询EC7800过压保护点
    ${ovp}=    EC7800.getOVP    ${EC7800_ADDR}
    [Return]    ${ovp}

EC7800_获取过流保护点
    [Documentation]    查询EC7800过流保护点
    ${ocp}=    EC7800.getOCP    ${EC7800_ADDR}
    [Return]    ${ocp}

EC7800_清除保护状态
    [Documentation]    清除EC7800保护状态
    EC7800.clearProtection    ${EC7800_ADDR}

EC7800_获取系统错误
    [Documentation]    查询EC7800系统错误信息
    ${errors}=    EC7800.getSystemErrors    ${EC7800_ADDR}
    [Return]    ${errors}

EC7800_清除状态寄存器
    [Documentation]    清除EC7800状态寄存器
    EC7800.clearStatus    ${EC7800_ADDR}

EC7800_设置电压量程
    [Arguments]    ${range_val}
    [Documentation]    设置EC7800电压量程
    EC7800.setVoltageRange    ${EC7800_ADDR}    ${range_val}

EC7800_设置电流量程
    [Arguments]    ${range_val}
    [Documentation]    设置EC7800电流量程
    EC7800.setCurrentRange    ${EC7800_ADDR}    ${range_val}

EC7800_设置上电状态
    [Arguments]    ${state}
    [Documentation]    设置EC7800上电状态
    EC7800.setPowerOnState    ${EC7800_ADDR}    ${state}

EC7800_设置同步源
    [Arguments]    ${source}
    [Documentation]    设置EC7800同步源
    EC7800.setSyncSource    ${EC7800_ADDR}    ${source}

EC7800_保存状态
    [Arguments]    ${location}
    [Documentation]    保存EC7800仪器状态
    EC7800.saveState    ${EC7800_ADDR}    ${location}

EC7800_调用状态
    [Arguments]    ${location}
    [Documentation]    调用EC7800保存的状态
    EC7800.recallState    ${EC7800_ADDR}    ${location}
