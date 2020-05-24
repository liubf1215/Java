package com.liubf.share.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class AdminController {
	

	

	
    //进入后台首页
	@RequestMapping("/admin")
	public String admin() {
		
		return "admin/index";
	}
	 
	   
		@RequestMapping("/admin/home")
		public String home() {
			
			return "admin/home";
		}
		
		

		


		
}
