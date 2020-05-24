package com.liubf.share.controller;

import com.liubf.share.pojo.User;
import com.liubf.share.service.UserService;
import com.liubf.share.utils.ShResult;
import org.apache.ibatis.annotations.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;


/**
 * User:liubf
 * Date:2020/4/13
 * Time:19:28
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;


    /*
      用户登录
     */
    @RequestMapping("/register")
    public  void  register(User user){

          userService.insert(user);
    }
    /*
      用户名校验
     */
    @RequestMapping("/username")
    public  void  findusername(String username){

        userService.selectusername(username);
    }
    /*
    用户登录
     */

    @RequestMapping("/login")
    @ResponseBody
    public ShResult login(
            String username, String password
            ){
        ShResult ShResult = userService.userLogin(username, password);





        return ShResult;
    }
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute("user");

        return "redirect:/";
    }
}
