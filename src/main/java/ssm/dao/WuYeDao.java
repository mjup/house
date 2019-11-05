package ssm.dao;
import java.util.List;

import ssm.bean.Water;
import ssm.bean.WuYe;
/*
 *王钢旗
 *2017年3月30日
 */
public interface WuYeDao extends BaseInterface<WuYe>{
	public void insertBatch(List<WuYe> list);
}
