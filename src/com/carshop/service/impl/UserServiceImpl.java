package com.carshop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carshop.dao.UserMapper;
import com.carshop.model.PageBean;
import com.carshop.model.User;
import com.carshop.service.UserService;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private  UserMapper userMapper;
	
	@Override
	public User getUserById(Integer id) {
		return userMapper.getUserById(id);
	}
	@Override
	public void deleteUserById(Integer id) {
		userMapper.deleteUserById(id);
	}

	@Override
	public void updateUserById(String username) {
		userMapper.updateUserById(username);
	}

	@Override
	public User login(String username, String password) {
		
		return userMapper.login(username, password);
	}
	
	@Override
	public List<User> getAllUser(){
		
		return userMapper.getAllUser();
	}
	
	@Override
	public PageBean<User> getListByUsername(String username,Integer currentPage,Integer currentCount) {
		
		PageBean<User> pageBean = new PageBean<>();
		//当前页
		pageBean.setCurrentPage(currentPage);
		//每页显示记录数
		pageBean.setCurrentCount(currentCount);
		//总记录数
		Integer totalCount = userMapper.getTotalCountByUsername(username).intValue();
		pageBean.setTotalCount(totalCount);
		//总页数
		Integer totalPage = Integer.valueOf((int)Math.ceil(1.0*totalCount/currentCount));
		pageBean.setTotalPage(totalPage);
		//当前页显示的信息
		//起始索引
		Integer index = (currentPage-1)*currentCount;
		List<User> userList = userMapper.getUserListByUsername(username, index, currentCount);
		pageBean.setList(userList);
		return pageBean;
	}
	
	@Override
	public User getUserByUsername(String username) {
		
		return userMapper.getUserByUsername(username);
	}

	@Override
	public User getUserByEmail(String email) {
		
		return userMapper.getUserByEmail(email);
	}

	@Override
	public Integer insertUser(User user) {
		
		return userMapper.insertUser(user);
	}
	@Override
	public void updatePasswordByUserName(String username, String password) {
		userMapper.updatePasswordByUserName(username, password);
	}

}
