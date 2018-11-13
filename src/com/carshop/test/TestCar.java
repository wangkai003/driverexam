package com.carshop.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.MatchResult;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.carshop.dao.CarMapper;
import com.carshop.model.Car;
import com.carshop.model.PageBean;
import com.carshop.service.CarService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-config.xml" })
public class TestCar {
	@Autowired
	private CarService carService;
	@Autowired
	private CarMapper carMapper;

	@Test
	public void testGetCarById() {

		Car car = carService.getCarById(14);

		System.out.println(car);
	}

	@Test
	public void testGetCarList() {

		List<Car> carList = carService.getCarList();
		for (Car car : carList) {
			System.out.println(car.toString());
		}

	}

	@Test
	public void testInsertCar() throws ParseException {

		for (int i = 0; i < 20; i++) {
			Car car = new Car();
			car.setCarBrand("奥迪");
			car.setCarColor("红色");
			car.setCarimg("hs001.jpg");
			car.setCarModel("SUV");
			car.setCarSeries("A4");
			car.setCarstate(0);
			car.setCaryear("1");
			car.setContactPeople_id(21);
			car.setDisplacement("1");
			car.setIocationCity("太原");
			car.setMileage("11");
			car.setPrice(19.0);
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			String date = format.format(new Date());
			car.setCarCardFirstTime(date);
			carService.insertCar(car);
		}
	}

	@Test
	public void testGetCarListByCondition() {
		Car car = new Car();
		car.setCarBrand("奥迪");
		car.setCarSeries("A6");
//		String price = "9-13万";
//		// 正则匹配价格
//		String regEx = "(\\d+)";
//		Pattern pattern = Pattern.compile(regEx);
//		Matcher matcher = pattern.matcher(price);
//		List<String> list = new ArrayList<>();
//		Map<String, Double> mapPrice = new HashMap<>();
//		while (matcher.find()) {
//			list.add(matcher.group());
//		}
//		mapPrice.put("start", Double.parseDouble(list.get(0)));
//		mapPrice.put("end", Double.parseDouble(list.get(1)));
		Integer currentPage = 1;
		Integer currentCount = 12;
		PageBean<Car> pageBean = new PageBean<>();
		// currentCount
		pageBean.setCurrentCount(currentCount);
		// currentPage
		pageBean.setCurrentPage(currentPage);
		// totalCount
//		Integer totalCount = carMapper.getTotalCountByPrice(car,mapPrice.get("start"),mapPrice.get("end")).intValue();
		Integer totalCount = carMapper.getTotalCountByCondition(car).intValue();
		System.out.println("totalCount" + totalCount);
//		System.err.println("start" + mapPrice.get("start"));
//		System.out.println("end" + mapPrice.get("end"));
		pageBean.setTotalCount(totalCount);
		// totalPage
		Integer totalPage = Integer.valueOf((int) Math.ceil(1.0 * totalCount / currentCount));
		pageBean.setTotalPage(totalPage);
		// 当前页显示的信息
		// index
		Integer index = (currentPage - 1) * currentCount;
		List<Car> carList = carMapper.getCarListByCondition(car, index, currentCount);
		pageBean.setList(carList);
		for (Car car2 : carList) {
			System.out.println("car" + car2);
		}
	}

	@Test
	public void testRegEx() {
		String price = "3-5万";
		// 正则匹配价格
		String regEx = "(\\d+)";
		Pattern pattern = Pattern.compile(regEx);
		Matcher matcher = pattern.matcher(price);
		List<String> list = new ArrayList<>();
		Map<String, String> mapPrice = new HashMap<>();
		while (matcher.find()) {
			list.add(matcher.group());
		}
		mapPrice.put("start", list.get(0));
		mapPrice.put("end", list.get(1));
		System.out.println(mapPrice.get("start"));
		System.out.println(mapPrice.get("end"));
	}
}
