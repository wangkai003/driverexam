package com.carshop.service;

import java.util.List;

import com.carshop.model.Order;

public interface OrderService {

	//��ȡÿ�������Ķ�����
	public List<Order> getOrderItemsList(Integer id);
	
	//����û��Ķ���
	public Integer insertOrder(Order order);
	
	//�����û�id��ȡorderId
	public Integer getOrderByUserId(Integer userid);
}
