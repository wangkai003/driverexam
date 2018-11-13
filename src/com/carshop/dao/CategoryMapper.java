package com.carshop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.carshop.model.Category;

public interface CategoryMapper {

	public List<Category> getBrandByCategory(@Param("category") String category);
}
