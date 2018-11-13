package com.carshop.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.carshop.model.User;
import com.carshop.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:spring-config.xml"})
public class TestUser {

	
	@Autowired
	private UserService userService;
	@Test
	public void testlogin() {
		
		User user = userService.login("Tom", "123");
		
		System.out.println(user);
	}
	
	@Test
	public void testInsert() {
		for(int i = 0;i < 10;i++) {
			User user = new User();
			user.setUsername("test" + i);
			user.setPassword("123");
			user.setAddress("̫ԭ");
			user.setEmail("test" + i + "@163.com");
			userService.insertUser(user);
			System.out.println(user);
		}
	}
	@Test
	public void testRePassword() {
		userService.updatePasswordByUserName("13037043846", "456");
	}
}
