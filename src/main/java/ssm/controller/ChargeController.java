package ssm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ssm.bean.Charge;
import ssm.service.ChargeService;
import ssm.util.Infor;
import ssm.util.Page;

/*
 *王钢旗
 *2017年4月24日
 */
@Controller(value="chargeController")
@RequestMapping("/admin/charge")
public class ChargeController {
	
	@Autowired
	private ChargeService chargeService;
	@ResponseBody
	@RequestMapping("/save.do")
	public Infor save(String json){
		Infor flag = chargeService.insertBatch(json);
		return flag;
	}
	@ResponseBody
	@RequestMapping("/list.do")
	public Page<Charge> getPage(String floorid,String month,Page<Charge> page,Integer status){
		page = chargeService.getPage(floorid, month, page,status);
		return page;
	}
	@ResponseBody
	@RequestMapping("/detail.do")
	public Map<String, Object> getDetail(Integer id){
		Map<String, Object> map = chargeService.getDetailById(id);
		return map;
	}
	@ResponseBody
	@RequestMapping("/find.do")
	public Map<String, Object> find(String houseid,String month){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("houseid", houseid);
		map.put("month", month);
		map = chargeService.getDetailByMap(map);
		if(map==null){
			map = new HashMap<String, Object>();
			map.put("msg", "没有记录");
		}
		return map;
	}
	@ResponseBody
	@RequestMapping("/update.do")
	public Infor update(String houseid,String month,String rname,Integer means){
		Infor flag = chargeService.updateStatus(month, houseid, rname,means);
		return flag;
	}
	@ResponseBody
	@RequestMapping("/look.do")
	public Map<String, Object> getDetailForLook(Integer id){
		Map<String, Object> map = chargeService.getDetailForLook(id);
		return map;
	}
	@ResponseBody
	@RequestMapping("/count.do")
	public List<Map<String, Object>> getCount(String year){
		List<Map<String, Object>> list = chargeService.getCountList(year);
		return list;
	}
}
