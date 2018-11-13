package com.carshop.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.carshop.model.CarIndex;
import com.carshop.service.PageService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:spring-config.xml"})
public class TestCarIndex {

	@Autowired
	private PageService pageService;
	
	@Test
	public void testGetCarBrandByCategory() {
		
		List<CarIndex> list = pageService.getCarStyleByCarBrand("°ÂµÏ");
		for (CarIndex carIndex : list) {
			System.out.println(carIndex.getCarstyle());
		}
	}
}
