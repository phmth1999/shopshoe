package com.phmth.services;

import java.util.HashMap;

import com.phmth.dto.CartDto;

public interface ICartService {
	HashMap<Long, CartDto> AddCart(long id, HashMap<Long, CartDto> cart, int quanty) ;
	HashMap<Long, CartDto> EditCart(long id, int quanty, HashMap<Long, CartDto> cart) ;
	HashMap<Long, CartDto> DeleteCart(long id, HashMap<Long, CartDto> cart) ;
	int TotalQuanty(HashMap<Long, CartDto> cart) ;
	double TotalPrice(HashMap<Long, CartDto> cart) ;
}
