package com.phmth.utils;

public class CompareUtil {
	public static boolean password(String password1, String password2) {
		if(password1.equals(password2)) {
			return true;
		}
		return false;
	}
	
	public static boolean verificationCode(String verificationCode1, String verificationCode2) {
		if (verificationCode1.equals(verificationCode2)) {
			return true;
		}
		return false;
	}
	
}
