package ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/*
 *王钢旗
 *2017年4月26日
 */
@Controller(value="clientController")
public class ClientController {

	@RequestMapping("/{path}.do")
	public String go(@PathVariable(value="path") String path){
		return "/"+path+".jsp";
	}
}
