package com.phmth.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.phmth.entities.SlideEntity;
import com.phmth.repositories.ISlideRepository;
import com.phmth.services.ISlideService;

@Service
public class SlideServiceImpl implements ISlideService {
	@Autowired
	private ISlideRepository slideRepository;

	@Override
	public List<SlideEntity> findAll() {
		return slideRepository.findAll();
	}

}
