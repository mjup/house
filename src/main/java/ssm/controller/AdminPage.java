package ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/*
 *王钢旗
 *2017年4月17日
 */
@Controller(value="adminPage")
@RequestMapping(value="/admin/page")
public class AdminPage {
	@RequestMapping("/{resource}.do")
	public String main(@PathVariable(value="resource")String resource){
		return "/WEB-INF/admin/"+resource+".jsp";
	}
//	@RequestMapping("/left.do")
//	public String left(){
//		return "/WEB-INF/admin/left.html";
//	}
//	@RequestMapping("/right.do")
//	public String right(){
//		return "/WEB-INF/admin/right.html";
//	}
//	@RequestMapping("/head.do")
//	public String head(){
//		return "/WEB-INF/admin/head.jsp";
//	}
	@RequestMapping("/{model}/{resource}.do")
	public String showPage(@PathVariable(value="model")String model,@PathVariable(value="resource")String resource){
		return "/WEB-INF/admin/"+model+"/"+resource+".jsp";
	}
}
