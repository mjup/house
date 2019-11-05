package ssm.controller;

import javax.sound.midi.MidiDevice.Info;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ssm.bean.Announce;
import ssm.service.AnnounceService;
import ssm.util.Infor;
import ssm.util.Page;

/*
 *王钢旗
 *2017年4月25日
 */
@Controller(value="announceController")
@RequestMapping("/admin/announce")
public class AnnounceController {

	@Autowired
	private AnnounceService announceService;
	@ResponseBody
	@RequestMapping("/save.do")
	public Infor save(Announce temp){
		Infor flag = announceService.insert(temp);
		return flag;
	}
	@ResponseBody
	@RequestMapping("/list.do")
	public Page<Announce> getPage(String startdate,String enddate,Page<Announce> page){
		page = announceService.getPage(startdate, enddate, page);
		return page;
	}
	@ResponseBody
	@RequestMapping("/delete.do")
	public Infor delete(Integer[] ids){
		Infor flag = announceService.delete(ids);
		return flag;
	}
	@ResponseBody
	@RequestMapping("/getResent.do")
	public Announce getResent(){
		Announce recent = announceService.getRecent();
		return recent;
	}
}
