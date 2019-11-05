package ssm.test;

import static org.junit.Assert.*;

import java.util.Map;
import java.util.Map.Entry;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import ssm.service.ChargeService;

/*
 *王钢旗
 *2017年4月25日
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class ChargeTest {

	@Autowired
	private ChargeService chargeService;
	@Test
	public void test() {
//		fail("Not yet implemented");
		Map<String, Object> map = chargeService.getDetailById(1);
		for (Entry<String, Object> entry : map.entrySet()) {
			System.out.println(entry.getKey()+"----"+entry.getValue());
		}
	}

}
