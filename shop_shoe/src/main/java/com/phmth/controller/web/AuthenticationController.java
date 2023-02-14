package com.phmth.controller.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.phmth.common.Constant;
import com.phmth.dto.FormForgotPassword;
import com.phmth.dto.FormLogin;
import com.phmth.dto.FormRegister;
import com.phmth.entities.UserEntity;
import com.phmth.services.IUserService;
import com.phmth.utils.CompareUtil;
import com.phmth.utils.EmailUtil;
import com.phmth.utils.RandomCharUtil;

@RestController
public class AuthenticationController {
	
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(AuthenticationController.class);

	@Autowired
	@Qualifier("userService")
	private IUserService userService;
	
	@Autowired
	private EmailUtil email;

	@GetMapping("/login")
	public ModelAndView login(HttpSession session) {
		ModelAndView mav = new ModelAndView(Constant.PAGE_LOGIN);
		mav.addObject("user", new FormLogin());
		if(session.getAttribute("sessionMessage") != null && !session.getAttribute("sessionMessage").toString().isEmpty()) {
			String sessionMessage = (String) session.getAttribute("sessionMessage");
			session.removeAttribute("sessionMessage");
			mav.addObject("message", sessionMessage);
		}
		return mav;
	}

	@GetMapping("/logout")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView(Constant.REDIRECT_PAGE_LOGIN);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return mav;
	}

	@GetMapping("/accessDenied")
	public ModelAndView accessDenied() {
		ModelAndView mav = new ModelAndView(Constant.REDIRECT_PAGE_LOGIN_ACCESSDENIED);
		return mav;
	}

	@GetMapping("/register")
	public ModelAndView registerPage() {
		ModelAndView mav = new ModelAndView(Constant.PAGE_REGISTER);
		mav.addObject("user", new FormRegister());
		return mav;
	}

	@PostMapping("/register")
	public ModelAndView register(@ModelAttribute("user") FormRegister user, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView(Constant.PAGE_REGISTER);
		if(!CompareUtil.password(user.getPassword(), user.getRePassword())) {
			mav.addObject("message", Constant.MESSAGE_REPASSWORD_IS_INCORRECT);
			return mav;
		}else if(userService.usernameExist(user.getUsername())) {
			mav.addObject("message", Constant.MESSAGE_USERNAME_EXIST);
			return mav;
		}else if(userService.emailExist(user.getEmail())) {
			mav.addObject("message", Constant.MESSAGE_EMAIL_EXIST);
			return mav;
		}else if(userService.phoneExist(user.getPhone())) {
			mav.addObject("message", Constant.MESSAGE_PHONE_EXIST);
			return mav;
		}else {
			mav = new ModelAndView(Constant.REDIRECT_REGISTER_VERIFY);
			String verificationCode = RandomCharUtil.generateRandom6Char();
			user.setVerificationCode(verificationCode);
			session.setAttribute("newUser", user);
			email.sendEmail(user.getEmail(), "Verification register", "Code: "+verificationCode);
		}
		return mav;
	}
	
	@GetMapping("/register/verify")
	public ModelAndView verifyPage() {
		ModelAndView mav = new ModelAndView(Constant.PAGE_VERIFY);
		return mav;
	}

	@PostMapping("/register/verify")
	public ModelAndView xulymaxacnhan(HttpSession session, @RequestParam("verificationCode") String paramVerificationCode) {
		ModelAndView mav = null;
		FormRegister newUser = (FormRegister) session.getAttribute("newUser");
		session.removeAttribute("newUser");
		if (CompareUtil.verificationCode(paramVerificationCode, newUser.getVerificationCode())) {
			mav = new ModelAndView(Constant.REDIRECT_PAGE_LOGIN);
			UserEntity userEntity = userService.register(newUser);
			if (userEntity == null) {
				session.setAttribute("sessionMessage", Constant.MESSAGE_REGISTER_FAIL);
			} else {
				session.setAttribute("sessionMessage", Constant.MESSAGE_REGISTER_SUCCESS);
			}
		} else {
			mav = new ModelAndView(Constant.PAGE_VERIFY);
			mav.addObject("message", Constant.MESSAGE_VERIFICATION_CODE_IS_INCORRECT);
		}
		return mav;
	}
	
	@GetMapping("/forgot-password")
	public ModelAndView forgotPasswordPage() {
		ModelAndView mav = new ModelAndView(Constant.PAGE_FORGOT_PASSWORD);
		mav.addObject("formForgotPassword", new FormForgotPassword());
		return mav;
	}
	
	@PostMapping("/forgot-password")
	public ModelAndView forgotPassword(HttpSession session, @ModelAttribute("formForgotPassword") FormForgotPassword formForgotPassword) {
		ModelAndView mav = new ModelAndView(Constant.REDIRECT_FORGOT_PASSWORD_VERIFY);
		String verificationCode = RandomCharUtil.generateRandom6Char();
		formForgotPassword.setVerificationCode(verificationCode);
		session.setAttribute("sessionFormForgotPassword", formForgotPassword);
		email.sendEmail(formForgotPassword.getEmail(), "Verification Forgot Password", "Code: "+verificationCode);
		return mav;
	}
	
	@GetMapping("/forgot-password/verify")
	public ModelAndView verifyForgotPasswordPage() {
		ModelAndView mav = new ModelAndView(Constant.PAGE_VERIFY);
		return mav;
	}
	
	@PostMapping("/forgot-password/verify")
	public ModelAndView verifyForgotPassword(HttpSession session, @RequestParam("verificationCode") String paramVerificationCode) {
		ModelAndView mav = null;
		FormForgotPassword sessionFormForgotPassword = (FormForgotPassword) session.getAttribute("sessionFormForgotPassword");
		if(CompareUtil.verificationCode(paramVerificationCode, sessionFormForgotPassword.getVerificationCode())) {
			mav = new ModelAndView(Constant.REDIRECT_PAGE_CHANGE_FORGOT_PASSWORD);
		}else {
			mav = new ModelAndView(Constant.PAGE_VERIFY);
			mav.addObject("message", Constant.MESSAGE_VERIFICATION_CODE_IS_INCORRECT);
		}
		return mav;
	}
	
	@GetMapping("/forgot-password/change-password")
	public ModelAndView changeForgotPasswordPage() {
		ModelAndView mav = new ModelAndView(Constant.PAGE_CHANGE_FORGOT_PASSWORD);
		mav.addObject("formForgotPassword", new FormForgotPassword());
		return mav;
	}
	
	@PostMapping("/forgot-password/change-password")
	public ModelAndView changeForgotPassword(HttpSession session, @ModelAttribute("formForgotPassword") FormForgotPassword formForgotPassword) {
		ModelAndView mav = new ModelAndView(Constant.REDIRECT_PAGE_LOGIN);
		FormForgotPassword sessionFormForgotPassword = (FormForgotPassword) session.getAttribute("sessionFormForgotPassword");
		session.removeAttribute("sessionFormForgotPassword");
		formForgotPassword.setEmail(sessionFormForgotPassword.getEmail());
		boolean valid = userService.changePassword(formForgotPassword);
		if(valid) {
			session.setAttribute("sessionMessage", Constant.MESSAGE_CHANGE_PASSWORD_SUCCESS);
		}else {
			session.setAttribute("sessionMessage", Constant.MESSAGE_CHANGE_PASSWORD_FAIL);
		}
		return mav;
	}

}
