package ssm.dao;

import java.util.List;
import java.util.Map;

import ssm.bean.Message;

/*
 *王钢旗
 *2017年4月21日
 */
public interface MessageDao extends BaseInterface<Message> {
	public List<Message> getList(Map<String, Object> map);
	public Integer getCount(Map<String, Object> map);
	//public void update
}
