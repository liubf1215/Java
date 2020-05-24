package com.liubf.share.controller;

import com.liubf.share.pojo.Category;
import com.liubf.share.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * User:liubf
 * Date:2020/4/9
 * Time:19:54
 */
@Controller
@RequestMapping("/category")
public class CategoryController {


    @Autowired
    private CategoryService categoryService;



    @RequestMapping("/findAll")

    public List<Category> findAll(){
        List <Category> all = categoryService.findAll();
        System.out.println(all);

        return  all;
    }




}
