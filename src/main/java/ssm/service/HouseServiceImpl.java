package ssm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.stream.events.StartDocument;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssm.bean.House;
import ssm.bean.User;
import ssm.dao.HouseDao;
import ssm.dao.UserDao;
import ssm.util.Page;
import ssm.vo.HouseVO;

/*
 *王钢旗
 *2017年4月17日
 */
@Service(value="houseService")
public class HouseServiceImpl implements HouseService {
	
	@Autowired
	private HouseDao houseDao;
	@Autowired
	private UserDao userDao;
	private Boolean flag = true;
	public void setFlag(Boolean flag) {
		this.flag = flag;
	}
	public Page<House> getPage(House house,Page<House> page) {
		// TODO Auto-generated method stub
		page.updateBefore();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", page.getStart());
		map.put("length", page.getPageNumber());
		if(house.getAccount()!=null){
			map.put("account", house.getAccount());
		}
		if(house.getOwner()!=null){
			map.put("owner", house.getOwner());
		}
		if(house.getFloorid()!=null){
			map.put("floorid", house.getFloorid());
		}
		List<House> list= houseDao.getList(map);
		page.setList(list);
		Integer count =houseDao.getCount(map);
		page.setTotalQuqatity(count);
		page.update();
		return page;
	}
	public Boolean save(House house) {
		// TODO Auto-generated method stub
		try{
		houseDao.insert(house);
//		User user = new User();
//		user.setAccount(house.getAccount());
//		userDao.insert(user);
		}catch(Exception e){
			e.printStackTrace();
			flag = false;
		}
		return flag;
	}
	public Boolean delete(Integer[] ids) {
		// TODO Auto-generated method stub
		try {
			houseDao.delete(ids);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			flag = false;
		}
		return flag;
	}
	public Boolean update(Integer[] ids, House house) {
		// TODO Auto-generated method stub
		try {
			Map<String, Object> map = new HashMap<String, Object>();
				map.put("account", house.getAccount());
				map.put("bdate", house.getBdate());
				map.put("area", house.getArea());
				map.put("cellid", house.getCellid());
				map.put("descr", house.getDescr());
				map.put("floorid", house.getFloorid());
				map.put("mdate", house.getMdate());
				map.put("owner", house.getOwner());
				map.put("ownerphone", house.getOwnerphone());
				map.put("population", house.getPopulation());
				map.put("shape", house.getShape());
				map.put("ids", ids);
				houseDao.update(map);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			flag = false;
		}
		return flag;
	}
	public House getById(Integer id) {
		// TODO Auto-generated method stub
		House house = null;
		try {
			house = houseDao.getById(id);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return house;
	}
	public Boolean updateById(House house) {
		try {
			houseDao.updateById(house);
		} catch (Exception e) {
			// TODO: handle exception
			flag = false;
		}
		return flag;
	}
	public Boolean checkAccount(String account) {
		// TODO Auto-generated method stub
		try {
			System.out.println("返回的结果是:---"+houseDao.checkAccount(account));
			 if(houseDao.checkAccount(account)!=null){
				 flag = false;
			 }
		} catch (Exception e) {
			// TODO: handle exception
			flag = false;
		}
		return flag;
	}
	public List<String> getFloorids() {
		List<String> list = null;
		try {
			list = houseDao.getFloorIds();
			return list;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
//		return null;
	}
	public List<String> getAccounts(String floorid) {
		List<String> list = null;
		try {
			list =houseDao.getAccount(floorid);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
