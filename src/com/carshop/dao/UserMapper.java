package com.carshop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.carshop.model.User;

public interface UserMapper {

	//根据Id查询用户信息
	public User getUserById(Integer id);
	//增加一条记录
	public Integer insertUser(User user);
	//删除一条记录
	public void deleteUserById(Integer id);
	//更新一条记录
	public void updateUserById(String username);
	//更新密码
	public void updatePasswordByUserName(@Param("username")String username,@Param("password")String password);
	//根据用户名和密码查询
	public User login(@Param("username")String username,@Param("password")String password);
	
	//查询所有用户信息
	public List<User> getAllUser();
	
	//查询总记录数
	public Long getTotalCountByUsername(@Param("username")String username);
	
	//根据用户名查询用户
	public List<User> getUserListByUsername(@Param("username")String username,@Param("index")Integer index,@Param("currentCount")Integer currentCount);
	
	public User getUserByUsername(@Param("username")String username);
	
	public User getUserByEmail(@Param("email")String email);
	
}
