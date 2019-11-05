package ssm.test;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import ssm.bean.User;
import ssm.dao.UserDao;


/*
 *王钢旗
 *2017年4月6日
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class userdaolTest {
	@Autowired
	private UserDao dao;
	@Test
	public void testInsert(){
		User user = new User();
		user.setAccount("00000");
		user.setPwd("123456");
		dao.insert(user);
	}
	@Test
	public void testcheck(){
		Integer id = dao.checkAccount("00000");
		System.out.println(id);
	}
}
