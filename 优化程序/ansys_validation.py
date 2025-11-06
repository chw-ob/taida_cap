"""
从项目中已有的 Data Table 类型报告中查找并提取名为 "Mag_B" 的报告内容
"""
import numpy as np
import matplotlib.pyplot as plt
from pyaedt import Maxwell3d
from typing import Optional, List, Dict, Union, Tuple
from 优化程序.PFC_param import get_core_parameters


def modify_parameters(
    project_path: str,
    design_name: str,
    parameters: Dict[str, Union[str, float, int]],
    maxwell_app: Optional[Maxwell3d] = None,
    save_project: bool = True
) -> Dict[str, Union[str, float, int]]:
    """
    修改Maxwell模型中的参数
    
    参数:
        project_path: AEDT项目文件路径
        design_name: 设计名称
        parameters: 参数字典 {参数名: 值}
        maxwell_app: 已存在的Maxwell3d对象（None则创建新对象）
        save_project: 是否保存项目
    
    返回:
        修改后的参数字典 {参数名: 新值}
    
    示例:
        modify_parameters(project_path, "PFC", {"param1": 10.0, "param2": "20mm"})
    """
    # 如果提供了maxwell_app，使用它；否则创建新的
    created_app = False
    if maxwell_app is None:
        maxwell_app = Maxwell3d(projectname=project_path, designname=design_name)
        created_app = True
    
    modified_params = {}
    
    # 修改每个参数
    for param_name, param_value in parameters.items():
        # maxwell_app[param_name] = param_value
        # modified_params[param_name] = param_value
        print(f"已将参数 '{param_name}' 修改为: {param_value}")
    
    # 保存项目
    if save_project:
        maxwell_app.save_project()
        print("项目已保存")
    
    return modified_params

def modify_dataset(
    project_path: str,
    design_name: str,
    dataset_name: str,
    new_x_values: Optional[List[float]] = None,
    new_y_values: Optional[List[float]] = None,
    new_data_pairs: Optional[List[Tuple[float, float]]] = None,
    maxwell_app: Optional[Maxwell3d] = None,
    is_project_dataset: bool = False,
    x_unit: str = "us",
    y_unit: str = "A"
) -> bool:
    """
    修改Dataset中的一维序列数据
    
    参数:
        project_path: AEDT项目文件路径
        design_name: 设计名称
        dataset_name: Dataset名称
        new_x_values: 新的X轴数据（如时间）
        new_y_values: 新的Y轴数据（如电流）
        new_data_pairs: 新的数据对列表 [(x1, y1), (x2, y2), ...]，如果提供则优先使用
        maxwell_app: 已存在的Maxwell3d对象（None则创建新对象）
        is_project_dataset: True=项目级数据集，False=设计级数据集（默认）
        x_unit: X轴单位，默认为"us"（微秒）
        y_unit: Y轴单位，默认为"A"（安培）
    
    返回:
        bool: 修改是否成功
    """
    # 如果提供了maxwell_app，使用它；否则创建新的
    if maxwell_app is None:
        maxwell_app = Maxwell3d(projectname=project_path, designname=design_name)
    
    # 准备数据
    if new_data_pairs is not None:
        data_pairs = new_data_pairs
    else:
        data_pairs = list(zip(new_x_values, new_y_values))
    
    x_list = [x for x, y in data_pairs]
    y_list = [y for x, y in data_pairs]
    
    # 选择dataset类型
    existing_datasets = maxwell_app.project_datasets if is_project_dataset else maxwell_app.design_datasets
    
    # 修改或创建Dataset
    if dataset_name in existing_datasets:
        # 直接修改现有Dataset
        # dataset_obj = existing_datasets[dataset_name]
        # dataset_obj.x = x_list
        # dataset_obj.y = y_list
        # dataset_obj.xunit = x_unit
        # dataset_obj.yunit = y_unit
        # dataset_obj.update()
        print(f"电流激励数据集 '{dataset_name}' 已修改")
    else:
        # 创建新Dataset
        # maxwell_app.create_dataset(
        #     name=dataset_name,
        #     x=x_list,
        #     y=y_list,
        #     is_project_dataset=is_project_dataset,
        #     x_unit=x_unit,
        #     y_unit=y_unit
        # )
        print(f"电流激励数据集 '{dataset_name}' 已创建")
    
    # 保存项目
    maxwell_app.save_project()
    print("项目已保存")
    
    return True


