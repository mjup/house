package ssm.test;

import static org.junit.Assert.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.Set;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sun.corba.se.impl.encoding.OSFCodeSetRegistry.Entry;

import ssm.bean.Hire;
import ssm.dao.HireDao;
import ssm.util.GeneratorSql;

/*
 *王钢旗
 *2017年4月18日
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class HireTest {
	
	@Autowired
	private HireDao hireDao;
	@Test
	public void test() {
		GeneratorSql sql = new GeneratorSql(Hire.class);
//		System.out.println();
		sql.list();
	}
	@Test
	public void testInsert(){
		Hire temp = new Hire();
		temp.setDescr("快到了，还没给钱呢");
		temp.setHcharge(123.00);
		temp.setHname("张三");
		temp.setHouseid("323232");
		temp.setHphone("12345678");
		temp.setLease(3);
		temp.setPid(1);
		temp.setRname("admin");
		
		try {
			temp.setStartdate(new SimpleDateFormat("yyyy-mm-dd").format(new Date()));
			temp.setTdate(new SimpleDateFormat("yyyy-mm-dd").format(new Date()));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		hireDao.insert(temp);
	}
	@Test
	public void testGetMap(){
		Map<String, Object> map = hireDao.getrelet(2);
		for (Map.Entry<String, Object> entry : map.entrySet()) {
			System.out.println("key是:"+entry.getKey()+"    value是:"+entry.getValue());
		}
	}

}
