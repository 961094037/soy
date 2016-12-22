package soy.maven.disk.controller;

import javax.annotation.Resource;
import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonObject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.View;

import org.apache.log4j.Logger;
import org.omg.CORBA.PRIVATE_MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import soy.maven.disk.TestMyBatis;
import soy.maven.disk.pojo.User;
import soy.maven.disk.service.IUserService;


@Controller
@RequestMapping(value="/login.do")
public class LoginController {
	
	private static Logger logger = Logger.getLogger(LoginController.class);
	

 
	@Resource	 
	 private IUserService iUserService = null;
	
	 
@RequestMapping(value="/regist.do",method = RequestMethod.POST)
public String regist(@RequestParam("username") String username ,@RequestParam("password") String password,@RequestParam("tel") String tel ,@RequestParam("qq") String qq,Model model){ 

     
   
     User user =new User(); 	 
     user.setTel(tel);
     user.setQq(qq);
	 user.setUsername(username);
	 user.setPassword(password);
	 iUserService.insert(user);
	 logger.info(username);
     
	 model.addAttribute("username",username);
	 
	 
	 return "login";
}

@ResponseBody
@RequestMapping(value="/checkUserName.do",method = RequestMethod.POST)
public String checkUserName(HttpServletRequest request){
	String userName = (String)request.getParameter("username");

	int num = iUserService.getUserNumByName(userName);
	String msg = "true";
	if(num>0){
		msg = "false";
	}
	if(userName.trim().isEmpty()){
		msg = "null";
	}

    return msg;
  }

@ResponseBody
@RequestMapping(value="/check.do",method = RequestMethod.POST)
public String LoginController(HttpServletRequest request){
	String userName = (String)request.getParameter("username");
	String passWord = (String)request.getParameter("password");
	System.out.println(userName);
	System.out.println(passWord);
	int num=iUserService.getUserNumByName(userName);
	String message = ""; 
	if(num==0){
		message ="failed";
	}
	else
	{
		String password2 = iUserService.selectPasswordByName(userName);
		if(password2.equals(passWord)){
			message = "success";
			
			int userid=iUserService.selectIdByUserName(userName);
			request.getSession().setAttribute("username",userName);
			request.getSession().setAttribute("userid",userid);
		
		
		}else{
			message = "failed";
		}
	}
	

    
	return message;
}
} 

