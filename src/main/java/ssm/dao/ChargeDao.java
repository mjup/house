package ssm.dao;

import java.util.List;
import java.util.Map;

import ssm.bean.Charge;

/*
 *王钢旗
 *2017年4月24日
 */
public interface ChargeDao extends BaseInterface<Charge> {
	public List<Charge> getList(Map<String, Object> map);
	public Integer getCount(Map<String, Object> map);
	public void loadData(Map<String, Object> map);
	public Map<String, Object> getDetail(Integer id);
	public Map<String, Object> getMapByMap(Map<String, Object> map);
	public void updateStatus(Map<String, Object> map);
	public Map<String, Object> getDetailForLook(Integer id);
	public List<Map<String, Object>> getCountList(String year);
	public String check(String month);
}
