package ssm.service;

import java.util.List;

import ssm.bean.House;
import ssm.util.Page;
/*
 *王钢旗
 *2017年4月17日
 */
import ssm.vo.HouseVO;
public interface HouseService {
//	public static Boolean flag = true;
	public Page<House> getPage(House house, Page<House> page);
	public Boolean save(House house);
	public Boolean delete(Integer[] ids);
	public Boolean update(Integer[] ids, House house);
	public House getById(Integer id);
	public Boolean updateById(House house);
	public Boolean checkAccount(String account);
	public void setFlag(Boolean flag);
	public List<String> getFloorids();
	public List<String> getAccounts(String floorid);
}
