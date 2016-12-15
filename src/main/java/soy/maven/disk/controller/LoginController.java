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


@Controller
@RequestMapping(value="/login.do")
public class LoginController {
	
	private static Logger logger = Logger.getLogger(LoginController.class);
	

 
	@Resource	 
	 private IUserService iUserService = null;
	
	 
@RequestMapping(value="/regist.do",method = RequestMethod.POST)
public String regist(@RequestParam("username") String username ,@RequestParam("password") String password,@RequestParam("tel") String tel ,@RequestParam("qq") String qq,Model model){ 


    logger.info("hanghangwudi");
    User user =new User(); 	 
    user.setTel(tel);
    user.setQq(qq);
	 user.setUsername(username);
	 user.setPassword(password);
	 iUserService.insert(user);
   
	 return "login";
}
} 
//	@RequestMapping(value="index.do") 
//	 public void index_jsp(Model model){ 
//	  
//	 } 
//    



