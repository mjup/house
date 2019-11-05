package ssm.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ssm.bean.Hire;
import ssm.bean.House;
import ssm.service.HireService;
import ssm.util.Page;

/*
 *王钢旗
 *2017年4月19日
 */
@Controller(value="hirecontroller")
@RequestMapping("/admin/hire")
public class HireController {
	@Resource(name="hireService")
	private HireService hireService;
	@ResponseBody
	@RequestMapping("/save.do")
	public Boolean save(Hire temp){
		Boolean flag = hireService.insert(temp);
		return flag;
	}
	@ResponseBody
	@RequestMapping("/get.do")
	public Map<String, Object> get(Integer id){
		Map<String, Object> map = hireService.getById(id);
		return map;
	}
	@ResponseBody
	@RequestMapping("/getrelet.do")
	public Map<String, Object> getrelet(Integer id){
		Map<String, Object> map= hireService.getRelet(id);
		return map;
	}
	@ResponseBody
	@RequestMapping("/update.do")
	public Boolean update(Hire temp){
		Boolean flag = hireService.update(temp);
		return flag;
	}
	@ResponseBody
	@RequestMapping("/list.do")
	public Page<Hire> list(Hire hire,Model model,Page<Hire> page){
		 page = hireService.getPage(hire, page);
		return page;
	}
	@ResponseBody
	@RequestMapping("/delete.do")
	public Boolean delete(Integer[] ids){
		Boolean flag = hireService.delete(ids);
		return flag;
	}
}
