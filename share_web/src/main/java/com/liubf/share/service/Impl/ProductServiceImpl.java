package com.liubf.share.service.Impl;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import com.liubf.share.mapper.ProductMapper;
import com.liubf.share.pojo.Product;
import com.liubf.share.pojo.ProductExample;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.liubf.share.mapper.CategoryMapper;
import com.liubf.share.pojo.Category;
import com.liubf.share.pojo.CategoryExample;
import com.liubf.share.service.ProductService;
import com.liubf.share.service.base.BaseServiceImpl;

import javax.servlet.http.HttpServletRequest;

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
         product.setPid(UUID.randomUUID().toString());
         product.setPdate(new Date());
         product.setPflag(1);
        System.out.println("3423"+product.getIsHot());
         productMapper.insert(product);
    }

    @Override
    public void UpdateProductData(Product product) {
        productMapper.updateByPrimaryKeySelective(product);
    }

    @Override
    public void deleteProduct(String pid, HttpServletRequest request) {
        String realPath = request.getSession().getServletContext().getRealPath("/");
        ProductExample example=new ProductExample();
        ProductExample.Criteria criteria = example.createCriteria();
        criteria.andPidEqualTo(pid);
        List <Product> list = productMapper.selectByExample(example);
        Product product = list.get(0);
        String[] split = product.getPimage().split("/");
        String string="";
        for (String str:split
             ) {
            string+=str+"\\";
        }

        String pimageurl =realPath+string.substring(1, string.length() - 1);

        deleteServerFile(pimageurl);
        productMapper.deleteByPrimaryKey(pid);

    }
    //删除图片
    public static boolean deleteServerFile
    (String filePath){
        boolean delete_flag = false;
        File file = new File(filePath);
        if (file.exists() && file.isFile() && file.delete())
            delete_flag = true;
        else
            delete_flag = false;
        return delete_flag;
    }

    @Override
    public List <Product> productSearch(String pname) {
        ProductExample example=new ProductExample();
        ProductExample.Criteria criteria = example.createCriteria();
        criteria.andPnameLike("%"+pname+"%");
        List <Product> list = productMapper.selectByExample(example);
        return list;
    }

    @Override
    public List <Product> hotProduct() {
        ProductExample example=new ProductExample();
        ProductExample.Criteria criteria = example.createCriteria();
        criteria.andIsHotEqualTo(1);
        List <Product> list = productMapper.selectByExample(example);
        return list;
    }


}
