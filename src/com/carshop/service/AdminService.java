package com.carshop.service;

import com.carshop.model.Admin;

public interface AdminService {

	// ����Id��ѯ����Ա��Ϣ
	public void getAdminById(Integer id);

	// ����һ����¼
	public void insertAdmin(Admin admin);

	// �����û����������ѯ
	public Admin login(String adminname, String password);
}
