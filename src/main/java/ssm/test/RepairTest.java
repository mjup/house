package ssm.test;

import static org.junit.Assert.*;

import java.text.SimpleDateFormat;
import java.util.Map;
import java.util.Map.Entry;

import org.codehaus.jackson.map.module.SimpleAbstractTypeResolver;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import ssm.bean.Repair;
import ssm.dao.RepairDao;
import ssm.util.GeneratorSql;
import ssm.util.UUIDUtil;

/*
 *王钢旗
 *2017年4月20日
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class RepairTest {

	@Autowired
	private RepairDao repairDao;
	@Test
	public void test() {
//		fail("Not yet implemented");
		GeneratorSql temp = new GeneratorSql(Repair.class);
		temp.list();
	}
	@Test
	public void testInsert(){
		Repair temp = new Repair();
//		temp.setId(UUIDUtil.getId());
		temp.setCategory("水表");
		temp.setCompletedate("2017-04-20");
		temp.setDescr("水表坏了");
		temp.setHouseid("323232");
		temp.setMaterial(12.3);
		temp.setMeans(1);
		temp.setPaydate("2017-04-20");
		temp.setPrincipal("王钢旗");
		temp.setRepairdate("2017-02-12");
		temp.setReportdate("2017-02-09");
		temp.setStatus(0);
		temp.setUpkeep(30.12);
		repairDao.insert(temp);
//		System.out.println(temp.getId());
	}
	@Test
	public void testGetList(){
		
		Map<String, Object> map = repairDao.getInfoForRepair(1);
		for (Entry<String, Object> map1 : map.entrySet()) {
			System.out.println(map1.getKey()+"----"+map1.getValue());
		}
	}

}
