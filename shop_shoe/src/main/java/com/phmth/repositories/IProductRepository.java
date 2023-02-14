package com.phmth.repositories;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.phmth.entities.BrandEntity;
import com.phmth.entities.CategoryEntity;
import com.phmth.entities.ProductEntity;
@Repository
public interface IProductRepository extends JpaRepository<ProductEntity, Long>{

	List<ProductEntity> findFirst4ByCategoryOrderByNameDesc(CategoryEntity category);

	Page<ProductEntity> findByCategory(CategoryEntity category, Pageable pageable);

	Page<ProductEntity> findByBrand(BrandEntity brand, Pageable pageable);

	Page<ProductEntity> findByBrandAndCategory(CategoryEntity category, BrandEntity brand, Pageable pageable);

	Page<ProductEntity> findByPriceBetween(double startPrice, double endPrice, Pageable pageable);

	Page<ProductEntity> findByCategoryAndPriceBetween(CategoryEntity category, double startPrice, double endPrice, Pageable pageable);

	Page<ProductEntity> findByBrandAndPriceBetween(BrandEntity brand, double startPrice, double endPrice, Pageable pageable);

	Page<ProductEntity> findByBrandAndCategoryAndPriceBetween(CategoryEntity category, BrandEntity brand, double startPrice, double endPrice, Pageable pageable);

	List<ProductEntity> findByNameStartsWith(String term);


}
