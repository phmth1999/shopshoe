package com.phmth.controller.web.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.phmth.dto.ProductDto;
import com.phmth.services.IProductService;

@RestController
public class SearchApi {
	@Autowired
	@Qualifier("productService")
	private IProductService productService;
	
	@GetMapping("/api/search")
	public List<ProductDto> search(@RequestParam("term") String term){
		List<ProductDto> listSearch = productService.getProductBySearchName(term);
		return listSearch;
	}
}
