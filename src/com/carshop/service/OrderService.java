package com.carshop.service;

import java.util.List;

import com.carshop.model.Order;

public interface OrderService {

	//获取每个订单的订单项
	public List<Order> getOrderItemsList(Integer id);
	
	//添加用户的订单
	public Integer insertOrder(Order order);
	
	//根据用户id获取orderId
	public Integer getOrderByUserId(Integer userid);
}
