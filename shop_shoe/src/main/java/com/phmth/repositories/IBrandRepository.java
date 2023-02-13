package com.phmth.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.phmth.entities.BrandEntity;

public interface IBrandRepository extends JpaRepository<BrandEntity, Long>{

	BrandEntity findByName(String nameBrand);


}
