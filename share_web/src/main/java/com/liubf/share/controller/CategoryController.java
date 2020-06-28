package com.liubf.share.controller;

import com.liubf.share.pojo.Category;
import com.liubf.share.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
    @ResponseBody
    public List<Category> findAll(){
        List <Category> all = categoryService.findAll();
        System.out.println(all);

        return  all;
    }
    /*
    编辑分类类名
     */
    @RequestMapping("/add")
    public String add(Category category, HttpServletRequest request){


        categoryService.addCateg(category);



        return "redirect:"+request.getServletContext().getContextPath() +"/admin/category/list.jsp";
    }

    /*
    编辑分类类名
     */
    @RequestMapping("/edit")
    public String edit(String cid, HttpServletRequest request, HttpSession session){
       Category category = categoryService.findbyCid(cid);
       session.setAttribute("category",category);


        return "redirect:"+request.getServletContext().getContextPath() +"/admin/category/edit.jsp";
    }

    /*
    更新分类名称
     */
    @RequestMapping("/update")
    public String update(Category category, HttpServletRequest request, HttpSession session){
        categoryService.update(category);



        return "redirect:"+request.getServletContext().getContextPath() +"/admin/category/list.jsp";
    }

    /*
 更新分类名称
  */
    @RequestMapping("/delete")
    public String update(String cid, HttpServletRequest request){
        categoryService.delete(cid);



        return "redirect:"+request.getServletContext().getContextPath() +"/admin/category/list.jsp";
    }





}
