package com.liubf.share.service;


import com.liubf.share.pojo.Product;

import java.util.List;

public interface CollectService {
    void insert(String pid, String username);



    List <Product> SelcetByUid(String uid) throws InterruptedException;




    void CancelCollect(String coid);
}
