package com.phmth.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.phmth.entities.CategoryEntity;

public interface ICategoryRepository extends JpaRepository<CategoryEntity, Long>{

	CategoryEntity findByName(String nameCategory);


}
