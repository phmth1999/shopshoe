package com.phmth.controller.web;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.phmth.common.Constant;

@RestController
public class BlogController {

	@GetMapping("/blog")
	public ModelAndView blogPage() {
		ModelAndView mav = new ModelAndView(Constant.PAGE_BLOG);
		return mav;
	}

	@GetMapping("/blog/{idBog}")
	public ModelAndView blogDeatilPage(@PathVariable("idBog") long idBlog) {
		ModelAndView mav = new ModelAndView(Constant.PAGE_BLOG_DETAIL);
		return mav;
	}
}
