package ssm.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ssm.bean.Message;
import ssm.service.MessageService;
import ssm.util.Infor;
import ssm.util.Page;

/*
 *王钢旗
 *2017年4月21日
 */
@Controller(value="messageController")
@RequestMapping("/admin/message")
public class MessageController {

	@Resource(name="messageService")
	private MessageService messageService;
	@ResponseBody
	@RequestMapping("/save.do")
	public Boolean save(Message temp){
		Boolean flag = messageService.insert(temp);
		return flag;
	}
	@ResponseBody
	@RequestMapping("/list.do")
	public Page<Message> getList(Page<Message> page,Message message){
		page = messageService.getPage(page, message);
		return page;
	}
	@ResponseBody
	@RequestMapping("/update.do")
	public Infor update(Message message){
		Infor flag = messageService.updateById(message);
		return flag;
	}
}
