package com.xhu.computermall.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xhu.computermall.dao.mapper.AdminMapper;
import com.xhu.computermall.dao.model.Admin;
import com.xhu.computermall.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper adminMapper;

	@Override
	public Admin findAdmin(String userName, String pwd) {
		Admin record = new Admin();
		record.setPhone(userName);
		record.setPwd(pwd);
		List<Admin> list = adminMapper.select(record );
		if(list != null && list.size()>0) {
			return list.get(0);
		}
		return null;
	}

}