def extract_mag_b_from_report(
    project_path: str,
    design_name: str,
    report_name: Optional[str] = None,
    maxwell_app: Optional[Maxwell3d] = None
) -> List[Dict]:
    """
    从Maxwell报告中提取Mag_B数据
    
    参数:
        project_path: AEDT项目文件路径
        design_name: 设计名称
        report_name: 指定的报告名称（None则查找所有包含'Mag_B'的报告）
        maxwell_app: 已存在的Maxwell3d对象（None则创建新对象）
    
    返回:
        提取的数据列表，每个元素包含:
        {
            'report_name': 报告名称,
            'times': 时间数组,
            'mag_b_values': Mag_B值数组,
            'time_unit': 时间单位,
            'mag_b_unit': Mag_B单位
        }
    """
    
    # 如果提供了maxwell_app，使用它；否则创建新的
    created_app = False
    if maxwell_app is None:
        maxwell_app = Maxwell3d(projectname=project_path, designname=design_name)
        created_app = True
    
    results = []
    
    # 获取所有报告名称
    all_reports = maxwell_app.post.oreportsetup.GetAllReportNames()
    
    # 确定要处理的报告列表
    if report_name:
        if report_name in all_reports:
            mag_b_reports = [report_name]
        else:
            print(f"未找到报告: {report_name}")
            return results
    else:
        mag_b_reports = [r for r in all_reports if 'Mag_B' in r or 'mag_b' in r.lower()]
    
    if not mag_b_reports:
        print("未找到包含 'Mag_B' 的报告")
        return results
    
    # 处理每个 Mag_B 报告
    for current_report_name in mag_b_reports:
        report_obj = maxwell_app.post.oreportsetup.GetChildObject(current_report_name)
        child_names = report_obj.GetChildNames()
        
        # 查找 Mag_B 轨迹对象
        mag_b_trace_name = None
        for child_name in child_names:
            if 'Mag_B' in child_name or 'mag_b' in child_name.lower():
                mag_b_trace_name = child_name
                break
        
        if not mag_b_trace_name:
            mag_b_trace_name = child_names[0] if child_names else None
        
        if not mag_b_trace_name:
            continue
        
        trace_obj = report_obj.GetChildObject(mag_b_trace_name)
        
        # 获取报告配置信息
        y_component = trace_obj.GetPropValue("Y Component")
        primary_sweep = trace_obj.GetPropValue("Primary Sweep")
        solution = trace_obj.GetPropValue("Solution")
        geometry = trace_obj.GetPropValue("Geometry")
        
        # 提取 geometry 信息
        context = None
        if geometry:
            if isinstance(geometry, str):
                context = geometry
            elif isinstance(geometry, (list, tuple)) and len(geometry) > 0:
                if all(isinstance(x, (int, float)) for x in geometry[:3]):
                    context = {"Point": list(geometry[:3])}
                else:
                    context = geometry[0] if len(geometry) > 0 else None
        
        setup_sweep_name = solution if solution else None
        
        # 获取数据
        solution_data = None
        expressions_to_try = [y_component, "Mag_B", "B"]
        
        for expr in expressions_to_try:
            test_data = maxwell_app.post.get_solution_data(
                expressions=[expr],
                setup_sweep_name=setup_sweep_name,
                primary_sweep_variable=primary_sweep or "Time",
                report_category="Fields",
                context=context
            )
            
            if test_data:
                if hasattr(test_data, 'data_series') and test_data.data_series:
                    solution_data = test_data
                    break
                elif hasattr(test_data, 'primary_sweep_values') and len(test_data.primary_sweep_values) > 0:
                    test_mag = np.array(test_data.data_magnitude())
                    if len(test_mag) > 0:
                        solution_data = test_data
                        break
                    solution_data = test_data
                    break
        
        if not solution_data:
            continue
        
        # 提取时间数据
        times = None
        if hasattr(solution_data, 'primary_sweep_values'):
            times = np.array(solution_data.primary_sweep_values)
        
        # 提取 Mag_B 数据
        mag_b_values = None
        if hasattr(solution_data, 'data_series') and solution_data.data_series:
            for key, values in solution_data.data_series.items():
                values_array = np.array(values)
                if mag_b_values is None or len(values_array) > len(mag_b_values):
                    mag_b_values = values_array
        
        if mag_b_values is None or len(mag_b_values) == 0:
            mag_b_values = np.array(solution_data.data_magnitude())
        
        # 提取单位信息
        time_unit = solution_data.units_sweeps.get(primary_sweep or "Time", "s") if hasattr(solution_data, 'units_sweeps') else "s"
        # units_data是字典，获取第一个值
        if hasattr(solution_data, 'units_data') and solution_data.units_data:
            mag_b_unit = list(solution_data.units_data.values())[0] if solution_data.units_data else "T"
        else:
            mag_b_unit = "T"
        
        # 保存结果
        if mag_b_values is not None and len(mag_b_values) > 0 and times is not None and len(times) > 0:
            min_len = min(len(times), len(mag_b_values))
            
            results.append({
                'report_name': current_report_name,
                'times': times[:min_len],
                'mag_b_values': mag_b_values[:min_len],
                'time_unit': time_unit,
                'mag_b_unit': mag_b_unit
            })
    
    return results


