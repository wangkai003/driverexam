package com.carshop.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.carshop.model.Car;
import com.carshop.model.PageBean;
import com.carshop.model.User;
import com.carshop.service.CarService;
import com.carshop.service.UserService;

@Controller
@RequestMapping("/car")
public class CarController {

	@Autowired
	private CarService carService;
	@Autowired
	private UserService userService;

	@RequestMapping("/index.action")
	public String index(HttpServletRequest request) {
		List<Car> carList = carService.getCarList();

		request.setAttribute("carList", carList);
		return "index";
	}

	@RequestMapping("/getAllCar.action")
	public String getAllCar(String searchname, HttpServletRequest request, Integer currentPage) {
		if (currentPage == null) {
			currentPage = 1;
		}
		Integer currentCount = 12;
		request.setAttribute("searchname", searchname);
		PageBean<Car> pageBean = carService.getCarPageBeanByBlur(searchname, currentPage, currentCount);
		List<Car> carList = pageBean.getList();
		request.setAttribute("pageBean", pageBean);
		request.setAttribute("carList", carList);

		return "index";
	}

	@RequestMapping("/getCarItem.action")
	public String getCarItem(@RequestParam("id") Integer id, HttpServletRequest request) {

		Car car = carService.getCarById(id);
		User seller = userService.getUserById(car.getContactPeople_id());
		System.out.println(car);
		request.setAttribute("car", car);
		request.setAttribute("seller", seller);
		return "order";
	}

	@RequestMapping("/uploadCarInfo.action")
	public String uploadCarInfo(Car car, HttpServletRequest request, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			// 保存数据库的路径
			String sqlPath = null;
			// 保存本地路径
			String localPath = "D:\\image\\";
			// 文件名
			String filename = "";
			if (!car.getFile().isEmpty()) {
				// 获取文件类型
				String contentType = car.getFile().getContentType();
				// 获取文件后缀名
				String suffixName = contentType.substring(contentType.indexOf("/") + 1);

				filename = UUID.randomUUID().toString().replaceAll("-", "") + "." + suffixName;
				System.out.println(filename);
				try {
					car.getFile().transferTo(new File(localPath + filename));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			sqlPath = filename;
			car.setCarimg(sqlPath);
			car.setContactPeople_id(user.getId());
			car.setCaryear("2");
			car.setCarstate(0);
			carService.insertCar(car);
			return "redirect:/index/index.action";
		}
		return "redirect:/index/login.action";
	}
}
