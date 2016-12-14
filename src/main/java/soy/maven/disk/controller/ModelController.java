package soy.maven.disk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ModelController {
	
	
	@RequestMapping(value="index.do") 
	 public void index_jsp(Model model){ 
	 } 
	@RequestMapping(value="ok.do") 
	 public void ok_jsp(Model model){ 
	 } 
	@RequestMapping(value="error.do") 
	 public void no_jsp(Model model){ 
	 } 
	@RequestMapping(value="upload.do") 
	 public void upload_jsp(Model model){ 
	 } 
	

}
