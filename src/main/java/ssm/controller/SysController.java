package ssm.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.MidiDevice.Info;
import javax.xml.ws.RespectBinding;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.RecoverableDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.HttpServletBean;

import com.sun.prism.paint.Gradient;

import ssm.service.SysService;
import ssm.util.Infor;

/*
 *王钢旗
 *2017年4月25日
 */
@Controller(value="sysController")
@RequestMapping("/admin/sys")
public class SysController {

	@Resource(name="sysService")
	private SysService sysService;
	@RequestMapping("/beifen.do")
	public Infor beifen(HttpServletRequest request,HttpServletResponse response){
		File flag = sysService.beifen(request.getSession().getServletContext().getRealPath("/db"));
		//System.out.println(request.getRealPath("/db"));
		FileInputStream in = null;
		InputStreamReader isr = null;
		BufferedReader br = null;
		PrintWriter writer = null;
		try {
			if(flag.exists()){
				response.setContentType("application/force-download");
				 response.addHeader("Content-Disposition",
				 "attachment;fileName=" + flag.getName());// 设置文件名
				 response.setCharacterEncoding("utf-8");
				in = new FileInputStream(flag);
				isr = new InputStreamReader(in);
				br = new BufferedReader(isr);
				String instr;
				StringBuffer sb = new StringBuffer();
				while ((instr=br.readLine())!=null) {
					sb.append(instr+"\r\n");
				}
				String outStr = sb.toString();
				writer = response.getWriter();
				writer.print(outStr);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			try {
				if(in!=null){
					in.close();
				}
				if(isr!=null){
					isr.close();
				}
				if(br!=null){
					br.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			
		}
		return null;
	}
	@ResponseBody
	@RequestMapping("/recover.do")
	 public Infor  recover(@RequestParam("file") CommonsMultipartFile file,HttpServletRequest request) throws IOException {
       // long  startTime=System.currentTimeMillis();
       //System.out.println("fileName："+file.getOriginalFilename());
		request.setCharacterEncoding("utf-8");
       String path=request.getSession().getServletContext().getRealPath("/db/upload");
       File filePath = new File(path);
       String fileName = file.getOriginalFilename();
       if(!filePath.exists()){
    	   filePath.mkdirs();
       }
       if(!path.endsWith(File.separator)){
    	   path = path+File.separator;
			
		}
       File newFile=new File(path+fileName);
       if(newFile.exists()){
    	   newFile.delete();
       }
       file.transferTo(newFile);
       Infor flag = sysService.atherRecover(newFile);
       return flag; 
   }
	@ResponseBody
	@RequestMapping("/updateIntroduce.do")
	public Infor updateIntroduce(String content){
		Infor flag = sysService.updateIntroduce(content);
		return flag;
	}
	@ResponseBody
	@RequestMapping("/login.do")
	public Infor login(String username,String password){
		Infor flag = sysService.login(username, password);
		return flag;
	}
	@ResponseBody
	@RequestMapping("/updatePwd.do")
	public Infor updatePwd(String pwd){
		Infor flag = sysService.updatePwd(pwd);
		return flag;
	}
	@ResponseBody
	@RequestMapping("/getIntroduce.do")
	public Infor getIntroduce(){
		String introduce = sysService.getIntroduce();
		return new Infor(true, introduce);
	}
}
