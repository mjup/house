package ssm.dao;

import java.util.HashMap;
import java.util.List;




import java.util.Map;

import ssm.bean.Employee;
/*
 *王钢旗
 *2017年3月30日
 */
public interface EmployDao extends BaseInterface<Employee>{
	public List<Employee> getList(Map<String, Object> map);
	public Integer getCount(Map<String, Object> map);
}
