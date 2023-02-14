package com.phmth.controller.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.phmth.entities.ProductEntity;
import com.phmth.entities.SlideEntity;
import com.phmth.services.IProductService;
import com.phmth.services.ISlideService;

@RestController
public class HomeController {
	@Autowired
	@Qualifier("slideService")
	private ISlideService slideService;
	
	@Autowired
	@Qualifier("productService")
	private IProductService productService;
	

	@GetMapping("/home")
	public ModelAndView homePage() {
		ModelAndView mav = new ModelAndView("web/home");
		List<SlideEntity> listSlide = slideService.findAll();
		List<ProductEntity> listTopNewProductCategoryMen = productService.getLatestProductByCategory((long)1);
		List<ProductEntity> listTopNewProductCategoryWomen = productService.getLatestProductByCategory((long)2);
		mav.addObject("listSlide", listSlide);
		mav.addObject("listTopNewProductCategoryMen", listTopNewProductCategoryMen);
		mav.addObject("listTopNewProductCategoryWomen", listTopNewProductCategoryWomen);
		return mav;
	}
}
