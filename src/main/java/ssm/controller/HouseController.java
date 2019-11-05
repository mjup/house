package ssm.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ssm.bean.House;
import ssm.service.HouseService;
import ssm.util.Page;
import ssm.vo.HouseVO;

/*
 *王钢旗
 *2017年4月17日
 */
@Controller(value="house")
@RequestMapping("/admin/houses")
public class HouseController {
	@Resource(name="houseService")
	private HouseService houseService;
	
	@ResponseBody
	@RequestMapping("/get/list.do")
	public Page<House> list(House house,Model model,Page<House> page){
//		page.updateBefore();
		page = houseService.getPage(house,page);
//		model.addAttribute("page", page);
		return page;
	}
//	@RequestMapping("/put/add.do")
//	public String add(){
//		return "/WEB-INF/admin/house/create.jsp";
//	}
	@ResponseBody
	@RequestMapping("/put/save.do")
	public Boolean save(House house){
		boolean flag = houseService.save(house);
		houseService.setFlag(true);
		return flag;
	}
	@ResponseBody
	@RequestMapping("/delete.do")
	public Boolean delete(Integer[] ids){
		Boolean flag = houseService.delete(ids);
		houseService.setFlag(true);
		return flag;
	}
	@ResponseBody
	@RequestMapping("/update.do")
	public Boolean update(House house){
		boolean flag = houseService.updateById(house);
		houseService.setFlag(true);
		return flag;
	}
	@ResponseBody
	@RequestMapping("/check.do")
	public Boolean check(String account){
		boolean flag = houseService.checkAccount(account);
		houseService.setFlag(true);
		return flag;
	}
	@ResponseBody
	@RequestMapping("/getFloorids.do")
	public List<String> getFloorids(){
		List<String> list = houseService.getFloorids();
		return list;
	}
	@ResponseBody
	@RequestMapping("/getAccounts.do")
	public List<String> getAccounts(String floorid){
		List<String> list = houseService.getAccounts(floorid);
		return list;
	}
}
