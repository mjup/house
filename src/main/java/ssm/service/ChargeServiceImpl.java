package ssm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.swing.text.GapContent;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import ssm.bean.Charge;
import ssm.bean.Electric;
import ssm.bean.Gas;
import ssm.bean.Hire;
import ssm.bean.Water;
import ssm.dao.ChargeDao;
import ssm.dao.ElectricDao;
import ssm.dao.GasDao;
import ssm.dao.HouseDao;
import ssm.dao.WaterDao;
import ssm.util.Infor;
import ssm.util.Page;

/*
 *王钢旗
 *2017年4月24日
 */
@Service(value="chargeService")
public class ChargeServiceImpl implements ChargeService {

	@Autowired
	private WaterDao waterDao;
	@Autowired
	private GasDao gasDao;
	@Autowired
	private ElectricDao electricDao;
	@Autowired
	private ChargeDao chargeDao;
	public Infor insertBatch(String jsonString) {
		// TODO Auto-generated method stub
		try {
			JSONObject object = JSONObject.fromObject(jsonString);
			Integer type = (Integer) object.get("type");
			String month = object.getString("month");
//			if(chargeDao.check(month)!=null){
//				return new Infor(false, "已经录入过了");
//			}
			String floorid = object.getString("floorid");
			JSONArray array = JSONArray.fromObject(object.get("array"));
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("month", month);
			map.put("floorid", floorid);
			switch (type) {
			case 1:
				//String flag = waterDao.check(month);
				if(waterDao.check(map)!=null){
					return new Infor(true, "已经录入过本月的水量了");
				}
				List<Water> list = JSONArray.toList(array, Water.class);
				map.put("list", list);
				waterDao.insertWaters(map);
				break;
			case 2:
				if(gasDao.check(map)!=null){
					return new Infor(true, "已经录入过本月的燃气量了");
				}
				List<Gas> list2 = JSONArray.toList(array, Gas.class);
				map.put("list", list2);
				gasDao.insertBatch(map);
				break;
			case 3:
				if(electricDao.check(map)!=null){
					return new Infor(true, "已经录入过本月的电量了");
				}
				List<Electric> list3 = JSONArray.toList(array, Electric.class);
				map.put("list", list3);
				electricDao.insertBatch(map);
				break;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return new Infor(false, "系统出现错误");
		}
		
		return new Infor(true, "增加成功");
	}
	public Page<Charge> getPage(String floorid,String month,Page<Charge> page,Integer status) {
		// TODO Auto-generated method stub
		page.updateBefore();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", page.getStart());
		map.put("length", page.getPageNumber());
		map.put("month", month);
		map.put("floorid", floorid);
		if(status!=null){
			map.put("status", status);
		}
		List<Charge> list= chargeDao.getList(map);
		if(list.size()==0&&status==null){
			chargeDao.loadData(map);
			list = chargeDao.getList(map);
		}
		page.setList(list);
		Integer count =chargeDao.getCount(map);
		page.setTotalQuqatity(count);
		page.update();
		return page;
	}
	public Map<String, Object> getDetailById(Integer id) {
		try {
			Map<String, Object> map = chargeDao.getDetail(id);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public Map<String, Object> getDetailByMap(Map<String, Object> map) {
		try {
			map = chargeDao.getMapByMap(map);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public Infor updateStatus(String month, String houseid, String rname,Integer means) {
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("month", month);
			map.put("houseid", houseid);
			map.put("rname", rname);
			map.put("means", means);
			chargeDao.updateStatus(map);
			return new Infor(true, "更新成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new Infor(false,"更新失败");
		}
	}
	public Map<String, Object> getDetailForLook(Integer id) {
		try {
			Map<String, Object> map = chargeDao.getDetailForLook(id);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public List<Map<String, Object>> getCountList(String year) {
		// TODO Auto-generated method stub
		try {
			List<Map<String, Object>> list = chargeDao.getCountList(year);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
