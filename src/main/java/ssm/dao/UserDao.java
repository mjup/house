package ssm.dao;

import java.util.Map;

import ssm.bean.User;

/*
 *王钢旗
 *2017年4月17日
 */
public interface UserDao extends BaseInterface<User> {
	public Integer checkAccount(String account);
	public Map<String, Object> checkUser(User user);
}
