package com.carshop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.carshop.model.User;

public interface UserMapper {

	//����Id��ѯ�û���Ϣ
	public User getUserById(Integer id);
	//����һ����¼
	public Integer insertUser(User user);
	//ɾ��һ����¼
	public void deleteUserById(Integer id);
	//����һ����¼
	public void updateUserById(String username);
	//��������
	public void updatePasswordByUserName(@Param("username")String username,@Param("password")String password);
	//�����û����������ѯ
	public User login(@Param("username")String username,@Param("password")String password);
	
	//��ѯ�����û���Ϣ
	public List<User> getAllUser();
	
	//��ѯ�ܼ�¼��
	public Long getTotalCountByUsername(@Param("username")String username);
	
	//�����û�����ѯ�û�
	public List<User> getUserListByUsername(@Param("username")String username,@Param("index")Integer index,@Param("currentCount")Integer currentCount);
	
	public User getUserByUsername(@Param("username")String username);
	
	public User getUserByEmail(@Param("email")String email);
	
}
