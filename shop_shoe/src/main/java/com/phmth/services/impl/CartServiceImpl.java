package com.phmth.services.impl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.phmth.dto.CartDto;
import com.phmth.repositories.ICartDao;
import com.phmth.services.ICartService;
@Service
@Qualifier("cartService")
public class CartServiceImpl implements ICartService{
	@Autowired
	private ICartDao cartDao;

	public HashMap<Long, CartDto> AddCart(long id, HashMap<Long, CartDto> cart, int quanty){
		HashMap<Long, CartDto> listCartDto = null;
		try {
			listCartDto = cartDao.AddCart(id, cart, quanty);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listCartDto;
	}

	public HashMap<Long, CartDto> EditCart(long id, int quanty, HashMap<Long, CartDto> cart)  {
		HashMap<Long, CartDto> listCartDto = null;
		try {
			listCartDto = cartDao.EditCart(id, quanty, cart);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listCartDto;
	}

	public HashMap<Long, CartDto> DeleteCart(long id, HashMap<Long, CartDto> cart)  {
		HashMap<Long, CartDto> listCartDto = null;
		try {
			listCartDto = cartDao.DeleteCart(id, cart);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listCartDto;
	}

	public int TotalQuanty(HashMap<Long, CartDto> cart){
		int totalQuanty = 0;
		try {
			totalQuanty = cartDao.TotalQuanty(cart);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalQuanty;
	}

	public double TotalPrice(HashMap<Long, CartDto> cart)  {
		double totalPrice = 0;
		try {
			totalPrice = cartDao.TotalPrice(cart);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalPrice;
	}
}
