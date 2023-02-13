package com.phmth.utils;

public class CheckNoEmptyUtil {
	public static boolean image(String image){
		if(image != null && !image.isEmpty()) {
			return true;
		}
		return false;
	}
}
