package com.carshop.service;

import java.util.List;

import com.carshop.model.Category;

public interface CategoryService {

	public List<Category> getBrandByCategory(String category);
}
