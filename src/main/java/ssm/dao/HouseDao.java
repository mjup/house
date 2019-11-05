package ssm.dao;

import java.util.List;
import java.util.Map;

import ssm.bean.House;
import ssm.vo.HouseVO;

/*
 *王钢旗
 *2017年4月17日
 */
public interface HouseDao extends BaseInterface<House>{
	public List<House> getList(Map<String, Object> map);
	public Integer getCount(Map<String, Object> map);
	public String checkAccount(String account);
	public List<String> getFloorIds();
	public List<String> getAccount(String floorid);
}
