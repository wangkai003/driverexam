package com.carshop.controller;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.carshop.model.Car;
import com.carshop.model.Item;
import com.carshop.model.Order;
import com.carshop.service.CarService;
import com.carshop.service.ItemService;
import com.carshop.service.OrderService;
import com.carshop.util.DateUtil;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private OrderService orderService;
	@Autowired
	private ItemService itemService;
	@Autowired
	private CarService carService;

	@Transactional
	@RequestMapping("/toOrder.action")
	@ResponseBody
	public Integer toOrder(@RequestParam("userid") Integer userid, @RequestParam("carid") Integer carid,
			HttpServletRequest request, HttpSession session) {
		System.out.println("userid="+userid);
		System.out.println("carid="+carid);
		// 此时user已经登录
		// 获取orderId
		Integer orderId = orderService.getOrderByUserId(userid);
		if (orderId == null) {
			// 创建订单
			Order order = new Order();
			order.setUserid(userid);
			order.setOrderprice(null);
			orderService.insertOrder(order);
			orderId = order.getId();
			System.out.println("订单创建成功");
		}
		// 判断carid是否存在
		// 定义标志位 flag;
		boolean flag = false;
		List<Item> itemList = itemService.getItemByOrderId(orderId);
		for (Item item : itemList) {
			System.out.println(item);
			if (item == null) {
				flag = false;
				break;
			}
			if (carid.equals(item.getCarid())) {
				System.out.println("传入的carid" + carid);
				System.out.println("已创建该订单,不能重复创建");
				flag = true;
			}
		}
		// 订单未被创建
		if (!flag) {
			Car car = carService.getCarById(carid);
			Item item = new Item();
			item.setCar(car);
			item.setItemnum("hs" + UUID.randomUUID().toString().replaceAll("-", ""));
			item.setCarid(carid);
			item.setItemprice(car.getPrice());
			item.setItemtime(DateUtil.getNowDate());
			item.setEstimate(null);
			item.setState(0);
			item.setOrderid(orderId);
			Integer result = itemService.insertItem(item);

			if (result > 0) {
				// 添加订单成功
				System.out.println("添加成功" + item);
			} else {
				// 添加订单失败
				System.out.println("添加失败");
			}
		}
		// 获取订单状态
		Integer state = itemService.getItemByCarId(carid).getState();
		return state;
	}

	@RequestMapping("/toEstimate.action")
	@ResponseBody
	public Integer toEstimate(@RequestParam("userid") Integer userid, @RequestParam("carid") Integer carid) {
		// 此时user已经登录
		// 获取orderId
		Integer orderId = orderService.getOrderByUserId(userid);
		if (orderId == null) {
			// 用户未购买 10表示用户未购买
			return 10;
		}
		// 判断carid是否存在
		// 定义标志位 flag;
		boolean flag = false;
		List<Item> itemList = itemService.getItemByOrderId(orderId);
		for (Item item : itemList) {
			if (item.getCarid().equals(carid)) {
				flag = true;
			}
		}
		// 已有订单
		if (flag) {
			// 获取订单状态
			Integer state = itemService.getItemByCarId(carid).getState();
			return state;
		}
		// 用户未购买 10表示用户未购买
		return 10;
	}

	// 用户评价
	@RequestMapping("/uploadEstimate.action")
	@ResponseBody
	public Integer uploadEstimate(@RequestParam("estimate") String estimate, @RequestParam("carid") Integer carid) {
		Item item = itemService.getItemByCarId(carid);
		System.out.println("pingjia" + item);
		if (item.getEstimate() != null) {
			// 2表示用戶已经评价,不能重复评价
			return 2;
		}
		try {
			itemService.updateEstimate(estimate, carid);
			System.out.println("用户评价成功!");
			// 1表示评价成功
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 0表示评价失败
		return 0;
	}
}
