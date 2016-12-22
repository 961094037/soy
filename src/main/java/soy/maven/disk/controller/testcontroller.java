package soy.maven.disk.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;

import soy.maven.disk.service.IFileService;

@Controller
public class testcontroller {
	
private static Logger logger = Logger.getLogger(testcontroller.class);
	
	@Resource
	private IFileService IFileService =null;
	
	
	@ResponseBody
	@RequestMapping(value="/66upload.do")
	public List<soy.maven.disk.pojo.File> init(){
		
		
	//	Map<String, Object> map = new HashMap<>();
	//	ModelAndView mav =new ModelAndView();


	//	private ArrayList<Integer> list =new ArrayList<Integer>();
		//用户id
		logger.info("666");
	//	map.put("666", IFileService.getInfoById(1));
        
     
		List<soy.maven.disk.pojo.File> list =new ArrayList<soy.maven.disk.pojo.File>();
		list.addAll(IFileService.getInfoById(1));
	//	String json = JSON.toJSONString(map);
	//	soy.maven.disk.pojo.File file =IFileService.getInfoById(1);
		for (int i = 0; i < list.size(); i++) {
		    logger.info(JSON.toJSONString(list.get(i)));
		}
	//	logger.info(JSON.toJSONString(file));
	//	logger.info(json);
	
		return  list;
	}
	

}
