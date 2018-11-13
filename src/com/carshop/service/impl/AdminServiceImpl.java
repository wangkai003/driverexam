package com.carshop.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carshop.dao.AdminMapper;
import com.carshop.model.Admin;
import com.carshop.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminMapper adminMapper;
	@Override
	public void getAdminById(Integer id) {
		adminMapper.getAdminById(id);
	}

	@Override
	public void insertAdmin(Admin admin) {
		adminMapper.insertAdmin(admin);
	}

	@Override
	public Admin login(String adminname, String password) {
		
		return adminMapper.login(adminname, password);
	}

}
