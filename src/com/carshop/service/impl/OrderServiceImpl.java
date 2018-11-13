package com.carshop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carshop.dao.OrderMapper;
import com.carshop.model.Order;
import com.carshop.service.OrderService;
@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderMapper orderMapper;
	@Override
	public List<Order> getOrderItemsList(Integer id) {
		
		return orderMapper.getOrderItemsList(id);
	}
	
	@Override
	public Integer insertOrder(Order order) {
		
		return orderMapper.insertOrder(order);
	}
	
	@Override
	public Integer getOrderByUserId(Integer userid) {
		
		return orderMapper.getOrderByUserId(userid);
	}
}
