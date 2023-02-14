package com.phmth.services.impl;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.phmth.dto.FormSearch;
import com.phmth.dto.ProductDto;
import com.phmth.entities.BrandEntity;
import com.phmth.entities.CategoryEntity;
import com.phmth.entities.ProductEntity;
import com.phmth.repositories.IBrandRepository;
import com.phmth.repositories.ICategoryRepository;
import com.phmth.repositories.IProductRepository;
import com.phmth.services.IProductService;
@Service
@Qualifier("productService")
public class ProductServiceImpl implements IProductService{
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(ProductServiceImpl.class);
	
	@Autowired
	private IProductRepository productRepository;
	
	@Autowired
	private ICategoryRepository categoryRepository;
	
	@Autowired 
	private IBrandRepository brandRepository;

	@Override
	public List<ProductEntity> getLatestProductByCategory(long categoryID) {
		CategoryEntity category = new CategoryEntity();
		category.setId(categoryID);
		return productRepository.findFirst4ByCategoryOrderByNameDesc(category);
	}

	@Override
	public List<ProductEntity> getAllProduct() {
		return productRepository.findAll();
	}
	
	private boolean compareNameWithStringAll(String name) {
		if(name.equals("all")) {
			return true;
		}
		return false;
	}
	private Page<ProductEntity> checkFindProductBy(FormSearch formSearch,  Pageable pageable) {
		Page<ProductEntity> pageProduct = null;
		CategoryEntity category = categoryRepository.findByName(formSearch.getNameCategory());
		BrandEntity brand = brandRepository.findByName(formSearch.getNameBrand());
		if(compareNameWithStringAll(formSearch.getNamePrice())) {
			if(!compareNameWithStringAll(formSearch.getNameCategory())) {
				pageProduct = productRepository.findByCategory(category, pageable);
			}else if(!compareNameWithStringAll(formSearch.getNameBrand())) {
				pageProduct = productRepository.findByBrand(brand, pageable);
			}else if(!compareNameWithStringAll(formSearch.getNameCategory()) && !compareNameWithStringAll(formSearch.getNameBrand())) {
				pageProduct = productRepository.findByBrandAndCategory(category, brand, pageable);
			}else {
				pageProduct = productRepository.findAll(pageable);
			}
		}else {
			double startPrice = 0;
			double endPrice = 0;
			if(formSearch.getNamePrice().equals("1-5")) {
				startPrice = 1000000.0;
				endPrice = 5000000.0;
			}
			if(formSearch.getNamePrice().equals("5-10")) {
				startPrice = 5000000.0;
				endPrice = 10000000.0;
			}
			if(formSearch.getNamePrice().equals("10-100")) {
				startPrice = 10000000.0;
				endPrice = 100000000.0;
			}
			if(!compareNameWithStringAll(formSearch.getNameCategory())) {
				pageProduct = productRepository.findByCategoryAndPriceBetween(category, startPrice, endPrice, pageable);
			}else if(!compareNameWithStringAll(formSearch.getNameBrand())) {
				pageProduct = productRepository.findByBrandAndPriceBetween(brand, startPrice, endPrice, pageable);
			}else if(!compareNameWithStringAll(formSearch.getNameCategory()) && !compareNameWithStringAll(formSearch.getNameBrand())) {
				pageProduct = productRepository.findByBrandAndCategoryAndPriceBetween(category, brand, startPrice, endPrice, pageable);
			}else {
				pageProduct = productRepository.findByPriceBetween(startPrice, endPrice, pageable);
			}
		}
		return pageProduct;
	}

	@Override
	public Page<ProductEntity> getAllProduct(FormSearch formSearch, Pageable pageable) {
		return checkFindProductBy(formSearch, pageable);
	}

	@Override
	public ProductEntity getProductById(long productID) {
		return productRepository.findById(productID).get();
	}

	@Override
	public Page<ProductEntity> getAllProduct(Pageable pageable) {
		return productRepository.findAll(pageable);
	}

	@Override
	public ProductEntity addProduct(ProductEntity product) {
		product.setCategory(categoryRepository.findByName(product.getCategory().getName()));
		product.setBrand(brandRepository.findByName(product.getBrand().getName()));
		return productRepository.save(product);
	}

	@Override
	public ProductEntity editProduct(ProductEntity product) {
		if(product.getImage() == null || product.getImage().isEmpty()) {
			product.setImage(getProductById(product.getId()).getImage());
		}
		product.setCategory(categoryRepository.findByName(product.getCategory().getName()));
		product.setBrand(brandRepository.findByName(product.getBrand().getName()));
		return productRepository.save(product);
	}

	@Override
	public void deleteProduct(long id) {
		productRepository.deleteById(id);
	}

	@Override
	public List<ProductDto> getProductBySearchName(String term) {
		List<ProductEntity> productEntity = productRepository.findByNameStartsWith(term);
		List<ProductDto> listProductDto = new ArrayList<>();
		for (ProductEntity entity : productEntity) {
			ProductDto productDto = new ProductDto();
			productDto.setId(entity.getId());
			productDto.setName(entity.getName());
			productDto.setPrice(entity.getPrice());
			productDto.setImage(entity.getImage());
			productDto.setQuantity(entity.getQuantity());
			productDto.setStatus(entity.getStatus());
			productDto.setBrandID(entity.getBrand().getId());
			productDto.setCategoryID(entity.getCategory().getId());
			listProductDto.add(productDto);
		}
		return listProductDto;
	}

}
