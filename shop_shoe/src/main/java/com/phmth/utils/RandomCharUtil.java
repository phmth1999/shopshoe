package com.phmth.utils;

import java.util.Random;

public class RandomCharUtil {
	public static String generateRandom6Char() {
		String srcChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz01234556789";
		int length = 5;
		StringBuilder sb = new StringBuilder();
		Random random = new Random();
		for (int i = 0; i < length; i++) {
			sb.append(srcChars.charAt(random.nextInt(srcChars.length())));
		}
		return sb.toString();
	}
}
