package com.carshop.service;

import java.util.List;

import com.carshop.model.PageBean;
import com.carshop.model.User;

public interface UserService {

	// ����Id��ѯ�û���Ϣ
	public User getUserById(Integer id);

	// ����һ����¼
	public Integer insertUser(User user);

	// ɾ��һ����¼
	public void deleteUserById(Integer id);

	// ����һ����¼
	public void updateUserById(String username);
	//��¼
	public User login(String username,String password);
	//�޸�����
	public void updatePasswordByUserName(String username, String password);
	
	//��ѯ�����û���Ϣ
	public List<User> getAllUser();
	//�����û�����ѯ�û���Ϣ------��ҳ��ѯ
	public PageBean<User> getListByUsername(String username,Integer currentPage,Integer currentCount);
	
	//�ж��û����Ƿ��Ѿ�����
	public User getUserByUsername(String username);
	
	//�ж��û����Ƿ��Ѿ�����
	public User getUserByEmail(String email);
	
}
