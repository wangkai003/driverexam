package com.carshop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carshop.dao.CarMapper;
import com.carshop.model.Car;
import com.carshop.model.PageBean;
import com.carshop.service.CarService;

@Service
public class CarServiceImpl implements CarService{

	@Autowired
	private CarMapper carMapper;
	
	@Override
	public Car getCarById(Integer id) {
		
		return carMapper.getCarById(id);
	}
	@Override
	public List<Car> getCarByContactPeopleId(Integer contactPeople_id) {
		
		return carMapper.getCarByContactPeopleId(contactPeople_id);
	}
	
	@Override
	public List<Car> getCarList() {
		
		return carMapper.getCarList();
	}
	
	@Override
	public Integer insertCar(Car car) {
		
		return carMapper.insertCar(car);
	}
	
	@Override
	public PageBean<Car> getCarPageBeanByBlur(String searchname,Integer currentPage, Integer currentCount) {
		PageBean<Car> pageBean = new PageBean<>();
		//currentCount
		pageBean.setCurrentCount(currentCount);
		//currentPage
		pageBean.setCurrentPage(currentPage);
		//totalCount
		Integer totalCount = carMapper.getTotalCountByBlur(searchname).intValue();
		pageBean.setTotalCount(totalCount);
		//totalPage
		Integer totalPage = Integer.valueOf((int)Math.ceil(1.0*totalCount/currentCount));
		pageBean.setTotalPage(totalPage);
		//当前页显示的信息
		//index
		Integer index = (currentPage - 1)*currentCount;
		List<Car> carList = carMapper.getCarListByBlur(searchname, index, currentCount);
		pageBean.setList(carList);
		return pageBean;
	}
	
	@Override
	public PageBean<Car> getCarListByCondition(Car car, Integer currentPage, Integer currentCount) {
		PageBean<Car> pageBean = new PageBean<>();
		//currentCount
		pageBean.setCurrentCount(currentCount);
		//currentPage
		pageBean.setCurrentPage(currentPage);
		//totalCount
		Integer totalCount = carMapper.getTotalCountByCondition(car).intValue();
		pageBean.setTotalCount(totalCount);
		//totalPage
		Integer totalPage = Integer.valueOf((int)Math.ceil(1.0*totalCount/currentCount));
		pageBean.setTotalPage(totalPage);
		//当前页显示的信息
		//index
		Integer index = (currentPage - 1)*currentCount;
		List<Car> carList = carMapper.getCarListByCondition(car, index, currentCount);
		pageBean.setList(carList);
		return pageBean;
	}

	@Override
	public PageBean<Car> getCarListByPrice(String start, String end, Car car, Integer currentPage, Integer currentCount) {
		PageBean<Car> pageBean = new PageBean<>();
		//currentCount
		pageBean.setCurrentCount(currentCount);
		//currentPage
		pageBean.setCurrentPage(currentPage);
		//totalCount
		Integer totalCount = carMapper.getTotalCountByPrice(car,Double.valueOf(start),Double.valueOf(end)).intValue();
		pageBean.setTotalCount(totalCount);
		//totalPage
		Integer totalPage = Integer.valueOf((int)Math.ceil(1.0*totalCount/currentCount));
		pageBean.setTotalPage(totalPage);
		//当前页显示的信息
		//index
		Integer index = (currentPage - 1)*currentCount;
		List<Car> carList = carMapper.getCarListByPrice(car,Double.valueOf(start),Double.valueOf(end), index, currentCount);
		pageBean.setList(carList);
		return pageBean;
	}
	@Override
	public void deleteCarById(Integer id) {
		carMapper.deleteCarById(id);
	}
	@Override
	public void updateCarById(Integer id, Car car) {
		carMapper.updateCarById(id, car);
	}
}
