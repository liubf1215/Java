package com.liubf.share.service;

import com.liubf.share.pojo.Category;
import com.liubf.share.service.base.IBaseService;

import java.util.List;

public interface CategoryService {


    List<Category> findAll();


    Category findbyCid(String cid);

    void update(Category category);

    void addCateg(Category category);

    void delete(String cid);
}
