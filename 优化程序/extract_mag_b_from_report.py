"""
从项目中已有的 Data Table 类型报告中查找并提取名为 "Mag_B" 的报告内容
"""
import numpy as np
import matplotlib.pyplot as plt
from pyaedt import Maxwell3d
from typing import Optional, List, Dict, Union


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
        maxwell_app[param_name] = param_value
        modified_params[param_name] = param_value
        print(f"已将参数 '{param_name}' 修改为: {param_value}")
    
    # 保存项目
    if save_project:
        maxwell_app.save_project()
        print("项目已保存")
    
    # 如果创建了app，则释放它
    if created_app:
        maxwell_app.release_desktop()
    
    return modified_params


def extract_mag_b_from_report(
    project_path: str,
    design_name: str,
    report_name: Optional[str] = None,
    save_csv: bool = True,
    save_plot: bool = True,
    output_dir: Optional[str] = None,
    maxwell_app: Optional[Maxwell3d] = None
) -> List[Dict]:
    """
    从Maxwell报告中提取Mag_B数据
    
    参数:
        project_path: AEDT项目文件路径
        design_name: 设计名称
        report_name: 指定的报告名称（None则查找所有包含'Mag_B'的报告）
        save_csv: 是否保存CSV文件
        save_plot: 是否保存图表
        output_dir: 输出目录（None则使用当前目录）
        maxwell_app: 已存在的Maxwell3d对象（None则创建新对象）
    
    返回:
        提取的数据列表，每个元素包含:
        {
            'report_name': 报告名称,
            'times': 时间数组,
            'mag_b_values': Mag_B值数组,
            'csv_file': CSV文件路径（如果保存）,
            'plot_file': 图表文件路径（如果保存）
        }
    """
    import os
    
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
            if created_app:
                maxwell_app.release_desktop()
            return results
    else:
        mag_b_reports = [r for r in all_reports if 'Mag_B' in r or 'mag_b' in r.lower()]
    
    if not mag_b_reports:
        print("未找到包含 'Mag_B' 的报告")
        if created_app:
            maxwell_app.release_desktop()
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
        
        # 保存数据和绘图
        csv_file = None
        plot_file = None
        
        if mag_b_values is not None and len(mag_b_values) > 0 and times is not None and len(times) > 0:
            min_len = min(len(times), len(mag_b_values))
            
            # 保存CSV
            if save_csv:
                if output_dir:
                    os.makedirs(output_dir, exist_ok=True)
                    csv_file = os.path.join(output_dir, f"mag_b_from_report_{current_report_name.replace(' ', '_').replace('/', '_')}.csv")
                else:
                    csv_file = f"mag_b_from_report_{current_report_name.replace(' ', '_').replace('/', '_')}.csv"
                
                np.savetxt(csv_file,
                          np.column_stack((times[:min_len], mag_b_values[:min_len])),
                          delimiter=',',
                          header='Time(s),Mag_B(T)',
                          comments='',
                          fmt='%.6e')
                print(f"数据已保存到: {csv_file} ({min_len} 行)")
            
            # 保存图表
            if save_plot:
                plt.figure(figsize=(12, 6))
                plt.plot(times[:min_len] * 1e6, mag_b_values[:min_len], 'b-', linewidth=2, label='Mag_B')
                plt.xlabel('时间 (μs)', fontsize=12)
                plt.ylabel('Mag_B (T)', fontsize=12)
                plt.title(f'Mag_B 随时间变化曲线 - {current_report_name}', fontsize=14)
                plt.grid(True, alpha=0.3)
                plt.legend()
                plt.tight_layout()
                
                if output_dir:
                    os.makedirs(output_dir, exist_ok=True)
                    plot_file = os.path.join(output_dir, f"mag_b_plot_{current_report_name.replace(' ', '_').replace('/', '_')}.png")
                else:
                    plot_file = f"mag_b_plot_{current_report_name.replace(' ', '_').replace('/', '_')}.png"
                
                plt.savefig(plot_file, dpi=300, bbox_inches='tight')
                plt.close()
                print(f"图表已保存到: {plot_file}")
            
            # 保存结果
            results.append({
                'report_name': current_report_name,
                'times': times[:min_len],
                'mag_b_values': mag_b_values[:min_len],
                'csv_file': csv_file,
                'plot_file': plot_file
            })
    
    # 如果创建了app，则释放它
    if created_app:
        maxwell_app.release_desktop()
    
    return results