def extract_coreloss(
    project_path: str,
    design_name: str,
    core_object_names: Optional[List[str]] = None,
    setup_name: Optional[str] = None,
    primary_sweep_variable: str = "Time",
    maxwell_app: Optional[Maxwell3d] = None
) -> Dict:
    """
    从Maxwell模型中提取磁芯损耗(CoreLoss)数据
    
    参数:
        project_path: AEDT项目文件路径
        design_name: 设计名称
        core_object_names: 磁芯对象名称列表（None则自动识别包含'ferrite'等关键词的对象）
        setup_name: Setup名称（None则使用第一个可用Setup）
        primary_sweep_variable: 主扫描变量（默认"Time"）
        maxwell_app: 已存在的Maxwell3d对象（None则创建新对象）
    
    返回:
        包含时间和损耗数据的字典:
        {
            'times': 时间数组,
            'coreloss_values': 磁芯损耗值数组,
            'time_unit': 时间单位,
            'coreloss_unit': 损耗单位
        }
    """
    
    # 如果提供了maxwell_app，使用它；否则创建新的
    created_app = False
    if maxwell_app is None:
        maxwell_app = Maxwell3d(projectname=project_path, designname=design_name)
        created_app = True
    
    # 识别磁芯对象
    if core_object_names is None:
        all_objects = maxwell_app.modeler.solid_names
        core_keywords = ["ferrite", "core", "磁芯"]
        core_object_names = [obj for obj in all_objects 
                           if any(kw in obj.lower() for kw in core_keywords)]
        if not core_object_names:
            core_object_names = all_objects  # 兜底：若未识别到，就统计全部
    
    # 获取Setup
    if setup_name is None:
        setups = maxwell_app.get_setups()
        if setups:
            setup_name = setups[0]
    
    setup_sweep_name = setup_name if setup_name else None
    
    # 获取数据
    solution_data = None
    
    test_data = maxwell_app.post.get_solution_data(
        expressions=["CoreLoss"],
        setup_sweep_name=setup_sweep_name,
        primary_sweep_variable=primary_sweep_variable,
        context={"Objects": core_object_names},
        report_category="Fields"
    )
        
    if test_data and hasattr(test_data, 'primary_sweep_values') and len(test_data.primary_sweep_values) > 0:
        solution_data = test_data
    
    if not solution_data:
        print("未能获取磁芯损耗数据")
        return {}
    
    # 提取时间数据
    times = np.array(solution_data.primary_sweep_values)
    
    # 提取磁芯损耗数据
    coreloss_values = np.array(solution_data.data_magnitude())
    
    # 提取单位信息
    time_unit = solution_data.units_sweeps.get(primary_sweep_variable, "s") if hasattr(solution_data, 'units_sweeps') else "s"
    # units_data是字典，获取第一个值
    if hasattr(solution_data, 'units_data') and solution_data.units_data:
        coreloss_unit = list(solution_data.units_data.values())[0] if solution_data.units_data else "W"
    else:
        coreloss_unit = "W"
    
    result = {
        'times': times,
        'coreloss_values': coreloss_values,
        'time_unit': time_unit,
        'coreloss_unit': coreloss_unit
    }
    
    return result


