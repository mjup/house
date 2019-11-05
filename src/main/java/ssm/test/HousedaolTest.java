package ssm.test;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import ssm.bean.House;
import ssm.bean.User;
import ssm.dao.HouseDao;
import ssm.dao.UserDao;
import ssm.service.HouseService;
import ssm.util.DateUtil;
import ssm.util.Page;
import ssm.vo.HouseVO;


/*
 *王钢旗
 *2017年4月6日
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class HousedaolTest {
	@Autowired
	private HouseDao dao;
	@Resource(name="houseService")
	private HouseService service;
	@Test
	public void testInsert(){
		House temp = new House();
		temp.setAccount("00002");
		temp.setFloorid("4幢");
		temp.setCellid("3单元402");
		temp.setArea(103.00);
		temp.setMdate(DateUtil.getDay());
		dao.insert(temp);
	}
	@Test
	public void testGet(){
		Map<String, Object> map = new HashMap<String, Object>();
		//map.put("owner", "王");
		map.put("start", 0);
		map.put("length", 5);
		List<House> list = dao.getList(map);
		for (House house : list) {
			System.out.println(house.getOwner());
		}
	}
	@Test
	public void testGetPage(){
		House house = new House();
		house.setAccount("00000");
		Page<House> page = new Page<House>();
		page.setNowPage(1);
		page.setPageNumber(5);
		page = service.getPage(house, page);
		System.out.println(page.getList().get(0).getOwner()+page.getTotalQuqatity());
	}
	@Test
	public void testdelete(){
		Integer[] ids = {2,3};
		dao.delete(ids);
	}
	@Test
	public void testGetById(){
		House house = service.getById(1);
		System.out.println(house.getOwner());
		house.setDescr("修改后");
		house.setCellid("2单元402");
		house.setBdate("80年代");
		house.setShape("落单帝国");
		house.setPopulation(8);
		house.setOwnerphone("110");
		service.updateById(house);
	}
}
