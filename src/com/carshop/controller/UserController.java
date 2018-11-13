package com.carshop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.carshop.model.Car;
import com.carshop.model.Item;
import com.carshop.model.PageBean;
import com.carshop.model.User;
import com.carshop.service.CarService;
import com.carshop.service.ItemService;
import com.carshop.service.OrderService;
import com.carshop.service.UserService;
import com.carshop.util.MD5Utils;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private ItemService itemService;
	@Autowired
	private CarService carService;
	
	@RequestMapping(value="/getAllUser.action")
	public String getAllUser(String searchname,HttpSession session,HttpServletRequest request,Integer currentPage) {
		if (session.getAttribute("admin")!= null) {
			//����ÿҳ��ʾ����Ϊ8��
			Integer currentCount = 8;
			if (currentPage == null) {
				currentPage = 1;
			}
			request.setAttribute("searchname", searchname);
			PageBean<User> pageBean = userService.getListByUsername(searchname, currentPage, currentCount);
			request.setAttribute("pageBean", pageBean);
			List<User> userList = pageBean.getList();
			request.setAttribute("userList", userList);
			return "userQuery";
		}else {
			//todo  ȥ��½ҳ��
			return "redirect:/adminLogin.jsp";
		}
	}
	
	@RequestMapping("/login.action")
	public String login(String username,String password,HttpServletRequest request,HttpSession session) {
		
		User user = userService.login(username, MD5Utils.md5(password));
		if (user != null) {
			session.setAttribute("user", user);
			return "redirect:/index/index.action";
		}else {
			request.setAttribute("loginInfo", "�û��������������");
			return "login";
		}
	}
	
	@RequestMapping("/logout.action")
	public String logout(HttpSession session) {
		if (session.getAttribute("user") !=null) {
			session.removeAttribute("user");
		}
		return "redirect:/index/index.action";
	}
	
	@RequestMapping("/register.action")
	public String register(
			@RequestParam("username")String username,
			@RequestParam("password")String password,
			@RequestParam("address")String address,
			@RequestParam("email")String email,
			HttpServletRequest request) {
		if (userService.getUserByUsername(username) !=null) {
			request.setAttribute("usernameExit", "�û����Ѵ���");
			return "register";
		}
		if (userService.getUserByEmail(email) !=null) {
			request.setAttribute("eamilExit", "�����Ѵ���");
			return "register";
		}
		User user = new User();
		user.setUsername(username);
		user.setPassword(MD5Utils.md5(password));
		user.setAddress(address);
		user.setEmail(email);
		Integer result = userService.insertUser(user);
		if (result > 0) {
			request.setAttribute("registerInfo", "ע��ɹ�");
			return "login";
		}
		request.setAttribute("registerInfo", "ע��ʧ��");
		return "register";
	}
	
	@RequestMapping("/getUserInfo.action")
	public String getUserInfo(HttpServletRequest request,HttpSession session) {
		User user = (User) session.getAttribute("user");
		Integer orderId = orderService.getOrderByUserId(user.getId());
		List<Item> itemList = itemService.getItemByOrderId(orderId);
		request.setAttribute("itemList", itemList);
		List<Car> carList = carService.getCarByContactPeopleId(user.getId());
		request.setAttribute("carList", carList);
		return "userManager";
	}
	
	@RequestMapping("/repassword.action")
	public String repassword(String oldpassword,String newpassword,HttpServletRequest request,HttpSession session) {
		User user = (User) session.getAttribute("user");
//		System.out.println("user"+ user.getPassword());
//		System.out.println("oldpassword" + oldpassword);
		if (MD5Utils.md5(oldpassword).equals(user.getPassword())) {
			try {
				userService.updatePasswordByUserName(user.getUsername(), MD5Utils.md5(newpassword));
				request.setAttribute("repasswordMessage", "�޸�����ɹ�!");
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("�޸�����ɹ�!");
			}
			
		}else {
			request.setAttribute("repasswordMessage", "ԭ�����������!");
		}
		return "forward:/user/getUserInfo.action";
	}
}
