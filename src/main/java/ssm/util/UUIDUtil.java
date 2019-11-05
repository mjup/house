package ssm.util;

import java.util.UUID;

/*
 *王钢旗
 *2017年4月20日
 */
public class UUIDUtil {
	public static String getId(){
		String uuid = UUID.randomUUID().toString().trim().replaceAll("-", "");
        return uuid;
	}
}
