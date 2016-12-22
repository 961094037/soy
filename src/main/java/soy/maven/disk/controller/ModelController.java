package soy.maven.disk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ModelController {
	
	
	@RequestMapping(value="login.do") 
	 public void login_jsp(Model model){ 
	 } 
	@RequestMapping(value="regist.do") 
	 public void regist_jsp(Model model){ 
	 } 
	@RequestMapping(value="upload.do") 
	 public void upload_jsp(Model model){ 
	 } 
	@RequestMapping(value="main.do") 
	 public void main_jsp(Model model){ 
	 } 

}
