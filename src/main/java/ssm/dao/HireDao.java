package ssm.dao;

import java.util.List;
import java.util.Map;

import ssm.bean.Hire;

/*
 *王钢旗
 *2017年4月18日
 */
public interface HireDao extends BaseInterface<Hire> {
	public Map<String, Object> getMapById(Integer id);
	public Map<String, Object> getrelet(Integer id);
	public void updateById(Hire temp);
	public List<Hire> getList(Map<String, Object> map);
	public Integer getCount(Map<String, Object> map);
}
