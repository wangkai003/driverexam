package com.carshop.service;

import com.carshop.model.Admin;

public interface AdminService {

	// 根据Id查询管理员信息
	public void getAdminById(Integer id);

	// 增加一条记录
	public void insertAdmin(Admin admin);

	// 根据用户名和密码查询
	public Admin login(String adminname, String password);
}
