package ssm.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssm.bean.Hire;
import ssm.bean.House;
import ssm.dao.HireDao;
import ssm.util.DateUtil;
import ssm.util.Page;

/*
 *王钢旗
 *2017年4月19日
 */
@Service(value="hireService")
public class HireServiceImpl implements HireService {

	@Autowired
	private HireDao hireDao;
	public Boolean insert(Hire temp) {
		// TODO Auto-generated method stub
		try {
			temp.setTdate(DateUtil.getDay());
			hireDao.insert(temp);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public Map<String, Object> getById(Integer id) {
		// TODO Auto-generated method stub
		Map<String, Object> map = null;
		try {
			map = hireDao.getMapById(id);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return map;
	}
	public Map<String, Object> getRelet(Integer id) {
		// TODO Auto-generated method stub
		Map<String, Object> map = null;
		try {
			map = hireDao.getrelet(id);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return map;
	}
	public Boolean update(Hire temp) {
		// TODO Auto-generated method stub
		try {
			hireDao.updateById(temp);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public Page<Hire> getPage(Hire hire, Page<Hire> page) {
		page.updateBefore();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", page.getStart());
		map.put("length", page.getPageNumber());
		map.put("pid", hire.getPid());
		List<Hire> list= hireDao.getList(map);
		page.setList(list);
		Integer count =hireDao.getCount(map);
		page.setTotalQuqatity(count);
		page.update();
		return page;
	}
	public Boolean delete(Integer[] ids) {
		// TODO Auto-generated method stub
		try {
			hireDao.delete(ids);
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
		return true;
	}

}
