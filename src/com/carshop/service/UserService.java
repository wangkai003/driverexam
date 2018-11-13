package com.carshop.service;

import java.util.List;

import com.carshop.model.PageBean;
import com.carshop.model.User;

public interface UserService {

	// 根据Id查询用户信息
	public User getUserById(Integer id);

	// 增加一条记录
	public Integer insertUser(User user);

	// 删除一条记录
	public void deleteUserById(Integer id);

	// 更新一条记录
	public void updateUserById(String username);
	//登录
	public User login(String username,String password);
	//修改密码
	public void updatePasswordByUserName(String username, String password);
	
	//查询所有用户信息
	public List<User> getAllUser();
	//根据用户名查询用户信息------分页查询
	public PageBean<User> getListByUsername(String username,Integer currentPage,Integer currentCount);
	
	//判断用户名是否已经存在
	public User getUserByUsername(String username);
	
	//判断用户名是否已经存在
	public User getUserByEmail(String email);
	
}
