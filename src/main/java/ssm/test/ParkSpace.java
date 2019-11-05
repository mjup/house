package ssm.test;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import ssm.bean.ParkingSpace;
import ssm.dao.ParkSpaceDao;
import ssm.service.ParkSpaceService;
import ssm.util.GeneratorSql;

/*
 *王钢旗
 *2017年4月18日
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class ParkSpace {
	@Autowired
	private ParkSpaceService parkService;
	@Autowired
	private ParkSpaceDao dao;
	@Test
	public void testGeneratorSql() {
//		fail("Not yet implemented");
		GeneratorSql sql = new GeneratorSql(ParkingSpace.class);
		sql.generatorFiled();
		System.out.println("--------------");
		sql.generatorUpdate();
		System.out.println("--------------");
		sql.generatorVariable();
	}
	@Test
	public void testInsert(){
		ParkingSpace temp = new ParkingSpace();
//		temp.setId(123l);
		temp.setId(123);
		temp.setCharge(12.23);
		temp.setNote("位于中央位置");
		temp.setLength(5.5);
		temp.setLocation("3#2-3#3");
		temp.setMaxyear(10);
		temp.setStatus(0);
		temp.setWidth(4.0);
		parkService.insert(temp);
	}
	@Test
	public void testgetCount(){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("location", "shanji");
		Integer count = dao.getCount(map);
		System.out.println(count);
	}
}
