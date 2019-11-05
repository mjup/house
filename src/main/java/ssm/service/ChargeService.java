package ssm.service;

import java.util.List;
import java.util.Map;

import ssm.bean.Charge;
import ssm.bean.Hire;
import ssm.util.Infor;
/*
 *王钢旗
 *2017年4月24日
 */
import ssm.util.Page;
public interface ChargeService {
	public Infor insertBatch(String jsonString);
	public Page<Charge> getPage(String floorid, String month, Page<Charge> page, Integer status);
	public Map<String, Object> getDetailById(Integer id);
	public Map<String, Object> getDetailByMap(Map<String, Object> map);
	public Infor updateStatus(String month, String houseid, String rname, Integer means);
	public Map<String, Object> getDetailForLook(Integer id);
	public List<Map<String, Object>> getCountList(String year);
}
