package com.liubf.share.service.Impl;

import com.liubf.share.mapper.AdminMapper;
import com.liubf.share.pojo.Admin;
import com.liubf.share.pojo.AdminExample;
import com.liubf.share.service.AdminService;
import com.liubf.share.utils.ShResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * User:liubf
 * Date:2020/6/27
 * Time:17:34
 */
@Service
@Transactional
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;


    @Override
    public ShResult login(String username, String password) {
        AdminExample example=new AdminExample();
        AdminExample.Criteria criteria = example.createCriteria();
        criteria.andUsernameEqualTo(username);
        List <Admin> list = adminMapper.selectByExample(example);
        if (list == null || list.size() == 0) {
            // 返回登录失败
            return ShResult.build(400, "用户名或密码错误");
        }
        Admin admin = list.get(0);
        if (!password.equals(admin.getPassword())){
            // 2、如果不正确，返回登录失败
            return ShResult.build(400, "用户名或密码错误");
        }
        admin.setPassword("");
        return ShResult.ok(admin);
    }
}
