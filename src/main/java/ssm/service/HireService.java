package ssm.service;

import java.util.Map;

import ssm.bean.Hire;
import ssm.bean.House;
import ssm.util.Page;

/*
 *王钢旗
 *2017年4月19日
 */
public interface HireService {
	public Boolean insert(Hire temp);
	public Map<String, Object> getById(Integer id);
	public Map<String, Object> getRelet(Integer id);
	public Boolean update(Hire temp);
	public Page<Hire> getPage(Hire hire, Page<Hire> page);
	public Boolean delete(Integer[] ids);
}
