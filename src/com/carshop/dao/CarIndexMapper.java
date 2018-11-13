package com.carshop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.carshop.model.CarIndex;

public interface CarIndexMapper {

	public List<CarIndex> getCarStyleByCarBrand(@Param("carbrand")String carbrand);
}
