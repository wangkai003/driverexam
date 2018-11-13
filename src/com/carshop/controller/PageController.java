package com.carshop.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.carshop.model.Car;
import com.carshop.model.CarIndex;
import com.carshop.model.Category;
import com.carshop.model.PageBean;
import com.carshop.model.User;
import com.carshop.service.CarService;
import com.carshop.service.CategoryService;
import com.carshop.service.PageService;

@Controller
@RequestMapping("/index")
public class PageController {

	@Autowired
	private CategoryService categoryService;
	@Autowired
	private PageService pageService;
	@Autowired
	private CarService carService;

	/**
	 * 显示index页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/index.action")
	public String showIndex() {
		return "redirect:/car/getAllCar.action";
	}

	/**
	 * login页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login.action")
	public String toLogin() {
		return "login";
	}

	/**
	 * 注册页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/register.action")
	public String toRegister() {
		return "register";
	}

	@RequestMapping(value = "/adminLogin.action")
	public String toAdmin() {
		return "adminLogin";
	}

	@RequestMapping(value = "/showBrand.action")
	@ResponseBody
	public List<String> showBrand(@RequestParam("category") String category) {
		System.out.println(category);
		List<Category> categoryList = categoryService.getBrandByCategory(category);
		List<String> carBrand = new ArrayList<>();
		for (Category category2 : categoryList) {
			carBrand.add(category2.getCarbrand());
		}
		return carBrand;
	}

	@RequestMapping(value = "/showCarSeriesByCarBrand.action")
	@ResponseBody
	public List<String> showCarSeriesByCarBrand(@RequestParam("carbrand") String carbrand) {
		System.out.println(carbrand);
		List<CarIndex> carIndexList = pageService.getCarStyleByCarBrand(carbrand);
		List<String> carStyle = new ArrayList<>();
		for (CarIndex carIndex : carIndexList) {
			carStyle.add(carIndex.getCarstyle());
		}
		return carStyle;
	}

	@RequestMapping(value = "/showCarByCarSeries.action")
	public String showCarByCarSeries(@RequestParam("carBrand") String carBrand,
			@RequestParam("carSeries") String carSeries, HttpServletRequest request, Integer currentPage) {
		System.out.println("carBrand" + carBrand);
		System.out.println("carSeries" + carSeries);
		if (currentPage == null) {
			currentPage = 1;
		}
		Integer currentCount = 12;
		Car car = new Car();
		car.setCarBrand(carBrand);
		car.setCarSeries(carSeries);
		PageBean<Car> pageBean = carService.getCarListByCondition(car, currentPage, currentCount);
		request.setAttribute("pageBean", pageBean);
		List<Car> carList = pageBean.getList();
		request.setAttribute("carList", carList);
		return "index";
	}

	@RequestMapping(value = "/showCarByCarPrice.action")
	public String showCarByCarPrice(@RequestParam("carBrand") String carBrand,
			@RequestParam("carSeries") String carSeries, @RequestParam("price") String price,
			HttpServletRequest request, Integer currentPage) {
		if (currentPage == null) {
			currentPage = 1;
		}
		Integer currentCount = 12;
		Car car = new Car();
		car.setCarBrand(carBrand);
		car.setCarSeries(carSeries);
		// 正则匹配价格
		String regEx = "(\\d+)";
		Pattern pattern = Pattern.compile(regEx);
		Matcher matcher = pattern.matcher(price);
		List<String> list = new ArrayList<>();
		while (matcher.find()) {
			list.add(matcher.group());
		}
		PageBean<Car> pageBean = carService.getCarListByPrice(list.get(0),list.get(1),car,currentPage,currentCount);
		request.setAttribute("pageBean", pageBean);
		List<Car> carList = pageBean.getList();
		request.setAttribute("carList", carList);
		return "index";
	}

	@RequestMapping(value = "/showCarRange.action")
	public String showCarRange(String start, String end, HttpServletRequest request, Integer currentPage) {
		if (currentPage == null) {
			currentPage = 1;
		}
		Integer currentCount = 12;
		request.setAttribute("start", start);
		request.setAttribute("end", end);
		Car car = new Car();
		PageBean<Car> pageBean = carService.getCarListByPrice(start, end, car, currentPage, currentCount);
		List<Car> carList = pageBean.getList();
		request.setAttribute("pageBean", pageBean);
		request.setAttribute("carList", carList);
		return "index";
	}
	@RequestMapping(value = "/showSellCar.action")
	public String showSellCar(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			//用户未登录
			return "redirect:/index/login.action";
		}
		//跳转到sallCar页面
		return "sellCar";
	}
	
}
