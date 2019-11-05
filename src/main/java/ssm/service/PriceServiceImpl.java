package ssm.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssm.bean.ParkingSpace;
import ssm.bean.Price;
import ssm.bean.WuYe;
import ssm.dao.HouseDao;
import ssm.dao.PriceDao;
import ssm.dao.WuYeDao;
import ssm.util.Infor;
import ssm.util.Page;

/*
 *王钢旗
 *2017年4月21日
 */
@Service("priceService")
public class PriceServiceImpl implements PriceService {

	@Autowired
	private PriceDao priceDao;
	@Autowired
	private WuYeDao wuYeDao;
	@Autowired
	private HouseDao houseDao;
	public Infor insert(Price price) {
		try {
//			Integer id = this.check(price.getMonth());
			if(check(price.getMonth())){
				priceDao.insert(price);
				List<String> accounts = houseDao.getAccount(null);
				List<WuYe> list = new ArrayList<WuYe>();
				for (String string : accounts) {
					WuYe temp = new WuYe();
					temp.setHouseid(string);
					temp.setMonth(price.getMonth());
					temp.setWuye(price.getWuyePrice());
					list.add(temp);
				}
				wuYeDao.insertBatch(list);
			}else{
				return new Infor(false, "已经存在这个月的单价了");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return new Infor(false, "系统出现异常");
		}
		return new Infor(true, "保存成功");
	}
	public Boolean check(String month) {
		// TODO Auto-generated method stub
		try {
			System.out.println("返回的id是:"+priceDao.check(month));
			if(priceDao.check(month)!=null){
				return false;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public Page<Price> getPage(Page<Price> page) {
		// TODO Auto-generated method stub
		page.updateBefore();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", page.getStart());
		map.put("length", page.getPageNumber());
		List<Price> list= priceDao.getList(map);
		page.setList(list);
		Integer count =priceDao.getCount();
		page.setTotalQuqatity(count);
		page.update();
		return page;
	}
	public Infor updateById(Price price) {
		// TODO Auto-generated method stub
		try {
			priceDao.updateById(price);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return new Infor(false, "系统出现错误");
		}
		return new Infor(true, "更新成功");
	}
	public Infor delete(Integer[] ids) {
		// TODO Auto-generated method stub
		try {
			priceDao.delete(ids);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return new Infor(false, "系统出现错误");
		}
		return new Infor(true, "删除成功");
	}

}
