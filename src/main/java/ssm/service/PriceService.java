package ssm.service;

import ssm.bean.ParkingSpace;
import ssm.bean.Price;
import ssm.util.Infor;
import ssm.util.Page;

/*
 *王钢旗
 *2017年4月21日
 */
public interface PriceService {
	public Infor insert(Price price);
	public Boolean check(String month);
	public Page<Price> getPage(Page<Price> page);
	public Infor updateById(Price price);
	public Infor delete(Integer[] ids);
	
}
