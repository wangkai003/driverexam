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
		// ��ʱuser�Ѿ���¼
		// ��ȡorderId
		Integer orderId = orderService.getOrderByUserId(userid);
		if (orderId == null) {
			// ��������
			Order order = new Order();
			order.setUserid(userid);
			order.setOrderprice(null);
			orderService.insertOrder(order);
			orderId = order.getId();
			System.out.println("���������ɹ�");
		}
		// �ж�carid�Ƿ����
		// �����־λ flag;
		boolean flag = false;
		List<Item> itemList = itemService.getItemByOrderId(orderId);
		for (Item item : itemList) {
			System.out.println(item);
			if (item == null) {
				flag = false;
				break;
			}
			if (carid.equals(item.getCarid())) {
				System.out.println("�����carid" + carid);
				System.out.println("�Ѵ����ö���,�����ظ�����");
				flag = true;
			}
		}
		// ����δ������
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
				// ��Ӷ����ɹ�
				System.out.println("��ӳɹ�" + item);
			} else {
				// ��Ӷ���ʧ��
				System.out.println("���ʧ��");
			}
		}
		// ��ȡ����״̬
		Integer state = itemService.getItemByCarId(carid).getState();
		return state;
	}

	@RequestMapping("/toEstimate.action")
	@ResponseBody
	public Integer toEstimate(@RequestParam("userid") Integer userid, @RequestParam("carid") Integer carid) {
		// ��ʱuser�Ѿ���¼
		// ��ȡorderId
		Integer orderId = orderService.getOrderByUserId(userid);
		if (orderId == null) {
			// �û�δ���� 10��ʾ�û�δ����
			return 10;
		}
		// �ж�carid�Ƿ����
		// �����־λ flag;
		boolean flag = false;
		List<Item> itemList = itemService.getItemByOrderId(orderId);
		for (Item item : itemList) {
			if (item.getCarid().equals(carid)) {
				flag = true;
			}
		}
		// ���ж���
		if (flag) {
			// ��ȡ����״̬
			Integer state = itemService.getItemByCarId(carid).getState();
			return state;
		}
		// �û�δ���� 10��ʾ�û�δ����
		return 10;
	}

	// �û�����
	@RequestMapping("/uploadEstimate.action")
	@ResponseBody
	public Integer uploadEstimate(@RequestParam("estimate") String estimate, @RequestParam("carid") Integer carid) {
		Item item = itemService.getItemByCarId(carid);
		System.out.println("pingjia" + item);
		if (item.getEstimate() != null) {
			// 2��ʾ�Ñ��Ѿ�����,�����ظ�����
			return 2;
		}
		try {
			itemService.updateEstimate(estimate, carid);
			System.out.println("�û����۳ɹ�!");
			// 1��ʾ���۳ɹ�
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 0��ʾ����ʧ��
		return 0;
	}
}
