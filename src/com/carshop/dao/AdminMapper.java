package com.carshop.dao;

import org.apache.ibatis.annotations.Param;

import com.carshop.model.Admin;

public interface AdminMapper {

	//根据Id查询管理员信息
	public void getAdminById(Integer id);
	//增加一条记录
	public void insertAdmin(@Param("admin")Admin admin);
	//根据用户名和密码查询
	public Admin login(@Param("adminname")String adminname,@Param("password")String password);
}
