package com.liubf.share.service.Impl;

import java.util.List;

import com.liubf.share.mapper.ProductMapper;
import com.liubf.share.pojo.Product;
import com.liubf.share.pojo.ProductExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.liubf.share.mapper.CategoryMapper;
import com.liubf.share.pojo.Category;
import com.liubf.share.pojo.CategoryExample;
import com.liubf.share.service.ProductService;
import com.liubf.share.service.base.BaseServiceImpl;
@Service
@Transactional
public class ProductServiceImpl extends BaseServiceImpl<Category> implements ProductService{

    @Autowired
    private CategoryMapper   categoryMapper;
    @Autowired
    private ProductMapper productMapper;

    public Category findById(Integer id) {
        // TODO Auto-generated method stub
        return null;
    }

    public Category findByUUID(String uuid) {
        // TODO Auto-generated method stub
        return null;
    }

    public void deleteById(Integer id) {
        // TODO Auto-generated method stub

    }

    public void deleteByUUID(String uuid) {
        // TODO Auto-generated method stub

    }

    public void update(Category t) {
        // TODO Auto-generated method stub

    }

    public void insert(Category t) {
        // TODO Auto-generated method stub

    }






    public List<Product> productList(String cid) {
        ProductExample example=new ProductExample();
        ProductExample.Criteria criteria = example.createCriteria();
        criteria.andCidEqualTo(cid);
        return productMapper.selectByExample(example);
    }
    public List<Product> productAll() {
        ProductExample example=new ProductExample();
        ProductExample.Criteria criteria = example.createCriteria();

        return productMapper.selectByExample(example);
    }
    public List<Category> findcategoryList() {
        CategoryExample example=new CategoryExample();
        return categoryMapper.selectByExample(example);
    }
    public Product findProducby(String pid) {

        return productMapper.selectByPrimaryKey(pid);
    }

    @Override
    public void addProduct(Product product) {
         productMapper.insert(product);
    }

    public List<Product> hotProductList() {

        return null;

    }
}
