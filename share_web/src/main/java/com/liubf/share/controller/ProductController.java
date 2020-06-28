package com.liubf.share.controller;

import java.io.*;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.liubf.share.pojo.Product;
import com.liubf.share.utils.CommonsUtils;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.liubf.share.pojo.Category;
import com.liubf.share.service.ProductService;
import com.liubf.share.utils.JsonUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
//商品web层
@RequestMapping("/product")
public class ProductController {


    @Autowired
    private ProductService productService;

    //查出产品分类
    @RequestMapping("/categoryList")
    @ResponseBody
    public String categoryList(HttpServletResponse  response){
        List<Category> categoryList=productService.findcategoryList();

        String list = JsonUtils.objectToJson(categoryList);
        response.setContentType("text/html;charset=utf-8");

        response.setHeader("Cache-Control", "no-cache");

        PrintWriter out = null;  //输出中文，这一句一定要放到response.setContentType("text/html;charset=utf-8"),  response.setHeader("Cache-Control", "no-cache")后面，否则中文返回到页面是乱码
        try {
            out = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }

        out.print(list.toString());

        out.flush();

        out.close();
        return list;

    }


    @RequestMapping("/list")
    //根据分类查出所有产品
    public String productList(@RequestParam(value = "pn", defaultValue = "1")Integer pn,
                              @RequestParam(value = "cid", defaultValue ="1")String  cid,Model model){

        // 页数
        PageHelper.startPage(pn, 12);
        // startPage
        List<Product> list=productService.productList(cid);

        PageInfo page = new PageInfo(list, 8);
        model.addAttribute("pageInfo", page);
        model.addAttribute("cid", cid);

        return "product/productList";

    }
    @RequestMapping("/all")
    @ResponseBody
    //查出所有产品
    public  List <Product> productAll(){
        List <Product> list = productService.productAll();


        return list;

    }

    /**
     * 图片上传
     * @param pimage
     * @param request
     * @return
     */
    @RequestMapping(value="/upload_pimage",method= RequestMethod.POST)
    @ResponseBody
    public Map<String, String> uploadpimage(MultipartFile pimage,HttpServletRequest request){
        Map<String, String> ret = new HashMap<String, String>();
        if(pimage == null){
            ret.put("type", "error");
            ret.put("msg", "图片不存在");
            return ret;
        }
        if(pimage.getSize() > 1024*1024*1024){
            ret.put("type", "error");
            ret.put("msg", "图片太大");
            return ret;
        }
        //图片上传
        String suffix =pimage .getOriginalFilename().substring(pimage.getOriginalFilename().lastIndexOf(".")+1,pimage.getOriginalFilename().length());
        if(!"jpg,jpeg,gif,png".toUpperCase().contains(suffix.toUpperCase())){
            ret.put("type", "error");
            ret.put("msg", "不是jpg,jpeg,gif,png格式");
            return ret;
        }
        String savePath = request.getServletContext().getRealPath("/") + "img/";
        File savePathFile = new File(savePath);
        if(!savePathFile.exists()){
            //如果不存在
            savePathFile.mkdir();
        }
        String filename = new Date().getTime()+"."+suffix;
        try {

            //上传
            pimage.transferTo(new File(savePath+filename));
        }catch (Exception e) {
            // TODO Auto-generated catch block
            ret.put("type", "error");
            ret.put("msg", "出错");
            e.printStackTrace();
            return ret;
        }
        ret.put("type", "success");
        ret.put("msg", "成功");
        ret.put("filepath",request.getServletContext().getContextPath() + "/img/" + filename );
        return ret;
    }

    @RequestMapping("/add")
    //添加产品
    public String AddProduct(Product product,HttpServletRequest request){



        productService.addProduct(product);


        return "redirect:"+request.getServletContext().getContextPath() +"/admin/productlist";


    }
    @RequestMapping("/update")
    //更新产品
    public String UpdateProduct(String pid,Model model){


        Product product = productService.findProducby(pid);


        model.addAttribute("product",product);
        return "/admin/product/edit";


    }
    @RequestMapping("/updateData")
    //修改产品
    public String UpdateProductData(Product product,HttpServletRequest request){

        productService.UpdateProductData(product);


        return "redirect:"+request.getServletContext().getContextPath() +"/admin/productlist";


    }
    @RequestMapping("/delete")
    //删除产品
    public String deleteProduct(String pid,HttpServletRequest request){



        productService.deleteProduct(pid,request);


        return "redirect:"+request.getServletContext().getContextPath() +"/admin/productlist";


    }





        //查出产品信息
    @RequestMapping("/info")
    public String productInfo(String pid,Model model){
        Product  product=productService.findProducby(pid);

        model.addAttribute("product",product);

        return "product/productInfo";

    }
    //查出产品信息
    @RequestMapping("/search")
    @ResponseBody
    public  List<Product> productSearch(String pname,Model model){

       List<Product> list=productService.productSearch(pname);


        return list;

    }
    //查出产品信息
    @RequestMapping("/hot")
    @ResponseBody
    public  List<Product> hotProduct( Model model){

        List<Product> list=productService.hotProduct();
        PageInfo page = new PageInfo(list, 8);
        model.addAttribute("pageInfo", page);

        return list;

    }





}
