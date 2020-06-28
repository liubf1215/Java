package com.liubf.share.service.Impl;

import com.liubf.share.mapper.CategoryMapper;
import com.liubf.share.pojo.Category;
import com.liubf.share.pojo.CategoryExample;
import com.liubf.share.service.CategoryService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

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

    @Override
    public Category findbyCid(String cid) {
        CategoryExample example=new CategoryExample();
        CategoryExample.Criteria criteria = example.createCriteria();
        criteria.andCidEqualTo(cid);
        List <Category> categories = categoryMapper.selectByExample(example);
        return categories.get(0);
    }

    @Override
    public void update(Category category) {
        CategoryExample example=new CategoryExample();
        CategoryExample.Criteria criteria = example.createCriteria();
        criteria.andCidEqualTo(category.getCid());
        categoryMapper.updateByExample(category,example);
    }

    @Override
    public void addCateg(Category category) {
        String cid = UUID.randomUUID().toString();
        category.setCid(cid);
        categoryMapper.insert(category);

    }

    @Override
    public void delete(String cid) {
        CategoryExample example=new CategoryExample();
        CategoryExample.Criteria criteria = example.createCriteria();
        criteria.andCidEqualTo(cid);
        categoryMapper.deleteByExample(example);
    }
}
