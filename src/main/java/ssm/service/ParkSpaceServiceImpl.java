package ssm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.FastArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;

import ssm.bean.House;
import ssm.bean.ParkingSpace;
import ssm.dao.ParkSpaceDao;
import ssm.util.Infor;
import ssm.util.Page;

/*
 *王钢旗
 *2017年4月18日
 */
@Service(value="parkService")
public class ParkSpaceServiceImpl implements ParkSpaceService {

	@Autowired
	private ParkSpaceDao parkDao;
	public Infor insert(ParkingSpace temp) {
		// TODO Auto-generated method stub
		try {
			//Integer flag = parkDao.checkid(temp.getId());
			if(parkDao.checkid(temp.getId())!=null){
				return new Infor(true, "已经存在了");
			}
			parkDao.insert(temp);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return new Infor(false, "系统出现问题");
		}
		return new Infor(true, "增加成功");
	}
	public Page<ParkingSpace> getPage(ParkingSpace park, Page<ParkingSpace> page) {
		page.updateBefore();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", page.getStart());
		map.put("length", page.getPageNumber());
		if(park.getLocation()!=null){
			map.put("location", park.getLocation());
		}
		if(park.getStatus()!=null){
			map.put("status", park.getStatus());
		}
		List<ParkingSpace> list= parkDao.getList(map);
		page.setList(list);
		Integer count =parkDao.getCount(map);
		page.setTotalQuqatity(count);
		page.update();
		return page;
	}
	public Boolean delete(Integer[] ids) {
		// TODO Auto-generated method stub
		try {
			parkDao.delete(ids);
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
		return true;
	}
	public List<String> getLocations() {
		try {
			List<String> locations = parkDao.getLocations();
			return locations;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
