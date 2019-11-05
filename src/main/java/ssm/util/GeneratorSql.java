package ssm.util;

import java.lang.reflect.Field;

/*
 *王钢旗
 *2017年4月18日
 */
public class GeneratorSql {
	private Field[] fields;
	private StringBuilder sb;
	public GeneratorSql(Class<?> clazz) {
		// TODO Auto-generated constructor stub
		fields=clazz.getDeclaredFields();
		sb = new StringBuilder();
	}
	public void generatorFiled(){
		//Field[] fields = 
		
		try {
			for (Field field : fields) {
				sb.append(field.getName()+",");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		System.out.println(sb.toString());
		sb.setLength(0);
	}
	public void generatorUpdate(){
		try {
			for (Field field : fields) {
				sb.append(field.getName()+"=#{"+field.getName()+"},");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		System.out.println(sb.toString());
		sb.setLength(0);
	}
	public void generatorVariable(){
		try {
			for (Field field : fields) {
				sb.append("#{"+field.getName()+"},");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		System.out.println(sb.toString());
		sb.setLength(0);
	}
	public void list(){
		System.out.println("-------------start----------");
		generatorFiled();
		System.out.println("--------------");
		generatorUpdate();
		System.out.println("--------------");
		generatorVariable();
		System.out.println("------------end---------");
	}
}
