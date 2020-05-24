package com.liubf.share.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.liubf.share.service.ProductService;
import com.liubf.share.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.liubf.share.pojo.User;


@Controller
public class PageController {

	@Autowired
	private UserService userService;

	

	
    //登录页
	@RequestMapping("/")
	public String showIndex(String username,HttpSession session) {


		if(!"".equals(username)&&username!=null){

			User user = userService.selectusername(username);
			user.setPassword("");
			session.setAttribute("user", user);
			
			
		}
		
		
		return "index";
	}

    @RequestMapping("/login")
	public String loginPages() {
       
		return "user/login";
	}   
    @RequestMapping("/register")
	public String showPages() {
	        
			return "user/register";
	}    
	 //收藏页
	  @RequestMapping("/mycollect")
	  public String myCollect(HttpSession session,HttpServletRequest request){
		    
		    User user = (User) session.getAttribute("user");
	    
	    	if(user!=null){
	    		request.setAttribute("user", user);
	    		return "redirect:collect/colcollectList";
	    	}else{
	            return "redirect:/login";
	    	}
	    }
	
	
	
	     
	  
	  
	  
	
}
