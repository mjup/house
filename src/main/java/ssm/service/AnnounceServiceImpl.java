package ssm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssm.bean.Announce;
import ssm.bean.Charge;
import ssm.dao.AnnounceDao;
import ssm.util.Infor;
import ssm.util.Page;

/*
 *王钢旗
 *2017年4月25日
 */
@Service(value="announceService")
public class AnnounceServiceImpl implements AnnounceService {

	@Autowired
	private AnnounceDao announceDao;
	public Infor insert(Announce temp) {
		try {
			announceDao.insert(temp);
			return new Infor(true,"增加成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new Infor(false, "增加失败");
		}
	}

	public Page<Announce> getPage(String startdate, String enddate,
			Page<Announce> page) {
		try {
			page.updateBefore();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", page.getStart());
			map.put("length", page.getPageNumber());
			map.put("startdate", startdate);
			map.put("enddate", enddate);
			List<Announce> list = announceDao.getList(map);
			page.setList(list);
			Integer count =announceDao.getCount(map);
			page.setTotalQuqatity(count);
			page.update();
			return page;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

	public Infor delete(Integer[] ids) {
		try {
			announceDao.delete(ids);
			return new Infor(true, "删除成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new Infor(false, "删除失败");
		}
	}

	public Announce getRecent() {
		try {
			Announce temp = announceDao.getRecent();
			return temp;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
