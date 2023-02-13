package com.phmth.controller.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.phmth.common.Constant;
import com.phmth.dto.FormSearch;
import com.phmth.entities.ProductEntity;
import com.phmth.services.IBrandService;
import com.phmth.services.ICategoryService;
import com.phmth.services.IProductService;

@RestController
public class ProductController {
	
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	private IProductService productService;
	
	@Autowired
	private ICategoryService categoryService;
	
	@Autowired
	private IBrandService brandService;
	
	private Sort checkSortBy(String nameSort) {
		Sort sort = Sort.by(Sort.Direction.ASC, "price");
		if (nameSort.equals("low-high")) {
			sort = Sort.by(Sort.Direction.ASC, "price");
		} else if (nameSort.equals("high-low")) {
			sort = Sort.by(Sort.Direction.DESC, "price");
		} else if (nameSort.equals("a-z")) {
			sort = Sort.by(Sort.Direction.ASC, "name");
		} else if (nameSort.equals("z-a")) {
			sort = Sort.by(Sort.Direction.DESC, "name");
		}
		return sort;
	}

	@GetMapping("/product-shop")
	public ModelAndView productPage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView(Constant.PAGE_PRODUCT_SHOP);
		
		int page = 1;
		int limit = 9;
		String nameCategory = "all";
		String nameBrand = "all";
		String nameSort = "low-high";
		String namePrice = "all";
		
		if(request.getParameter("page") != null && !request.getParameter("page").isEmpty()) {
			page = Integer.parseInt(request.getParameter("page").toString());
		}
		if(request.getParameter("nameCategory") != null) {
			nameCategory = request.getParameterValues("nameCategory")[0];
		}
		if(request.getParameter("nameBrand") != null) {
			nameBrand = request.getParameterValues("nameBrand")[0];
		}
		if(request.getParameter("namePrice") != null) {
			namePrice = request.getParameterValues("namePrice")[0];
		}
		if(request.getParameter("nameSort") != null) {
			nameSort = request.getParameter("nameSort").toString();
		}
	
		Sort sort = checkSortBy(nameSort);
		Pageable pageable = PageRequest.of(page-1, limit, sort);
		
		FormSearch formSearch = new FormSearch();
		formSearch.setNameCategory(nameCategory);
		formSearch.setNameBrand(nameBrand);
		formSearch.setNamePrice(namePrice);
		
		Page<ProductEntity> listPageProduct = productService.getAllProduct(formSearch, pageable);
		List<ProductEntity> listProduct = listPageProduct.getContent();
		
		mav.addObject("currentPage", page);
		mav.addObject("totalPage", listPageProduct.getTotalPages());
		mav.addObject("listProduct", listProduct);
		mav.addObject("nameSort", nameSort);
		mav.addObject("nameBrand", nameBrand);
		mav.addObject("nameCategory", nameCategory);
		mav.addObject("namePrice", namePrice);
		mav.addObject("listCategory", categoryService.getAllCategory());
		mav.addObject("listBrand", brandService.getAllBrand());
		return mav;
	}

	@GetMapping("/product-shop/{productID}")
	public ModelAndView productDeatilPage(@PathVariable("productID") long productID) {
		ModelAndView mav = new ModelAndView(Constant.PAGE_PRODUCT_DETAIL);
		mav.addObject("product", productService.getProductById(productID));
		return mav;
	}
}
