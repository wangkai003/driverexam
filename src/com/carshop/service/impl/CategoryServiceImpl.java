package com.carshop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carshop.dao.CategoryMapper;
import com.carshop.model.Category;
import com.carshop.service.CategoryService;
@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	private CategoryMapper categoryMapper;
	
	@Override
	public List<Category> getBrandByCategory(String category){
		
		return categoryMapper.getBrandByCategory(category);
	}
}
