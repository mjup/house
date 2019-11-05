package ssm.dao;

import java.util.List;
import java.util.Map;

import ssm.bean.ParkingSpace;

/*
 *王钢旗
 *2017年4月18日
 */
public interface ParkSpaceDao extends BaseInterface<ParkingSpace> {
	public List<ParkingSpace> getList(Map<String, Object> map);
	public Integer getCount(Map<String, Object> map);
	public Integer checkid(Integer id);
	public Map<String, Object> getInforById(Integer id);
	public List<String> getLocations();
	public void updateStatus();
}
