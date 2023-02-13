package com.phmth.repositories;

import java.util.HashMap;

import com.phmth.dto.CartDto;

public interface ICartDao {
	HashMap<Long, CartDto> AddCart(long id, HashMap<Long, CartDto> cart, int quanty) throws Exception;

	HashMap<Long, CartDto> EditCart(long id, int quanty, HashMap<Long, CartDto> cart) throws Exception;

	HashMap<Long, CartDto> DeleteCart(long id, HashMap<Long, CartDto> cart) throws Exception;

	int TotalQuanty(HashMap<Long, CartDto> cart) throws Exception;

	double TotalPrice(HashMap<Long, CartDto> cart) throws Exception;
}
