package com.liubf.share.service.base;

import com.liubf.share.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public abstract class BaseServiceImpl<T> implements IBaseService<T> {

    //统一管理dao
    @Autowired
    protected UserMapper userMapper;
}
