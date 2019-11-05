package ssm.service;

import ssm.bean.Message;
import ssm.util.Infor;
import ssm.util.Page;

/*
 *王钢旗
 *2017年4月21日
 */
public interface MessageService {
	public Boolean insert(Message temp);
	public Page<Message> getPage(Page<Message> page, Message message);
	public Infor updateById(Message message);
}
