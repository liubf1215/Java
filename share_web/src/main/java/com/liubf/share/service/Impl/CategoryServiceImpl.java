package com.liubf.share.service.Impl;

import com.liubf.share.mapper.CategoryMapper;
import com.liubf.share.pojo.Category;
import com.liubf.share.pojo.CategoryExample;
import com.liubf.share.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * User:liubf
 * Date:2020/4/9
 * Time:19:46
 */
@Service
public class CategoryServiceImpl implements CategoryService  {

   @Autowired
   private  CategoryMapper categoryMapper;


    @Override
    public List<Category> findAll() {
        CategoryExample example = new CategoryExample();


        List <Category> list = categoryMapper.selectByExample(example);

        return list;
    }
}
