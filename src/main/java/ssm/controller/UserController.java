package ssm.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ssm.bean.User;
import ssm.service.UserService;
import ssm.util.Infor;

import com.sun.xml.internal.bind.v2.runtime.Name;

/*
 *王钢旗
 *2017年4月26日
 */
@Controller(value="userController")
@RequestMapping("/admin/user")
public class UserController {

	@Resource(name="userService")
	private UserService userService;
	@ResponseBody
	@RequestMapping("/login.do")
	public Infor login(User user,HttpSession session){
		Map<String, Object> map = userService.login(user);
		if(map!=null){
			session.setAttribute("userid", map.get("id"));
			session.setAttribute("account", map.get("account"));
			session.setAttribute("owner", map.get("owner"));
			return new Infor(true, "登录成功");
		}else{
			return new Infor(false, "登录失败");
		}
	}
	@ResponseBody
	@RequestMapping("/logout.do")
	public Infor logout(HttpSession session){
		session.invalidate();
		return new Infor(true, "退出成功");
	}
}
