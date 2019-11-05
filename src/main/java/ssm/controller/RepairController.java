package ssm.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ssm.bean.Repair;
import ssm.service.RepairService;
import ssm.util.Page;

/*
 *王钢旗
 *2017年4月20日
 */
@Controller(value="repairController")
@RequestMapping("/admin/repair")
public class RepairController {

	@Resource(name="repairService")
	private RepairService repairService;
	@ResponseBody
	@RequestMapping("/save.do")
	public Boolean save(Repair repair){
		Boolean flag = repairService.insert(repair);
		return flag;
	}
	
	@ResponseBody
	@RequestMapping("/list.do")
	public Page<Repair> getPage(Repair repair,Page<Repair> page,String startdate,String enddate){
		page = repairService.getPage(repair, page, startdate, enddate);
		return page;
	}
	@ResponseBody
	@RequestMapping("/getById.do")
	public Map<String, Object> getById(Integer id,Integer type){
		Map<String, Object> map = repairService.getMap(id, type);
		return map;
	}
	@ResponseBody
	@RequestMapping("/updateById.do")
	public Boolean updateById(Repair repair,Integer type){
		Boolean flag = repairService.updateById(repair, type);
		return flag;
	}
	@ResponseBody
	@RequestMapping("/delete.do")
	public Boolean delete(Integer[] ids){
		Boolean flag = repairService.delete(ids);
		return flag;
	}
	@ResponseBody
	@RequestMapping("/count.do")
	public Map<String, Object> getPageForCount(String time,String principal){
		Map<String, Object> map = repairService.getPageForCount(time,principal);
		return map;
	}
	
}
