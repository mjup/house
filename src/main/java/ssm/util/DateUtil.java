package ssm.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/*
 *王钢旗
 *2017年4月12日
 */
public class DateUtil {
	public static String getFormateDate(){
		Date temp = new Date();
		String formateDate = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(temp);
		return formateDate;
	}
	public static String getDay(){
		Date temp = new Date();
		String day = new SimpleDateFormat("yyyy-MM-dd").format(temp);
		return day;
	}
	public static Date getDate(String str){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		Date date = null;
		try {
			date = sdf.parse(str);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return date;
	}
}
