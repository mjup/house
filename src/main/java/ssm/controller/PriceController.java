package ssm.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ssm.bean.ParkingSpace;
import ssm.bean.Price;
import ssm.bean.Water;
import ssm.service.PriceService;
import ssm.util.Infor;
import ssm.util.Page;

/*
 *王钢旗
 *2017年4月21日
 */
@Controller(value="priceController")
@RequestMapping("/admin/price")
public class PriceController {
	@Resource(name="priceService")
	private PriceService priceService;
	@ResponseBody
	@RequestMapping("/save.do")
	public Infor save(Price price){
		Infor flag = priceService.insert(price);
		return flag;
	}
	/*@ResponseBody
	@RequestMapping("/test.do")
	public Boolean test(@RequestBody Water[] waters){
		for (Water water : waters) {
			System.out.println(water.getHouseid()+"----"+water.getFloorid());
		}
		return true;
	}*/
	@ResponseBody
	@RequestMapping("/list.do")
	public Page<Price> getList(Page<Price> page){
		page = priceService.getPage(page);
		return page;
	}
	@ResponseBody
	@RequestMapping("/update.do")
	public Infor update(Price price){
		Infor flag = priceService.updateById(price);
		return flag;
	}
	@ResponseBody
	@RequestMapping("/delete.do")
	public Infor delete(Integer[] ids){
		Infor flag = priceService.delete(ids);
		return flag;
	}
}