def extract_coreloss(
    project_path: str,
    design_name: str,
    core_object_names: Optional[List[str]] = None,
    setup_name: Optional[str] = None,
    primary_sweep_variable: str = "Time",
    save_csv: bool = True,
    output_dir: Optional[str] = None,
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
        save_csv: 是否保存CSV文件
        output_dir: 输出目录（None则使用当前目录）
        maxwell_app: 已存在的Maxwell3d对象（None则创建新对象）
    
    返回:
        包含时间和损耗数据的字典:
        {
            'times': 时间数组,
            'coreloss_values': 磁芯损耗值数组,
            'csv_file': CSV文件路径（如果保存）
        }
    """
    import os
    
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
        if created_app:
            maxwell_app.release_desktop()
        return {}
    
    # 提取时间数据
    times = np.array(solution_data.primary_sweep_values)
    
    coreloss_values = np.array(solution_data.data_magnitude())
    
    # 保存CSV
    csv_file = None
    if save_csv and len(times) > 0 and len(coreloss_values) > 0:
        min_len = min(len(times), len(coreloss_values))
        if output_dir:
            os.makedirs(output_dir, exist_ok=True)
            csv_file = os.path.join(output_dir, "coreloss_vs_time.csv")
        else:
            csv_file = "coreloss_vs_time.csv"
        
        np.savetxt(csv_file,
                  np.column_stack((times[:min_len], coreloss_values[:min_len])),
                  delimiter=',',
                  header='Time(s),CoreLoss(W)',
                  comments='',
                  fmt='%.6e')
        print(f"磁芯损耗数据已保存到: {csv_file} ({min_len} 行)")
    
    # 如果创建了app，则释放它
    # if created_app:
    #     maxwell_app.release_desktop()
    
    result = {
        'times': times,
        'coreloss_values': coreloss_values,
        'csv_file': csv_file
    }
    
    return result


def extract_inductance(
    project_path: str,
    design_name: str,
    setup_name: Optional[str] = None,
    primary_sweep_variable: str = "Time",
    save_csv: bool = True,
    output_dir: Optional[str] = None,
    maxwell_app: Optional[Maxwell3d] = None
) -> Dict:
    """
    从Maxwell模型中提取自感L(P, P)数据
    
    参数:
        project_path: AEDT项目文件路径
        design_name: 设计名称
        setup_name: Setup名称（None则使用第一个可用Setup）
        primary_sweep_variable: 主扫描变量（默认"Time"）
        save_csv: 是否保存CSV文件
        output_dir: 输出目录（None则使用当前目录）
        maxwell_app: 已存在的Maxwell3d对象（None则创建新对象）
    
    返回:
        包含时间和电感数据的字典:
        {
            'times': 时间数组,
            'inductance_values': 电感值数组,
            'csv_file': CSV文件路径（如果保存）
        }
    """
    import os
    
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
        if created_app:
            maxwell_app.release_desktop()
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
    
    # 保存CSV
    csv_file = None
    if save_csv and len(times) > 0 and len(inductance_values) > 0:
        min_len = min(len(times), len(inductance_values))
        if output_dir:
            os.makedirs(output_dir, exist_ok=True)
            csv_file = os.path.join(output_dir, "inductance_L_P_P_vs_time.csv")
        else:
            csv_file = "inductance_L_P_P_vs_time.csv"
        
        np.savetxt(csv_file,
                  np.column_stack((times[:min_len], inductance_values[:min_len])),
                  delimiter=',',
                  header='Time(s),L(P,P)(H)',
                  comments='',
                  fmt='%.6e')
        print(f"电感数据已保存到: {csv_file} ({min_len} 行)")
    
    # 如果创建了app，则释放它
    if created_app:
        maxwell_app.release_desktop()
    
    result = {
        'times': times,
        'inductance_values': inductance_values,
        'csv_file': csv_file
    }
    
    return result


# 示例用法
if __name__ == "__main__":
    project_path = r"E:\study\S1\taida_cap\优化程序\OBC.aedt"
    design_name = "PFC"
    
    # 示例1: 修改参数
    # modify_parameters(
    #     project_path=project_path,
    #     design_name=design_name,
    #     parameters={"a_outer_left": "8mm", "b": "25mm"}
    # )
    
    # 示例2: 提取磁芯损耗
    coreloss_result = extract_coreloss(
         project_path=project_path,
         design_name=design_name
    )
    if coreloss_result:
         print(f"磁芯损耗数据点数: {len(coreloss_result['times'])}")
    
    # 示例3: 提取电感L(P,P)
    # inductance_result = extract_inductance(
    #     project_path=project_path,
    #     design_name=design_name
    # )
    # if inductance_result:
    #     print(f"电感数据点数: {len(inductance_result['times'])}")
    
    # 示例4: 提取报告数据
    # results = extract_mag_b_from_report(
    #     project_path=project_path,
    #     design_name=design_name
    # )
    # if results:
    #     print(f"\n成功提取 {len(results)} 个报告的数据")
    #     for result in results:
    #         print(f"  - {result['report_name']}: {len(result['times'])} 个数据点")
