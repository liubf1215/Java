package com.liubf.share.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import com.liubf.share.pojo.Product;
import com.liubf.share.pojo.User;
import com.liubf.share.service.CollectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;


/**
 * User:liubf
 * Date:2020/4/17
 * Time:16:17
 */
@Controller
@RequestMapping("/collect")
public class CollectController {


    @Autowired
    private CollectService collectService;

    @RequestMapping("/addItem")
    public String addItem(String pid, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }
        collectService.insert(pid, user.getUsername());



        return "redirect:/collect/myCollect";
    }



    @RequestMapping("/myCollect")

    public String CollectAll(HttpSession session, Model model,@RequestParam(value = "pn", defaultValue = "1")Integer pn) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        // 页数
        PageHelper.startPage(pn, 8);

        List <Product>  list = null;
        try {
            list = collectService.SelcetByUid(user.getUid());
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        PageInfo page = new PageInfo(list, 8);
        model.addAttribute("pageInfo", page);


        return "collect/collectList";
    }

    @RequestMapping("/cancel")
    public String cancel(String coid) {
        collectService.CancelCollect(coid);
        return "redirect:/collect/myCollect";
    }


}
