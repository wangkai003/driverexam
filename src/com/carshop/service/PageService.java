package com.carshop.service;

import java.util.List;

import com.carshop.model.CarIndex;

public interface PageService {

	/**
	 * ����carbrand��ѯcarstyle
	 * @param category
	 * @return
	 */
	public List<CarIndex> getCarStyleByCarBrand(String carbrand);
}
