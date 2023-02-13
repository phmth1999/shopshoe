package com.phmth.services;

import java.util.List;

import com.phmth.entities.CategoryEntity;

public interface ICategoryService {
	CategoryEntity getCategoryById(Long id);

	List<CategoryEntity> getAllCategory();
}
