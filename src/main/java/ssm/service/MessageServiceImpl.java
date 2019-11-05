package ssm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssm.bean.Message;
import ssm.bean.Price;
import ssm.dao.MessageDao;
import ssm.util.Infor;
import ssm.util.Page;

/*
 *王钢旗
 *2017年4月21日
 */
@Service(value="messageService")
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageDao messageDao;
	public Boolean insert(Message temp) {
		// TODO Auto-generated method stub
		try {
			temp.setIsread(0);
			messageDao.insert(temp);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public Page<Message> getPage(Page<Message> page, Message message) {
		page.updateBefore();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", page.getStart());
		map.put("length", page.getPageNumber());
		map.put("houseid", message.getHouseid());
		map.put("isread", message.getIsread());
		List<Message> list= messageDao.getList(map);
		page.setList(list);
		Integer count =messageDao.getCount(map);
		page.setTotalQuqatity(count);
		page.update();
		return page;
	}
	public Infor updateById(Message message) {
		try {
			messageDao.updateById(message);
			return new Infor(true, "已经标记为已读");
		} catch (Exception e) {
			e.printStackTrace();
			return new Infor(false, "出现错误");
		}
	}

}
