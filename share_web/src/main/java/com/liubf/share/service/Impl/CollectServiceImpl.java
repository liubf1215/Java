package com.liubf.share.service.Impl;

import com.liubf.share.mapper.CollectMapper;

import com.liubf.share.mapper.ProductMapper;
import com.liubf.share.mapper.UserMapper;
import com.liubf.share.pojo.*;
import com.liubf.share.service.CollectService;
import com.liubf.share.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * User:liubf
 * Date:2020/4/17
 * Time:16:20
 */
@Service
public class CollectServiceImpl implements CollectService {




    @Autowired
    private UserMapper userMapper;

    @Autowired
    private CollectMapper collectMapper;

    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private  ProductService productService;





    //集合列表


    @Override
    public void insert(String pid, String username) {
        UserExample userExample = new UserExample();
        UserExample.Criteria userExampleCriteria = userExample.createCriteria();
        userExampleCriteria.andUsernameEqualTo(username);
        List <User> userList = userMapper.selectByExample(userExample);
        User user = userList.get(0);
        CollectExample collectExample = new CollectExample();
        CollectExample.Criteria criteria = collectExample.createCriteria();
        criteria.andPidEqualTo(pid);
        criteria.andUidEqualTo(user.getUid());
        List <Collect> collects = collectMapper.selectByExample(collectExample);
        if (collects!=null) {
            String uuid = UUID.randomUUID().toString();
            Collect collect = new Collect();
            collect.setPid(pid);
            collect.setUid(user.getUid());
            collect.setState(1);
            collect.setCollecttime(new Date());
            collect.setCoid(uuid);
            collect.setName(username);
            collectMapper.insert(collect);
            Product product = productService.findProducby(pid);
            product.setCoid(uuid);

            productMapper.updateByPrimaryKey(product);
        }
    }


    /*
       TODO
         查询收藏商品
 */
    @Override
    public List <Product> SelcetByUid(String uid) throws InterruptedException {
        CollectExample collectExample = new CollectExample();
        CollectExample.Criteria criteria = collectExample.createCriteria();
        criteria.andUidEqualTo(uid);
        List <Collect> collects = collectMapper.selectByExample(collectExample);
        //集合列表
        List<Product>  list = new ArrayList <Product>();
        for (Collect collect:collects
             ) {

            Product product = productService.findProducby(collect.getPid());
            if (product!=null) {
                list.add(product);
            }

        }

        return list;
    }



    @Override
    public void CancelCollect(String coid) {
        CollectExample collectExample = new CollectExample();
        CollectExample.Criteria criteria = collectExample.createCriteria();
        criteria.andCoidEqualTo(coid);
        collectMapper.deleteByExample(collectExample);
        //删除商品表中coid
        ProductExample example=new ProductExample();
        ProductExample.Criteria criteria1 = example.createCriteria();
        criteria1.andCoidEqualTo(coid);
        List <Product> list = productMapper.selectByExample(example);
        for (Product product:
             list) {
            product.setCoid(null);
            productMapper.updateByPrimaryKeySelective(product);
        }


    }

    @Override
    public List <Collect> FindAll() {
        CollectExample example = new CollectExample();
        CollectExample.Criteria criteria = example.createCriteria();
        List <Collect> list = collectMapper.selectByExample(example);

        return list;
    }


}
