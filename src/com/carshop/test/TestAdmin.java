package com.carshop.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.carshop.model.Admin;
import com.carshop.service.AdminService;
import com.carshop.util.MD5Utils;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:spring-config.xml"})
public class TestAdmin {
	
	@Autowired
	private AdminService adminService;
	@Test
	public void testLogin() {
		
		Admin admin = adminService.login("admin", "admin");
		
		System.out.println(admin);
	}
	
	@Test
	public void testRegister() {
		
		Admin admin = new Admin();
		admin.setAdminname("tom");
		admin.setPassword(MD5Utils.md5("123"));
		admin.setEmail("admin@admin.163.com");
		admin.setPhone("8888");
		adminService.insertAdmin(admin);
		
		System.out.println(admin);
	}
}
