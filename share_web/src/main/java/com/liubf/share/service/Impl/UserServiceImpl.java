package com.liubf.share.service.Impl;

import java.util.List;
import java.util.UUID;

import com.liubf.share.pojo.*;
import com.liubf.share.utils.JsonUtils;
import com.liubf.share.utils.ShResult;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.liubf.share.mapper.UserMapper;
import com.liubf.share.service.UserService;
import org.springframework.util.DigestUtils;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;


    @Override
    public Object findById(Integer id) {
        return null;
    }

    @Override
    public Object findByUUID(String uuid) {
        return null;
    }

    @Override
    public void deleteById(Integer id) {

    }

    @Override
    public void deleteByUUID(String uuid) {

    }

    @Override
    public void update(Object o) {

    }

    @Override
    public void insert(Object o) {
        User user= (User)o;
        String uuid = UUID.randomUUID().toString();
        user.setUid(uuid);
        userMapper.insert(user);
    }



    @Override
    public User selectusername(String username) {
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
        criteria.andUsernameEqualTo(username);
        List <User> users = userMapper.selectByExample(example);

        return users.get(0);


    }


        @Override
        public ShResult userLogin(String username, String password) {
            // 1、判断用户和密码是否正确
            // 根据用户名查询用户信息
            UserExample example = new UserExample();
            UserExample.Criteria criteria = example.createCriteria();
            criteria.andUsernameEqualTo(username);
            // 执行查询
            List<User> list = userMapper.selectByExample(example);
            if (list == null || list.size() == 0) {
                // 返回登录失败
                return ShResult.build(400, "用户名或密码错误");
            }
            // 取用户信息
            User user = list.get(0);
            // 判断密码是否正确
            if (!password.equals(user.getPassword())) {
                // 2、如果不正确，返回登录失败
                return ShResult.build(400, "用户名或密码错误");
            }else {

            }



        return ShResult.ok(user);
    }


}
