package ssm.service;

import java.io.BufferedReader;
import java.io.File;
import java.util.Properties;

import org.springframework.stereotype.Service;

import ssm.util.Infor;

/*
 *王钢旗
 *2017年4月25日
 */

public interface SysService {
	public File beifen(String contextpath);
//	public BufferedReader backup();
	public Infor recover(File file);
	public Infor atherRecover(File file);
	public Infor updateIntroduce(String str);
	public Properties getProperties();
	public Infor login(String username, String password);
	public Infor updatePwd(String pwd);
	public String getIntroduce();
}
