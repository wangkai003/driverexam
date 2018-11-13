package com.carshop.test;


import java.util.List;
import java.util.UUID;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.carshop.model.Car;
import com.carshop.model.Item;
import com.carshop.model.Order;
import com.carshop.service.CarService;
import com.carshop.service.ItemService;
import com.carshop.service.OrderService;
import com.carshop.util.DateUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:spring-config.xml"})
public class TestOrder {
	
	@Autowired
	private OrderService orderService;
	@Autowired
	private ItemService itemService;
	@Autowired
	private CarService carService;
	@Test
	public void testGetOrderId() {
		Order order = new Order();
		order.setUserid(21);
		order.setOrderprice(null);
		orderService.insertOrder(order);
		System.out.println(order.getId());
	}
	
	@Test
	public void testCreateOrder() {
		Integer id = 22;
		Integer carid = 101;
		//先判断userid是否存在
		//获取orderId
		Integer orderId = orderService.getOrderByUserId(id);
		System.out.println(orderId);
		if (orderId == null) {
			//创建订单
			Order order = new Order();
			order.setUserid(id);
			order.setOrderprice(null);
			orderService.insertOrder(order);
			orderId = order.getId();
		}
		
		Car car = carService.getCarById(carid);
		Item item = new Item();
		item.setCar(car);
		item.setItemnum("hs"+ UUID.randomUUID());
		item.setCarid(carid);
		item.setItemprice(car.getPrice());
		item.setItemtime(DateUtil.getNowDate());
		item.setEstimate(null);
		item.setState(0);
		item.setOrderid(orderId);
		Integer result = itemService.insertItem(item);
		
		if (result > 0) {
			//添加订单成功
			System.out.println("添加成功" + item);
		}else {
			//添加订单失败
			System.out.println("添加失败");
		}
	}
	
	@Test
	public void testGetOrderItemsList() {
		List<Order> orderItemsList = orderService.getOrderItemsList(6);
		for (Order order : orderItemsList) {
			System.out.println(order);
		}
	}
}
