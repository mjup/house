package ssm.dao;

import java.util.List;
import java.util.Map;

import ssm.bean.Announce;

/*
 *王钢旗
 *2017年4月25日
 */
public interface AnnounceDao extends BaseInterface<Announce> {
	public List<Announce> getList(Map<String, Object> map);
	public Integer getCount(Map<String, Object> map);
	public Announce getRecent();
}
