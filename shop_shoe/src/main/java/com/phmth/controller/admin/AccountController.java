package com.phmth.controller.admin;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.phmth.common.Constant;
import com.phmth.entities.UserEntity;
import com.phmth.security.CustomSuccesHandler;
import com.phmth.services.IUserService;

@RestController
public class AccountController {
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(AccountController.class);
	@Autowired
	@Qualifier("userService")
	private IUserService userService;
	
	@GetMapping("/admin/account")
	public ModelAndView accountPage(@RequestParam(value = "page", 
	  											  required = false, 
	  											  defaultValue = "1") int page) {
		ModelAndView mav = new ModelAndView(Constant.PAGE_ADMIN_ACCOUNT);
		int limit = 6;
		Sort sort = Sort.by(Sort.Direction.DESC, "id");
		Pageable pageable = PageRequest.of(page-1, limit, sort);
		Page<UserEntity> listPageAccount = userService.getAllAccount(pageable);
		List<UserEntity> listAccount = listPageAccount.getContent();
		mav.addObject("currentPage", page);
		mav.addObject("totalPage", listPageAccount.getTotalPages());
		mav.addObject("listAccount", listAccount);
		mav.addObject("userLoginID", userService.findById(CustomSuccesHandler.getPrincipal().getId()));
		return mav;
	}
	@PostMapping("/admin/account/edit-status")
	public ModelAndView blockUser(@RequestParam("status") String status,
								  @RequestParam long userID, 
								  @RequestParam("pageAccount") int pageAccount) {
		ModelAndView mav = new ModelAndView(Constant.REDIRECT_PAGE_ADMIN_ACCOUNT+"?page="+pageAccount);
		userService.editStatus(userID, status);
		return mav;
	}
	@PostMapping("/admin/account/edit-role")
	public ModelAndView editRole(@RequestParam("role") String role,
								 @RequestParam("userID") long userID,
								 @RequestParam("pageAccount") int pageAccount) {
		ModelAndView mav = new ModelAndView(Constant.REDIRECT_PAGE_ADMIN_ACCOUNT+"?page="+pageAccount);
		userService.editRole(userID,role);
		return mav;
	}
}
