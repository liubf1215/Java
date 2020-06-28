package com.liubf.share.service;

import com.liubf.share.utils.ShResult;

public interface AdminService {
    ShResult login(String username, String password);
}
