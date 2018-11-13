package com.carshop.service;

import java.util.List;

import com.carshop.model.Car;
import com.carshop.model.PageBean;

public interface CarService {

	public Car getCarById(Integer id);
	
	public List<Car> getCarByContactPeopleId(Integer contactPeople_id);
	
	public List<Car> getCarList();
	
	//��ӳ�����Ϣ
	public Integer insertCar(Car car);
	
	/**
	 * ������ҳ��ѯ   ����carBrand
	 * @param searchname
	 * @param currentPage
	 * @param currentCount
	 * @return
	 */
	public PageBean<Car> getCarPageBeanByBlur(String searchname,Integer currentPage, Integer currentCount);
	
	/**
	 * ����car������ѯ
	 * @param car
	 * @param currentPage
	 * @param currentCount
	 * @return
	 */
	public PageBean<Car> getCarListByCondition(Car car,Integer currentPage, Integer currentCount);
	
	/**
	 * ���ݼ۸������ѯ
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
