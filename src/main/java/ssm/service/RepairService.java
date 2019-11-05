package ssm.service;

import java.util.Map;

import ssm.bean.ParkingSpace;
import ssm.bean.Repair;
import ssm.util.Page;

/*
 *王钢旗
 *2017年4月20日
 */
public interface RepairService {
	public Boolean insert(Repair temp);
	public Page<Repair> getPage(Repair repair, Page<Repair> page, String startDate, String endDate);
	public Map<String, Object> getMap(Integer id, Integer type);
	public Boolean updateById(Repair repair, Integer type);
	public Boolean delete(Integer[] ids);
	public Map<String, Object> getPageForCount(String time, String principal);
}
