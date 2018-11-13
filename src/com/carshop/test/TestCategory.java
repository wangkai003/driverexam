package com.carshop.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.carshop.model.Category;
import com.carshop.service.CategoryService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:spring-config.xml"})
public class TestCategory {

	@Autowired
	private CategoryService categoryService;
	
	@Test
	public void getBrandByCategory() {
		List<Category> list = categoryService.getBrandByCategory("A");
		for (Category category : list) {
			System.out.println(category.getCarbrand());
		}
		
	}
}
