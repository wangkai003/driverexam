package com.carshop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.carshop.model.Admin;
import com.carshop.model.Car;
import com.carshop.model.Item;
import com.carshop.model.PageBean;
import com.carshop.model.User;
import com.carshop.service.AdminService;
import com.carshop.service.CarService;
import com.carshop.service.ItemService;
import com.carshop.service.UserService;
import com.carshop.util.MD5Utils;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	@Autowired
	private UserService userService;
	@Autowired
	private ItemService itemService;
	@Autowired
	private CarService carService;

	@RequestMapping("/adminLogin.action")
	public String adminLogin(HttpSession session, String adminname, String password, HttpServletRequest request) {
		Admin admin = adminService.login(adminname, MD5Utils.md5(password));
		session.setAttribute("admin", admin);
		if (admin != null) {
			return "redirect:/admin/getAllInfoByAdmin.action";
		} else {
			request.setAttribute("loginError", "�û��������������");
			System.out.println("�û��������������");
			return "adminLogin";
		}
	}

	@RequestMapping("/adminLogout.action")
	public String adminLogout(HttpSession session) {
		session.removeAttribute("admin");
		return "adminLogin";
	}

	@RequestMapping("/getAllInfoByAdmin.action")
	public String getAllInfoByAdmin(String searchname, String searchItemNum, String searchCarBrand, HttpSession session,
			HttpServletRequest request, Integer currentPage) {
		if (session.getAttribute("admin") != null) {
			// ����ÿҳ��ʾ����Ϊ8��
			Integer currentCount = 8;
			if (currentPage == null) {
				currentPage = 1;
			}
			getAllUserToAdmin(searchname, currentCount, request, currentPage);
			getAllItemToAdmin(searchItemNum, currentCount, request, currentPage);
			getAllCarToAdmin(searchCarBrand, currentCount, request, currentPage);
			return "admin";
		} else {
			// todo ȥ��½ҳ��
			return "adminLogin";
		}
	}
	
	@RequestMapping("/updatePassword.action")
	@ResponseBody
	public Integer updatePassword(@RequestParam("username")String username,@RequestParam("password") String password) {
		try {
			userService.updatePasswordByUserName(username, MD5Utils.md5(password));
			System.out.println("����Ա��������ɹ�!");
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("����Ա��������ʧ��!");
		}
		return 0;
	}
	
	@RequestMapping("/updateState.action")
	@ResponseBody
	public Integer updateState(@RequestParam("id")Integer id,@RequestParam("state") Integer state) {
		try {
			itemService.updateState(id, state);
			System.out.println("���¶�����״̬�ɹ�!");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("���¶�����״̬ʧ��!");
		}
		Item item = itemService.getItemById(id);
		return item.getState();
	}
	
	@RequestMapping("/updateCar.action")
	@ResponseBody
	public Integer updateCar(
			@RequestParam("id")Integer id,
			@RequestParam("carBrand") String carBrand,
			@RequestParam("carSeries") String carSeries,
			@RequestParam("carModel") String carModel,
			@RequestParam("price") Double price,
			@RequestParam("mileage") String mileage,
			
			@RequestParam("displacement") String displacement) {
		System.out.println(id);
		System.out.println(carBrand);
		try {
			Car car = new Car();
			car.setId(id);
			car.setCarBrand(carBrand);
			car.setCarSeries(carSeries);
			car.setCarModel(carModel);
			car.setPrice(price);
			car.setMileage(mileage);
			car.setDisplacement(displacement);
			carService.updateCarById(id, car);
			System.out.println("���³����ɹ�!");
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("���³���ʧ��!");
		}
		return 0;
	}
	
	@RequestMapping("/deleteUser.action")
	@ResponseBody
	public Integer deleteUser(@RequestParam("id")Integer id) {
		try {
			userService.deleteUserById(id);
			System.out.println("ɾ��idΪ" + id + "��user�ɹ�");
			return 1;
		} catch (Exception e) {
			System.out.println("ɾ��idΪ" + id + "��userʧ��");
		}
		return 0;
	}
	
	@RequestMapping("/deleteItem.action")
	@ResponseBody
	public Integer deleteItem(@RequestParam("id")Integer id) {
		try {
			itemService.deleteItemById(id);
			System.out.println("ɾ��idΪ" + id + "��item�ɹ�");
			return 1;
		} catch (Exception e) {
			System.out.println("ɾ��idΪ" + id + "��itemʧ��");
		}
		return 0;
	}
	
	@RequestMapping("/deleteCar.action")
	@ResponseBody
	public Integer deleteCar(@RequestParam("id")Integer id) {
		try {
			carService.deleteCarById(id);
			System.out.println("ɾ��idΪ" + id + "��car�ɹ�");
			return 1;
		} catch (Exception e) {
			System.out.println("ɾ��idΪ" + id + "��carʧ��");
		}
		return 0;
	}
	
	public void getAllUserToAdmin(String searchname, Integer currentCount, HttpServletRequest request,
			Integer currentPage) {
		request.setAttribute("searchname", searchname);
		PageBean<User> userPageBean = userService.getListByUsername(searchname, currentPage, currentCount);
		request.setAttribute("userPageBean", userPageBean);
		List<User> userList = userPageBean.getList();
		request.setAttribute("userList", userList);
	}

	public void getAllItemToAdmin(String searchItemNum, Integer currentCount, HttpServletRequest request,
			Integer currentPage) {
			request.setAttribute("searchItemNum", searchItemNum);
			PageBean<Item> itemPageBean = itemService.getItemListByItemNum(searchItemNum, currentPage, currentCount);
			request.setAttribute("itemPageBean", itemPageBean);
			List<Item> itemList = itemPageBean.getList();
			request.setAttribute("itemList", itemList);
	}

	public void getAllCarToAdmin(String searchCarBrand, Integer currentCount, HttpServletRequest request,
			Integer currentPage) {
			request.setAttribute("searchCarBrand", searchCarBrand);
			PageBean<Car> carPageBean = carService.getCarPageBeanByBlur(searchCarBrand, currentPage, currentCount);
			request.setAttribute("carPageBean", carPageBean);
			List<Car> carList = carPageBean.getList();
			request.setAttribute("carList", carList);
	}
}
