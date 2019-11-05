package ssm.dao;

import java.util.Map;

/*
 *王钢旗
 *2017年4月3日
 */
public interface BaseInterface<T> {
	public void insert(T temp);
	public void delete(Integer[] ids);
	public void update(Map<String, Object> map);
	public T getById(int id);
	public void updateById(T temp);
}
