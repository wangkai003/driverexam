package com.carshop.dao;

import org.apache.ibatis.annotations.Param;

import com.carshop.model.Admin;

public interface AdminMapper {

	//����Id��ѯ����Ա��Ϣ
	public void getAdminById(Integer id);
	//����һ����¼
	public void insertAdmin(@Param("admin")Admin admin);
	//�����û����������ѯ
	public Admin login(@Param("adminname")String adminname,@Param("password")String password);
}
