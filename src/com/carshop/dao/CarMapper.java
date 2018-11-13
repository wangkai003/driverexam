package com.carshop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.carshop.model.Car;

public interface CarMapper {

	//����Id��ѯ������Ϣ
	public Car getCarById(Integer id);
	
	//��ѯ���г�����Ϣ
	public List<Car> getCarList();
	
	//���car��Ϣ
	public Integer insertCar(Car car);
	
	//��ѯcar�ļ�¼��
	public Long getTotalCountByBlur(@Param("carBrand")String carBrand);
	
	public List<Car> getCarListByBlur(@Param("carBrand")String carBrand,@Param("index")Integer index,@Param("currentCount")Integer currentCount);
	
	public Long getTotalCountByCondition(@Param("car")Car car);
	
	public List<Car> getCarListByCondition(@Param("car")Car car,@Param("index")Integer index,@Param("currentCount")Integer currentCount);
	
	public Long getTotalCountByPrice(@Param("car")Car car,@Param("start")Double start,@Param("end")Double end);
	
	public List<Car> getCarListByPrice(@Param("car")Car car,@Param("start")Double start,@Param("end")Double end,@Param("index")Integer index,@Param("currentCount")Integer currentCount);
	
	//������ϵ��Id��ѯ������Ϣ
	public List<Car> getCarByContactPeopleId(Integer contactPeople_id);
	
	public void deleteCarById(Integer id);
	
	public void updateCarById(@Param("id")Integer id,@Param("car")Car car);
}
