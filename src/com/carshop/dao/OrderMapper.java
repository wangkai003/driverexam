package com.carshop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.carshop.model.Order;

public interface OrderMapper {

	public List<Order> getOrderItemsList(Integer id);
	
	public Integer insertOrder(Order order);
	
	public Integer getOrderByUserId(@Param("userid")Integer userid);
}
