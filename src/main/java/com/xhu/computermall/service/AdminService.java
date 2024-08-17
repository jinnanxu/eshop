package com.xhu.computermall.service;

import com.xhu.computermall.dao.model.Admin;

public interface AdminService {

	Admin findAdmin(String userName, String pwd);
}
