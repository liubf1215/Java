package com.liubf.share.service;

import java.util.List;

import com.liubf.share.pojo.Category;
import com.liubf.share.pojo.Product;
import com.liubf.share.service.base.IBaseService;

import javax.servlet.http.HttpServletRequest;

public interface ProductService  extends IBaseService<Category>  {





    public List<Product> productList(String cid);

    public List<Product> productAll();

    public List<Category> findcategoryList();

    public Product findProducby(String pid);


    void addProduct(Product product);

    void UpdateProductData(Product product);

    void deleteProduct(String pid, HttpServletRequest request);

    List<Product> productSearch(String pname);

    List<Product> hotProduct();
}
