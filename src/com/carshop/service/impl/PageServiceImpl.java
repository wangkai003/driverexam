package com.carshop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carshop.dao.CarIndexMapper;
import com.carshop.model.CarIndex;
import com.carshop.service.PageService;

@Service
public class PageServiceImpl implements PageService{

	@Autowired
	private CarIndexMapper carIndexMapper;

	@Override
	public List<CarIndex> getCarStyleByCarBrand(String carbrand) {
		
		return carIndexMapper.getCarStyleByCarBrand(carbrand);
	}
	
}
