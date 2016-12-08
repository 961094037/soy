package soy.maven.disk.controller;

import javax.annotation.Resource;
import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonObject;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.omg.CORBA.PRIVATE_MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import soy.maven.disk.TestMyBatis;
import soy.maven.disk.pojo.User;
import soy.maven.disk.service.IUserService;

@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
@Controller
public class GeneralController {
	
	private static Logger logger = Logger.getLogger(GeneralController.class);
	
	@RequestMapping(value="index.do") 
	 public void index_jsp(Model model){ 
	 } 
	@RequestMapping(value="ok.do") 
	 public void ok_jsp(Model model){ 
	 } 
	@RequestMapping(value="error.do") 
	 public void no_jsp(Model model){ 
	 } 
     
	@Resource	 
	 private IUserService iUserService = null;
	
	 @RequestMapping(value="/index.do", method = RequestMethod.POST) 
	 public String index_jsp(@RequestParam("username") String username ,@RequestParam("password") String password,Model model){ 
	
	 
	 User user = iUserService.getUserById(1);
	 User user2 =new User();
	 	 
	 if(username.equals(password))
	 {
		 
		
		 user2.setUserName(username);
		 user2.setPassword(password);
		 iUserService.insert(user2);
		 model.addAttribute("username", username); 
		 return "ok";
	 }
	 else
	 {
		 return "error";
	 }
	 } 
    
//	@RequestMapping(value="index.do") 
//	 public void index_jsp(Model model){ 
//	  
//	 } 
//    

}
