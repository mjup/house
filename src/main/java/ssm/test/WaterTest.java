package ssm.test;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import ssm.bean.Water;
import ssm.dao.WaterDao;
import ssm.service.ChargeService;

/*
 *王钢旗
 *2017年4月24日
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class WaterTest {
	@Autowired
	private WaterDao waterDao;
	@Resource(name="chargeService")
	private ChargeService service;
	@Test
	public void test() {
//		fail("Not yet implemented");
		List<Water> waters = new ArrayList<Water>();
		for (int i = 0; i < 3; i++) {
			Water water = new Water();
			water.setFloorid("10#");
			water.setHouseid("323232");
			water.setMonth("2017-05");
			water.setWater(11.11);
			waters.add(water);
		}
		System.out.println(waterDao);
		//waterDao.insertWaters(waters);
	}
	@Test
	public void testServiceInsert(){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", 1);
		map.put("floorid", "10#");
		map.put("month", "2017-05");
		List<Water> waters = new ArrayList<Water>();
		for (int i = 0; i < 3; i++) {
			Water water = new Water();
			//water.setFloorid("10#");
			water.setHouseid("323232");
			//water.setMonth("2017-05");
			water.setWater(11.11);
			waters.add(water);
		}
		map.put("array", waters);
		JSONObject temp = new JSONObject();
		temp.putAll(map);
		String json = temp.toString();
//		System.out.println(json);
		service.insertBatch(json);
	}

}
