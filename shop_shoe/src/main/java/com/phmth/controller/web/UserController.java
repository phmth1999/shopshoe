package com.phmth.controller.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.phmth.common.Constant;
import com.phmth.dto.FormChangePassword;
import com.phmth.dto.FormProfile;
import com.phmth.security.CustomSuccesHandler;
import com.phmth.services.IUserService;
import com.phmth.utils.CompareUtil;
import com.phmth.utils.UploadFileUtil;

@RestController
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private IUserService userService;
	
	@GetMapping("/profile")
	public ModelAndView profile() {
		ModelAndView mav = new ModelAndView(Constant.PAGE_PROFILE);
		mav.addObject("user", userService.findById(CustomSuccesHandler.getPrincipal().getId()));
		return mav;
	}

	private boolean isFileImage(MultipartFile fileImage) {
		if(fileImage != null && !fileImage.isEmpty()) {
			return true;
		}
		return false;
	}
	@PostMapping("/profile")
	public ModelAndView editProfile(@RequestParam(value = "fileImage", 
												  required = false) MultipartFile fileImage, 
									@ModelAttribute("user") FormProfile user) {
		ModelAndView mav = new ModelAndView("redirect:/profile");
		try {
			String fileName = "";
			if(isFileImage(fileImage)) {
				fileName = StringUtils.cleanPath(fileImage.getOriginalFilename());
				user.setImage(fileName);
			}
			userService.updateProfile(user, CustomSuccesHandler.getPrincipal().getId());
			if(isFileImage(fileImage)) {
				String uploadDir = "D:/workspace/springboot/shop_shoe/shop_shoe/src/main/webapp/template/web/img/user/";
				UploadFileUtil.saveFile(uploadDir, fileName, fileImage);
			}
		} catch (Exception e) {
			logger.error("Message: {} -> ", e);
		}
		return mav;
	}
	
	@GetMapping("/change-password")
	public ModelAndView changePasswordPage() {
		ModelAndView mav = new ModelAndView(Constant.PAGE_CHANGE_PASSWORD);
		mav.addObject("formPassword", new FormChangePassword());
		return mav;
	}
	
	@PostMapping("/change-password")
	public ModelAndView changePassword(@ModelAttribute("formPassword") FormChangePassword formPassword) {
		ModelAndView mav = new ModelAndView(Constant.PAGE_CHANGE_PASSWORD);
		if(CompareUtil.password(formPassword.getPassword(), formPassword.getRePassword())) {
			boolean valid = userService.changePassword(formPassword, CustomSuccesHandler.getPrincipal().getId());
			if(valid) {
				mav = new ModelAndView(Constant.REDIRECT_PAGE_LOGOUT);
			}else {
				mav.addObject("message", Constant.MESSAGE_PASSWORD_IS_INCORRECT);
			}
		}else {
			mav.addObject("message", Constant.MESSAGE_REPASSWORD_IS_INCORRECT);
		}
		return mav;
	}
	
}
