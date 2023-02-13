package com.phmth.controller.admin;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.phmth.common.Constant;

@RestController("admin")
public class HomeController {
	@GetMapping("/admin/home")
	public ModelAndView adminPage() {
		ModelAndView mav = new ModelAndView(Constant.PAGE_ADMIN_HOME);
		return mav;
	}
}
