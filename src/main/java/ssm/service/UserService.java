package ssm.service;

import java.util.Map;

import ssm.bean.User;


/*
 *王钢旗
 *2017年4月26日
 */
public interface UserService {
	public Map<String, Object> login(User user);
}
