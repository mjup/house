package ssm.test;

import static org.junit.Assert.*;

import java.util.Properties;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;




import ssm.service.SysService;
import ssm.util.Infor;

/*
 *王钢旗
 *2017年4月26日
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class Systest {

	@Resource(name="sysService")
	private SysService sysService;
	@Test
	public void test() {
		Properties temp = sysService.getProperties();
		System.out.println(temp.get("introduce"));
	}
	@Test
	public void testUpdate(){
		Infor flag = sysService.updateIntroduce("abcd");
		System.out.println(flag.getMsg());
	}
}
