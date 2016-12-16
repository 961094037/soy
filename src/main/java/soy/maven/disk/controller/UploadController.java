package soy.maven.disk.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.alibaba.fastjson.JSONObject;

import soy.maven.disk.service.IFileService;
import soy.maven.disk.util.FileUtil;

@Controller
@RequestMapping(value="/upload.do")
public class UploadController {
	
	
	private static Logger logger = Logger.getLogger(UploadController.class);
	
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
	    logger.info(filePath);
	    
	    //文件名
		String fileName = pic.getOriginalFilename();
		logger.info(fileName);
		
		
		//文件大小单位B
		long filesizelong= pic.getSize();
		double filesize=(double)filesizelong;
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
		int  userid=1;
		
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
	
	
	
}