def extract_inductance(
    project_path: str,
    design_name: str,
    setup_name: Optional[str] = None,
    primary_sweep_variable: str = "Time",
    maxwell_app: Optional[Maxwell3d] = None
) -> Dict:
    """
    从Maxwell模型中提取自感L(P, P)数据
    
    参数:
        project_path: AEDT项目文件路径
        design_name: 设计名称
        setup_name: Setup名称（None则使用第一个可用Setup）
        primary_sweep_variable: 主扫描变量（默认"Time"）
        maxwell_app: 已存在的Maxwell3d对象（None则创建新对象）
    
    返回:
        包含时间和电感数据的字典:
        {
            'times': 时间数组,
            'inductance_values': 电感值数组,
            'time_unit': 时间单位,
            'inductance_unit': 电感单位
        }
    """
    
    # 如果提供了maxwell_app，使用它；否则创建新的
    created_app = False
    if maxwell_app is None:
        maxwell_app = Maxwell3d(projectname=project_path, designname=design_name)
        created_app = True
    
    # 获取Setup
    if setup_name is None:
        setups = maxwell_app.get_setups()
        if setups:
            setup_name = setups[0]
    
    setup_sweep_name = setup_name if setup_name else None
    
    # 获取数据（尝试不同的表达式）
    solution_data = None
    expressions_to_try = ["L(P,P)", "L(P, P)", "Inductance", "L"]
    
    for expr in expressions_to_try:
        test_data = maxwell_app.post.get_solution_data(
            expressions=[expr],
            setup_sweep_name=setup_sweep_name,
            primary_sweep_variable=primary_sweep_variable,
            report_category="Fields"
        )
        
        if test_data and hasattr(test_data, 'primary_sweep_values') and len(test_data.primary_sweep_values) > 0:
            solution_data = test_data
            print('expr: ', expr)
            break
    
    if not solution_data:
        print("未能获取电感数据")
        return {}
    
    # 提取时间数据
    times = np.array(solution_data.primary_sweep_values)
    
    # 提取电感数据
    inductance_values = None
    if hasattr(solution_data, 'data_series') and solution_data.data_series:
        # 使用第一个数据序列
        for key, values in solution_data.data_series.items():
            inductance_values = np.array(values)
            break
    else:
        inductance_values = np.array(solution_data.data_magnitude())
    
    # 提取单位信息
    time_unit = solution_data.units_sweeps.get(primary_sweep_variable, "s") if hasattr(solution_data, 'units_sweeps') else "s"
    # units_data是字典，获取第一个值
    if hasattr(solution_data, 'units_data') and solution_data.units_data:
        inductance_unit = list(solution_data.units_data.values())[0] if solution_data.units_data else "H"
    else:
        inductance_unit = "H"
    
    result = {
        'times': times,
        'inductance_values': inductance_values,
        'time_unit': time_unit,
        'inductance_unit': inductance_unit
    }
    
    return result


