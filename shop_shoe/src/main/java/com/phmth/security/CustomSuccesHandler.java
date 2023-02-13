package com.phmth.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component
public class CustomSuccesHandler implements AuthenticationSuccessHandler {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomSuccesHandler.class);

	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		try {
			redirectStrategy.sendRedirect(request, response, determineTargetUrl(authentication));
		} catch (Exception e) {
			logger.error("Message: {} -> ",e);
		}
	}
	
	public static UserLogin getPrincipal() {
		return (UserLogin) (SecurityContextHolder.getContext()).getAuthentication().getPrincipal();
	}

	private String determineTargetUrl(Authentication authentication) {
		String url = "";
		List<String> roles = getAuthorities(authentication);
		if (isAdmin(roles)) {
			url = "/admin/home";
		} else if (isUser(roles)) {
			url = "/home";
		}
		return url;
	}
	
	private List<String> getAuthorities(Authentication authentication){
		List<String> results = new ArrayList<String>();
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		for (GrantedAuthority authority : authorities) {
			results.add(authority.getAuthority());
		}
		return results;
	}

	private boolean isAdmin(List<String> roles) {
		if (roles.contains("ROLE_ADMIN")) {
			return true;
		}
		return false;
	}

	private boolean isUser(List<String> roles){
		if (roles.contains("ROLE_USER")) {
			return true;
		}
		return false;
	}

}
