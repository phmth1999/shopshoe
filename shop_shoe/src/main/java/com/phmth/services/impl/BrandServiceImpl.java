package com.phmth.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.phmth.entities.BrandEntity;
import com.phmth.repositories.IBrandRepository;
import com.phmth.services.IBrandService;
@Service
@Qualifier("brandService")
public class BrandServiceImpl implements IBrandService{
	@Autowired
	private IBrandRepository brandRepository;

	@Override
	public List<BrandEntity> getAllBrand() {
		return brandRepository.findAll();
	}

}
