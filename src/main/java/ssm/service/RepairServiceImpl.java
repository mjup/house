package ssm.service;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sun.org.apache.xpath.internal.operations.And;

import ssm.bean.ParkingSpace;
import ssm.bean.Repair;
import ssm.dao.RepairDao;
import ssm.util.Page;

/*
 *王钢旗
 *2017年4月20日
 */
@Service("repairService")
public class RepairServiceImpl implements RepairService {

	@Autowired
	private RepairDao repairDao;
	public Boolean insert(Repair temp) {
		// TODO Auto-generated method stub
		try {
			repairDao.insert(temp);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public Page<Repair> getPage(Repair repair, Page<Repair> page,String startDate,String endDate) {
		page.updateBefore();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", page.getStart());
		map.put("length", page.getPageNumber());
		if(repair.getReportdate()!=null){
			map.put("reportdate", repair.getReportdate());
		}
		if(startDate!=null){
			map.put("startdate", startDate);
		}
		if(endDate!=null){
			map.put("enddate", endDate);
		}
		if(repair.getCategory()!=null){
			map.put("category", repair.getCategory());
		}
		if(repair.getStatus()!=null){
			map.put("status", repair.getStatus());
		}
		if(repair.getHouseid()!=null){
			map.put("account", repair.getHouseid());
		}
		List<Repair> list= repairDao.getList(map);
		page.setList(list);
		Integer count =repairDao.getCount(map);
		page.setTotalQuqatity(count);
		page.update();
		return page;
	}
	//type 为1  查询安排维修信息
	public Map<String, Object> getMap(Integer id, Integer type) {
		// TODO Auto-generated method stub
		Map<String, Object> map = null;
		if(type == 1){
			map = repairDao.getInfoForRepair(id);
		}
		return map;
	}
	public Boolean updateById(Repair repair, Integer type) {
		// TODO Auto-generated method stub
		try {
			if(type==1){
				repairDao.updateRepair(repair);
			}
			if(type==2){
				repairDao.updateComplete(repair);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public Boolean delete(Integer[] ids) {
		// TODO Auto-generated method stub
		try {
			repairDao.delete(ids);
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
		return true;
	}
	public Map<String, Object> getPageForCount(String time,String principal) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		if(time!=null && time.length()>0){
			time = time.substring(0, time.lastIndexOf('-'));
			map.put("time", time);
		}
		if(principal!=null && principal.length()>0){
			map.put("principal", principal);
		}
		List<Repair> list = repairDao.getListForCount(map);
		if(repairDao.getCountForCount(map) !=null){
			map = repairDao.getCountForCount(map);
		}
		if(list!=null&&list.size()>0){
			map.put("list", list);
			return map;
		}else{
			map.clear();
			map.put("message", "没有找到数据");
			return map;
		}
		
	}

}
