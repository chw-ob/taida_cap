*** Settings ***
Resource          Autotest_Source.resource

*** Test Cases ***
APS7100测试
    设置电源    APS7100    220    4    50
    sleep    2s
    开关电源    APS7100    1
    sleep    1s
    测量电压    APS7100
    sleep    1s
    测量电流    APS7100
    sleep    1s
    测量功率因数    APS7100
    sleep    1s
    测量功率    APS7100
    sleep    4s
    开关电源    APS7100    0

ZXB001测试
    设置电源    APS7100    220    4    50
    sleep    2s
    开关电源    APS7100    1
    sleep    4s
    测量电压    ZXB001
    sleep    1s
    测量电流    ZXB001
    sleep    1s
    测量功率因数    ZXB001
    sleep    1s
    测量功率    ZXB001
    sleep    1s
    开关电源    APS7100    0

ZXB002测试
    设置电源    APS7100    220    4    50
    sleep    2s
    开关电源    APS7100    1
    sleep    4s
    测量电压    ZXB002
    sleep    1s
    测量电流    ZXB002
    sleep    1s
    测量功率    ZXB002
    sleep    1s
    开关电源    APS7100    0

IT8800测试
    开关电源    APS7100    0
    开关负载    IT8800    0
    设置电源    APS7100    220    4    50
    sleep    2s
    开关电源    APS7100    1
    sleep    4s
    测量电压    IT8800
    测量电流    IT8800
    设置负载模式    IT8800    CC    1    0
    开关负载    IT8800    1
    sleep    4s
    测量电压    IT8800
    测量电流    IT8800
    测量功率    IT8800
    开关电源    APS7100    0
    sleep    4s
    开关负载    IT8800    0

EC7800测试
    设置电源    EC7800    220    4    50
    sleep    2s
    开关电源    EC7800    1
    sleep    1s
    测量电压    EC7800
    sleep    1s
    测量电流    EC7800
    sleep    1s
    测量功率因数    EC7800
    sleep    1s
    测量功率    EC7800
    sleep    4s
    开关电源    EC7800    0

IT8900测试
    开关电源    EC7800    0
    开关负载    IT8900    0
    设置电源    EC7800    220    4    50
    sleep    2s
    开关电源    EC7800    1
    sleep    4s
    测量电压    IT8900
    测量电流    IT8900
    设置负载模式    IT8900    CC    1    0
    开关负载    IT8900    1
    sleep    4s
    测量电压    IT8900
    测量电流    IT8900
    测量功率    IT8900
    开关电源    EC7800    0
    sleep    4s
    开关负载    IT8900    0
