package ssm.service;

import java.util.List;

import ssm.bean.ParkingSpace;
import ssm.util.Infor;
import ssm.util.Page;


/*
 *王钢旗
 *2017年4月18日
 */
public interface ParkSpaceService {
	public Infor insert(ParkingSpace temp);
	public Page<ParkingSpace> getPage(ParkingSpace park, Page<ParkingSpace> page);
	public Boolean delete(Integer[] ids);
	public List<String> getLocations();
}
