package ssm.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import org.springframework.stereotype.Service;










import ssm.util.DateUtil;
import ssm.util.Infor;

/*
 *王钢旗
 *2017年4月25日
 */
@Service(value="sysService")
public class SysServiceImpl implements SysService {
	public static String command="mysqldump -h127.0.0.1 -p3306 -uroot -proot --set-charset=utf-8 test";
	public File beifen(String filepath) {
		String fileName = new Date().getTime()+".sql";
		File saveFilePath = new File(filepath);
		if(!saveFilePath.exists()){
			saveFilePath.mkdirs();
		}
		if(!filepath.endsWith(File.separator)){
			filepath = filepath+File.separator;
			
		}
		System.out.println(File.separator);
		Runtime rt = Runtime.getRuntime();
        try {
        	Process child = rt.exec(command);
        	InputStream in = child.getInputStream();
			InputStreamReader input = new InputStreamReader(in,"utf-8");
			String inStr;
			StringBuffer sb = new StringBuffer("");
			String outStr;
			BufferedReader br = new BufferedReader(input);
			while ((inStr = br.readLine()) != null) {     
				sb.append(inStr + "\r\n");     
			 }     
			outStr = sb.toString(); 
			FileOutputStream fout = new FileOutputStream(filepath+fileName);
			OutputStreamWriter writer = new OutputStreamWriter(fout, "utf-8");    
			writer.write(outStr);
			 writer.flush();   
			in.close();     
			input.close();     
			br.close();     
			writer.close();     
			fout.close();   
			return new File(filepath+fileName);
		 } catch (IOException e) {
		    e.printStackTrace();
		    return null;
		  }
	}
	public Infor recover(File file) {
		Runtime runtime = Runtime.getRuntime();
		//OutputStream out = null;
		OutputStreamWriter writer = null;
		InputStream in = null;
		InputStreamReader reader = null;
		BufferedReader bf = null;
		try {
			Process process = runtime.exec("mysql -uroot -proot -h127.0.0.1 --set-charset=utf-8 test");
			String inStr = null;
			StringBuffer sb = new StringBuffer();
			in = new FileInputStream(file);
			reader = new InputStreamReader(in);
			bf = new BufferedReader(reader);
			while ((inStr=bf.readLine())!=null) {
				sb.append(inStr);
			}
			String outStr = sb.toString();
			System.out.println("执行到这里"+outStr);
			
			writer = new OutputStreamWriter(process.getOutputStream(),"utf-8");
			writer.write(outStr);
			writer.flush();
			bf.close();
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
			return new Infor(false, "失败");
		}
		return new Infor(true, "成功");
	}
	public Infor atherRecover(File file) {
		try {
			Runtime runtime = Runtime.getRuntime();
			System.out.println("开始还原"+file.getAbsolutePath());
			Process process = runtime.exec("cmd /c mysql -uroot -proot -h127.0.0.1  shop<"+file.getAbsolutePath());
			Integer flag = process.waitFor();
			if(flag == 0){
			//System.out.println("还原成功");
				return new Infor(true, "还原成功");
			}else{
				//System.out.println("还原失败");
				return new Infor(false, "还原失败");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return new Infor(false, "还原失败");
		}
		//return null;
	}
	public Properties getProperties(){
		Properties map = new Properties();
		InputStreamReader in;
		try {
			in = new InputStreamReader(this.getClass().getResourceAsStream("/information.properties"),"utf-8");
			map.load(in);
			return map;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	public Infor updateIntroduce(String str){
		Properties temp = this.getProperties();
		temp.setProperty("introduce", str);
		OutputStream fout = null;
		try {
//			System.out.println("开始");
//			System.out.println(this.getClass().getResource("/information.properties").getPath());
//			System.out.println("结束");
			fout = new FileOutputStream(this.getClass().getResource("/information.properties").getPath());
			temp.store(fout, "update introduce value");
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return new Infor(false, "更新失败");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return new Infor(false, "更新失败");
		}
		
		return new Infor(true, "更新成功");
	}
	public Infor login(String username, String password) {
		Properties temp = this.getProperties();
		String user = temp.getProperty("username");
		String pwd = temp.getProperty("pwd");
		if(user.equals(username)&&pwd.equals(password)){
			return new Infor(true, "登录成功");
		}else{
			return new Infor(false, "登录失败");
		}
	}
	public Infor updatePwd(String pwd) {
		Properties temp = this.getProperties();
		temp.setProperty("pwd", pwd);
		OutputStream fout = null;
		try {
			fout = new FileOutputStream(this.getClass().getResource("/information.properties").getPath());
			temp.store(fout, "update pwd value"+DateUtil.getDay());
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return new Infor(false, "更新失败");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return new Infor(false, "更新失败");
		}
		
		return new Infor(true, "更新成功"+temp.getProperty("pwd"));
	}
	public String getIntroduce() {
		String introduce = this.getProperties().getProperty("introduce");
		return introduce;
	}
}
