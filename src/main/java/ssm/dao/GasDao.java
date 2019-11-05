package ssm.dao;
import java.util.List;
import java.util.Map;

import ssm.bean.Gas;
import ssm.bean.Water;
/*
 *王钢旗
 *2017年3月30日
 */
public interface GasDao extends BaseInterface<Gas>{
	public void insertBatch(Map<String, Object> map);
	public String check(Map<String, Object> map);
}
