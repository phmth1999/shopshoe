package com.phmth.services;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.phmth.dto.FormSearch;
import com.phmth.entities.ProductEntity;

public interface IProductService {
	List<ProductEntity> getLatestProductByCategory(long category);

	List<ProductEntity> getAllProduct();
	
	Page<ProductEntity> getAllProduct(FormSearch formSearch, Pageable pageable);

	ProductEntity getProductById(long productID);

	Page<ProductEntity> getAllProduct(Pageable pageable);

	ProductEntity addProduct(ProductEntity product);

	ProductEntity editProduct(ProductEntity product);

	void deleteProduct(long id);

}
