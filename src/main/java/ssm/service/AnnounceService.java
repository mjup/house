package ssm.service;

import ssm.bean.Announce;
import ssm.util.Infor;
/*
 *王钢旗
 *2017年4月25日
 */
import ssm.util.Page;
public interface AnnounceService {
	public Infor insert(Announce temp);
	public Page<Announce> getPage(String startdate, String enddate, Page<Announce> page);
	public Infor delete(Integer[] ids);
	public Announce getRecent();
}
