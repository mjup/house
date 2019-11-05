package ssm.dao;

import java.util.List;
import java.util.Map;

import ssm.bean.ParkingSpace;
import ssm.bean.Price;

/*
 *王钢旗
 *2017年4月21日
 */
public interface PriceDao extends BaseInterface<Price> {
	public Integer check(String month);
	public List<Price> getList(Map<String, Object> map);
	public Integer getCount();
}
