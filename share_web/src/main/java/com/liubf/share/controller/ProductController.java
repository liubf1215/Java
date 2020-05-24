package com.liubf.share.controller;

import java.io.*;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.liubf.share.pojo.Category;
import com.liubf.share.service.ProductService;
import com.liubf.share.utils.JsonUtils;
import org.springframework.web.multipart.MultipartFile;

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
        PageHelper.startPage(pn, 8);
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
    @RequestMapping("/add")
    //添加产品
    public  void AddProduct(HttpServletRequest request) throws FileUploadException {
        System.out.println(request.toString());
        try {
    //创建磁盘文件项工厂
    DiskFileItemFactory factory = new DiskFileItemFactory();
    //创建文件上传核心对象
    ServletFileUpload upload = new ServletFileUpload(factory);
    //解析request获得文件项对象集合
            Map <String, List <FileItem>> listMap = upload.parseParameterMap(request);
            System.out.println(listMap);
            List<FileItem> parseRequest = upload.parseRequest(request);
            System.out.println(parseRequest);
    for(FileItem item : parseRequest){
    //判断是否是普通表单项
        boolean formField = item.isFormField();
        //收集数据的容器
        Product product= new Product();
        Map<String,Object> map = new HashMap<String,Object>();
        if(formField){
            //普通表单项 获得表单的数据 封装到Product实体中
            String fieldName = item.getFieldName();

            String   fieldValue = item.getString("UTF-8");


            map.put(fieldName, fieldValue);

        }else{
            //文件上传项 获得文件名称 获得文件的内容
            String fileName = item.getName();

            String path = request.getSession().getServletContext().getRealPath("img");
            System.out.println(path);
            InputStream in = item.getInputStream();
            OutputStream out = new FileOutputStream(path +"/"+fileName);//I:/xxx/xx/xxx/xxx.jpg
            IOUtils.copy(in, out);
            in.close();
            out.close();
            item.delete();

            map.put("pimage", "img/"+fileName);
        }
        System.out.println(map);
        //复制相同属性
        BeanUtils.populate(product, map);
        product.setPid(CommonsUtils.getUUID());
        productService.addProduct(product);
    }

    } catch (Exception e) {
    e.printStackTrace();
     }

    }

        //查出产品信息
    @RequestMapping("/info")
    public String productInfo(String pid,Model model){
        Product  product=productService.findProducby(pid);
        product.setPimage("img/1.JPG");
        model.addAttribute("product",product);

        return "product/productInfo";

    }




}
