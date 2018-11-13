package com.carshop.service;

import java.util.List;

import com.carshop.model.Car;
import com.carshop.model.PageBean;

public interface CarService {

	public Car getCarById(Integer id);
	
	public List<Car> getCarByContactPeopleId(Integer contactPeople_id);
	
	public List<Car> getCarList();
	
	//添加车辆信息
	public Integer insertCar(Car car);
	
	/**
	 * 车辆分页查询   根据carBrand
	 * @param searchname
	 * @param currentPage
	 * @param currentCount
	 * @return
	 */
	public PageBean<Car> getCarPageBeanByBlur(String searchname,Integer currentPage, Integer currentCount);
	
	/**
	 * 根据car条件查询
	 * @param car
	 * @param currentPage
	 * @param currentCount
	 * @return
	 */
	public PageBean<Car> getCarListByCondition(Car car,Integer currentPage, Integer currentCount);
	
	/**
	 * 根据价格区间查询
	 * @param start
	 * @param end
	 * @param car
	 * @param currentPage
	 * @param currentCount
	 * @return
	 */
	public PageBean<Car> getCarListByPrice(String start, String end, Car car, Integer currentPage, Integer currentCount);
	
	public void deleteCarById(Integer id);
	
	public void updateCarById(Integer id,Car car);
}
