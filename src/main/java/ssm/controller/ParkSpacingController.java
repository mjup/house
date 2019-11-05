package ssm.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sun.org.apache.xpath.internal.operations.Bool;

import ssm.bean.House;
import ssm.bean.ParkingSpace;
import ssm.service.ParkSpaceService;
import ssm.util.Infor;
import ssm.util.Page;

/*
 *王钢旗
 *2017年4月19日
 */
@Controller(value="park")
@RequestMapping("/admin/park")
public class ParkSpacingController {

	@Resource(name="parkService")
	private ParkSpaceService parkService;
	@ResponseBody
	@RequestMapping("/save.do")
	public Infor insert(ParkingSpace park){
		Infor flag = parkService.insert(park);
		return flag;
	}
	@ResponseBody
	@RequestMapping("/list.do")
	public Page<ParkingSpace> getList(ParkingSpace park,Model model,Page<ParkingSpace> page){
		page = parkService.getPage(park, page);
		return page;
	}
	@ResponseBody
	@RequestMapping("/delete.do")
	public Boolean delete(Integer[] ids){
		Boolean flag = parkService.delete(ids);
		return flag;
	}
	@ResponseBody
	@RequestMapping("/getLocations.do")
	public List<String> getLocations(){
		List<String> locations = parkService.getLocations();
		return locations;
	}
}
