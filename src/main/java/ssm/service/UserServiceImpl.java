package ssm.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssm.bean.User;
import ssm.dao.UserDao;

/*
 *王钢旗
 *2017年4月26日
 */
@Service(value="userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	public Map<String, Object> login(User user) {
		Map<String, Object> temp = userDao.checkUser(user);
		return temp;
	}

}