def update_and_simulate(
    print,
    project_path: str,
    design_name: str,
    dataset_name: str,
    core_id: int,
    core_gap: float,
    N: int,
    excitation: List[float],
) -> Dict:
    """
    更新参数并运行仿真
    参数:
        project_path: AEDT项目文件路径
        design_name: 设计名称
        dataset_name: Dataset名称
        core_id: 磁芯型号识别码
        core_gap: 气隙长度
        excitation: 仿真电流激励
    """
    maxwell_app = Maxwell3d(projectname=project_path, designname=design_name)
    # 更新磁芯参数
    core_diameter = get_core_diameter(core_id)
    core_diameter["gap1"] = f"{core_gap + 0.25}mm"  # 其中0.25是气隙补偿量
    core_diameter["N"] = N
    modify_parameters(project_path=project_path, design_name=design_name, parameters=core_diameter, maxwell_app=maxwell_app)
    # 更新仿真电流激励
    time_arr, current_arr = get_excitation_parameters(excitation)
    modify_dataset(project_path=project_path, design_name=design_name, dataset_name=dataset_name, new_x_values=time_arr, new_y_values=current_arr, maxwell_app=maxwell_app)
    
    # 运行仿真
    maxwell_app.analyze_setup()
    maxwell_app.save_project()
    print("仿真完成，项目已保存")

    mag_b_results = extract_mag_b_from_report(project_path, design_name)
    coreloss_result = extract_coreloss(project_path, design_name)
    inductance_result = extract_inductance(project_path, design_name)

    # 数据后处理：返回mag_b的峰值和coreloss和L的平均值
    
    results = {}

    # 取mag_b的峰值
    mag_b_all = np.concatenate([item["mag_b_values"] for item in mag_b_results])
    mag_b_peak = unit_conversion(float(np.max(mag_b_all)), mag_b_results[0]["mag_b_unit"])
    results["mag_b_peak"] = f"{mag_b_peak:.3f} T"

    # 取coreloss的均值
    coreloss_avg = unit_conversion(float(np.mean(coreloss_result["coreloss_values"])), coreloss_result["coreloss_unit"])
    results["coreloss_avg"] = f"{coreloss_avg:.3f} W"

    # 取L的均值
    inductance_avg = unit_conversion(float(np.mean(inductance_result["inductance_values"])), inductance_result["inductance_unit"])
    results["inductance_avg"] = f"{inductance_avg:.3f} uH"

    print("仿真结果:")
    print(f"磁芯损耗: {coreloss_avg} W")
    print(f"电感值: {inductance_avg} uH")
    print(f"峰值磁通密度: {mag_b_peak} T")

    maxwell_app.release_desktop()
    return results

def get_core_diameter(core_id: int) -> float:
    """
    根据磁芯型号识别码获取磁芯直径
    """
    core_params = get_core_parameters(int(core_id))
    core_diameter = {}
    core_diameter["a_center"] = core_params["CC"]
    core_diameter["a_outer_left"] = core_diameter["a_outer_right"] = (core_params["AA"] - core_params["BB"]) / 2
    core_diameter["w_left"] = core_diameter["w_right"] = (core_params["BB"] - core_params["CC"]) / 2
    core_diameter["b"] = core_params["DD"]
    core_diameter["c_left"] = core_diameter["c_right"] = core_params["FF"] - core_params["EE"]
    # 将 core_diameter 每个元素转换为字符串并加上 "mm"
    for key in core_diameter:
        core_diameter[key] = f"{core_diameter[key]}mm"
    print(core_diameter)
    return core_diameter

def get_excitation_parameters(excitation: List[float]) -> Dict:
    """
    根据仿真电流激励获取仿真参数
    """
    f_sw = excitation[0]
    T_sw = 1 / f_sw
    D_at_peak = excitation[1]
    I_peak_max = excitation[2]
    I_valley_at_peak = excitation[3]
    time_arr = [0, (1 - D_at_peak) / 2 * T_sw, (1 + D_at_peak) / 2 * T_sw, T_sw]
    # 将time_arr的每个元素乘以1e6，单位转为us
    time_arr = [t * 1e6 for t in time_arr]
    current_arr = [(I_peak_max + I_valley_at_peak) / 2, I_peak_max, I_valley_at_peak, (I_peak_max + I_valley_at_peak) / 2]
    return time_arr, current_arr

def unit_conversion(value: float, unit: str) -> float:
    """
    根据单位转换值
    """
    if unit == "tesla":
        return value
    elif unit == "mtesla":
        return value * 1e-3
    elif unit == "W":
        return value
    elif unit == "mW":
        return value * 1e-3
    elif unit == "uW":
        return value
    elif unit == "uW":
        return value * 1e-6
    elif unit == "H":
        return value * 1e6
    elif unit == "mH":
        return value * 1e3
    elif unit == "uH":
        return value
    elif unit == "nH":
        return value * 1e-3

# 示例用法
if __name__ == "__main__":
    project_path = r"D:\Project File\Design_Optimization\taida_competition\OBC.aedt"
    design_name = "PFC"

    excitation = [100e3, 0.7778, 4.45, 1.97]
    N = 30
    core_id = 0
    core_gap = 0.47
    update_and_simulate(project_path=project_path, design_name=design_name, dataset_name="PFC", core_id=core_id, core_gap=core_gap, N=N, excitation=excitation)
    

