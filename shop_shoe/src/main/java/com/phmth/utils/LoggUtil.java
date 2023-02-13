package com.phmth.utils;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

public class LoggUtil {
	public static boolean isLogged() {
		if (SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof UserDetails) {
			return true;
		}
		return false;
	}
}
