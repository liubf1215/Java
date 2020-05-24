package com.liubf.share.service;

import java.util.List;

import com.liubf.share.pojo.Category;
import com.liubf.share.pojo.Product;
import com.liubf.share.service.base.IBaseService;

public interface ProductService  extends IBaseService<Category>  {



    List<Product> hotProductList ();

    public List<Product> productList(String cid);

    public List<Product> productAll();

    public List<Category> findcategoryList();

    public Product findProducby(String pid);


    void addProduct(Product product);
}
