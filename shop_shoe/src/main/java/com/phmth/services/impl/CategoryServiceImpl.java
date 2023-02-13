package com.phmth.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.phmth.entities.CategoryEntity;
import com.phmth.repositories.ICategoryRepository;
import com.phmth.services.ICategoryService;

@Service
public class CategoryServiceImpl implements ICategoryService{
	@Autowired
	private ICategoryRepository categoryRepository;

	public CategoryEntity getCategoryById(Long id) {
		return categoryRepository.findById(id).get();
	}

	@Override
	public List<CategoryEntity> getAllCategory() {
		return categoryRepository.findAll();
	}
	
}
