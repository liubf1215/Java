package com.liubf.share.service;


import com.liubf.share.pojo.User;
import com.liubf.share.service.base.IBaseService;
import com.liubf.share.utils.ShResult;


public interface UserService extends IBaseService {


    User selectusername(String username);


    ShResult userLogin(String username, String password);


}
