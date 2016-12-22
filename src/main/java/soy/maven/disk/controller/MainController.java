package soy.maven.disk.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.json.Json;
import javax.persistence.Subgraph;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.mysql.fabric.xmlrpc.base.Array;

import soy.maven.disk.service.IFileService;
import soy.maven.disk.service.IUserService;
import soy.maven.disk.util.FileUtil;

@Controller
@RequestMapping(value="/main.do")
public class MainController {
	
	
	private static Logger logger = Logger.getLogger(MainController.class);
	
	@Resource
	private IFileService IFileService =null;
	

	@ResponseBody
	@RequestMapping(value="/uploadfile.do",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	public String uploadFile(@RequestParam("pic")CommonsMultipartFile pic,HttpServletRequest req,HttpServletResponse response) throws IOException{
		//@RequestBody JSONObject jsonObj,
		//设置文件保存的本地路径
	//	String filePath =req.getSession().getServletContext().getRealPath("/")+"uploadfile/";
	//	int filesize =jsonObj.getIntValue("filesize");
		String filePath ="E:/diskfile/";
	
	    
	    //文件名
		String fileName = pic.getOriginalFilename();
	
		
		
		//文件大小单位B
		String filesize;
		long filesizelong= pic.getSize();
		if(filesizelong>1024)
		{
			filesizelong/=1024;
			if(filesizelong>1024){
				filesizelong/=1024;
				filesize=String.valueOf(filesizelong)+"MB";
			}
			else{
				filesize=String.valueOf(filesizelong)+"KB";
			}
		}
		else
		{
			filesize=String.valueOf(filesizelong)+"B";
		}
	
		logger.info(filesize);

		String fileType = fileName.split("[.]")[1];

		//为了避免文件名重复，在文件名前加UUID

		String uuid = UUID.randomUUID().toString().replace("-","");

		String uuidFileName = uuid + fileName;

		File f = new File(filePath+"/"+uuid+"."+fileType);
        
		//文件存储数据库url
		String  fileurl = filePath + uuidFileName;
		logger.info(fileurl);
		
		//用户id
		int  userid=(int)req.getSession().getAttribute("userid");
		
		//将上传数据存入数据库
	    soy.maven.disk.pojo.File file =new soy.maven.disk.pojo.File();
	    
	    file.setFilename(fileName);
	    file.setFilesize(filesize);
	    file.setFileurl(fileurl);
	    file.setUserid(userid);
	    IFileService.insert(file);
		
		
		
		//将文件保存到服务器
		FileUtil.upFile(pic.getInputStream(), uuidFileName, filePath);
       
		return uuidFileName;
	}
	
    @ResponseBody
	@RequestMapping(value="/init.do",method = RequestMethod.POST)
	public List<soy.maven.disk.pojo.File> init(HttpServletRequest req){

	

		List<soy.maven.disk.pojo.File> list =new ArrayList<soy.maven.disk.pojo.File>();
		
		//用户id
		int  userid=(int)req.getSession().getAttribute("userid");
		
		list.addAll(IFileService.getInfoById(userid));
	
		
	
		return  list;
	}
	
    @ResponseBody
	@RequestMapping(value="/donwload.do",method = RequestMethod.POST)
	public void donwload(@RequestParam("filename")String filename, HttpServletRequest req,HttpServletResponse response) throws IOException{
		
		logger.info(filename);
		
		
		//用户id
		int  userid=(int)req.getSession().getAttribute("userid");
		String fileurl =IFileService.getfileurl(userid,filename);
		logger.info(fileurl);
		
	    response.addHeader("pragma","NO-cache");
	    response.addHeader("Cache-Control","no-cache");
	    response.addDateHeader("Expries",0);
	    response.setContentType("application/vnd.ms-excel;charset=utf-8");
//	try {filename = new String(filename.getBytes("UTF-8"), "ISO8859_1");}catch (Exception e) {e.printStackTrace();}
	    response.addHeader("Content-Disposition","attachment;filename=" + filename);
	    
	    InputStream is = null;
	    OutputStream out = null;
	    
	//    BufferedInputStream bis = null;
	//    BufferedOutputStream bos = null;
	    
	    File f = new File(fileurl);
	    
	try{
	    is = new FileInputStream(f);
	    
	//    bis=new BufferedInputStream(is);
	    
	//    out=new BufferedOutputStream(bos);
	    
	    out = response.getOutputStream();
	    int length = 0;
	    byte buffer[] = new byte[1024];
	    while((length = is.read(buffer)) != -1){
	    out.write(buffer, 0, length);
	    }
	    } catch (Exception e) {
	    e.printStackTrace();
	    } finally{
	//close....
	    }
		
		
	}
    
    @ResponseBody
    @RequestMapping(value="/del.do",method = RequestMethod.POST)
    public String delete(@RequestParam("filename")String filename,HttpServletRequest req,HttpServletResponse response)throws IOException
    {
    	logger.info(filename);
    	int  userid=(int)req.getSession().getAttribute("userid");
    	if(IFileService.deletebyfilename(userid,filename)!=0)
    	{
    		logger.info("删除成功");
    		return "删除成功";
    	}
    	else
    	{
    		return "删除失败";
    	}
    	
    }
    
    @ResponseBody
    @RequestMapping(value="/leave.do",method=RequestMethod.POST)
    public String leave(HttpServletRequest request)throws IOException
    {
 
    	request.getSession().invalidate();
    	return "OK";
    }
    
    @ResponseBody
	@RequestMapping(value="/init_img.do",method = RequestMethod.POST)
	public List<soy.maven.disk.pojo.File> init_img(HttpServletRequest req){



		List<soy.maven.disk.pojo.File> list =new ArrayList<soy.maven.disk.pojo.File>();
		List<soy.maven.disk.pojo.File> list2 =new ArrayList<soy.maven.disk.pojo.File>();
		
		//用户id
		int  userid=(int)req.getSession().getAttribute("userid");
		
		list.addAll(IFileService.getInfoById(userid));
	
		for (int i = 0; i < list.size(); i++) {
			String filename =list.get(i).getFilename();
			String postfix = filename.substring(filename.length()-3);
           
		    if(postfix.equals("bmp")||postfix.equals("png")||postfix.equals("jpg")||postfix.equals("gif"))
		    {
		    	list2.add(list.get(i));
		    }
		}
		
	
		return  list2;
	}
    @ResponseBody
	@RequestMapping(value="/init_audio.do",method = RequestMethod.POST)
	public List<soy.maven.disk.pojo.File> init_audio(HttpServletRequest req){

	

		List<soy.maven.disk.pojo.File> list =new ArrayList<soy.maven.disk.pojo.File>();
		List<soy.maven.disk.pojo.File> list2 =new ArrayList<soy.maven.disk.pojo.File>();
		
		//用户id
		int  userid=(int)req.getSession().getAttribute("userid");
		
		list.addAll(IFileService.getInfoById(userid));
	
		for (int i = 0; i < list.size(); i++) {
			String filename =list.get(i).getFilename();
			String postfix = filename.substring(filename.length()-3);
			
			if(postfix.equals("wmv")||postfix.equals("avi")||postfix.equals("3gp")||postfix.equals("mp4")||postfix.equals("mpg")||postfix.equals("ifo"))
		    {
		    	list2.add(list.get(i));
		    }
			
		}
	
		return  list2;
	}
    @ResponseBody
	@RequestMapping(value="/init_bgm.do",method = RequestMethod.POST)
	public List<soy.maven.disk.pojo.File> init_bgm(HttpServletRequest req){



		List<soy.maven.disk.pojo.File> list =new ArrayList<soy.maven.disk.pojo.File>();
		List<soy.maven.disk.pojo.File> list2 =new ArrayList<soy.maven.disk.pojo.File>();
		
		//用户id
		int  userid=(int)req.getSession().getAttribute("userid");
		
		list.addAll(IFileService.getInfoById(userid));
	
		for (int i = 0; i < list.size(); i++) {
			String filename =list.get(i).getFilename();
			String postfix = filename.substring(filename.length()-3);
			
			if(postfix.equals("mp3")||postfix.equals("wam")||postfix.equals("wma")||postfix.equals("mid"))
		    {
		    	list2.add(list.get(i));
		    }
		}
	
		return  list2;
	}
    @ResponseBody
	@RequestMapping(value="/init_other.do",method = RequestMethod.POST)
	public List<soy.maven.disk.pojo.File> init_other(HttpServletRequest req){

	

		List<soy.maven.disk.pojo.File> list =new ArrayList<soy.maven.disk.pojo.File>();
		List<soy.maven.disk.pojo.File> list2 =new ArrayList<soy.maven.disk.pojo.File>();
		
		//用户id
		int  userid=(int)req.getSession().getAttribute("userid");
		
		list.addAll(IFileService.getInfoById(userid));
	
		for (int i = 0; i < list.size(); i++) {
			String filename =list.get(i).getFilename();
			String postfix = filename.substring(filename.length()-3);
			
			if(postfix.equals("bmp")||postfix.equals("png")||postfix.equals("jpg")||postfix.equals("gif"))
			{
				continue;
			}
            else {
            	if (postfix.equals("wmv")||postfix.equals("avi")||postfix.equals("3gp")||postfix.equals("mp4")||postfix.equals("mpg")||postfix.equals("ifo"))
            	{
            		continue;
            	}
            	else if(postfix.equals("mp3")||postfix.equals("wam")||postfix.equals("wma")||postfix.equals("mid")){
                	continue;
                }
            	else {
            		list2.add(list.get(i));
				}
            }    
		}
		
	
		return  list2;
	}
    
    
    
    
    
    
    
}
