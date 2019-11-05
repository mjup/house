package ssm.dao;

import java.util.List;
import java.util.Map;

import ssm.bean.Repair;

/*
 *王钢旗
 *2017年4月20日
 */
public interface RepairDao extends BaseInterface<Repair> {
	public List<Repair> getList(Map<String, Object> map);
	public Integer getCount(Map<String, Object> map);
	public Map<String, Object> getInfoForRepair(Integer id);
	public void updateRepair(Repair repair);
	public void updateComplete(Repair repair);
	public List<Repair> getListForCount(Map<String, Object> map);
	public Map<String, Object> getCountForCount(Map<String, Object> map);
	public List<Repair> getListByAccount(String account);
}
