package com.liubf.share.controller;


import com.liubf.share.pojo.Admin;
import com.liubf.share.service.AdminService;
import com.liubf.share.utils.ShResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;


@Controller
public class AdminController {


	@Autowired
	private AdminService adminService;
	

	

	
    //进入后台首页
	@RequestMapping("/admin")
	public String admin() {
		
		return "admin/index";
	}
	 
	   
		@RequestMapping("/admin/home")
		public String home(String username, HttpSession session) {
			Admin admin=new Admin();
			admin.setUsername(username);
			session.setAttribute("admin",admin);
			return "admin/home";
		}
	@RequestMapping("/admin/productlist")
	public String Adplist() {

		return "admin/product/list";
	}
	@RequestMapping("/admin/login")
	@ResponseBody
	public ShResult login(String username,String password) {
          ShResult result=adminService.login(username,password);
		return  result;
	}
		
		

		


		
}
