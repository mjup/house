package ssm.test;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import ssm.bean.ParkingSpace;
import ssm.bean.Price;
import ssm.util.GeneratorSql;

/*
 *王钢旗
 *2017年4月21日
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class PriceTest {

	@Test
	public void test() {
		GeneratorSql sql = new GeneratorSql(Price.class);
		sql.list();
	}

}
