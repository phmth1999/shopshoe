package com.phmth.controller.web;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.phmth.common.Constant;

@RestController
public class ContactController {

	@GetMapping("/contact")
	public ModelAndView contactPage() {
		ModelAndView mav = new ModelAndView(Constant.PAGE_CONTACT);
		return mav;
	}
}
