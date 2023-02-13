package com.phmth.repositories.Impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.phmth.dto.CartDto;
import com.phmth.dto.ProductDto;
import com.phmth.entities.ProductEntity;
import com.phmth.repositories.ICartDao;
import com.phmth.repositories.IProductRepository;
@Repository
public class CartDaoImpl implements ICartDao{
	@Autowired
	IProductRepository productRepository;
	
	public HashMap<Long, CartDto> AddCart(long id, HashMap<Long, CartDto> cart, int quanty)throws Exception {
		CartDto itemCart = new CartDto();
		try {
			ProductEntity product = productRepository.findById(id).get();
			ProductDto productDto = new ProductDto();
			productDto.setId(product.getId());
			productDto.setName(product.getName());
			productDto.setPrice(product.getPrice());
			productDto.setImage(product.getImage());
			productDto.setQuantity(product.getQuantity());
			productDto.setCategoryID(product.getCategory().getId());
			productDto.setBrandID(product.getBrand().getId());
			
			if (product != null && cart.containsKey(id)) {
				itemCart = cart.get(id);
				itemCart.setQuanty(itemCart.getQuanty() + quanty);
				itemCart.setTotalPrice(itemCart.getQuanty() * itemCart.getProduct().getPrice());
			} else {
				if(quanty>1){
					itemCart.setProduct(productDto);
					itemCart.setQuanty(quanty);
					itemCart.setTotalPrice(itemCart.getQuanty() * itemCart.getProduct().getPrice());
				}else{
					itemCart.setProduct(productDto);
					itemCart.setQuanty(1);
					itemCart.setTotalPrice(product.getPrice());
				}
			}
			cart.put(id, itemCart);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cart;
	}
	
	public HashMap<Long, CartDto> EditCart(long id, int quanty, HashMap<Long, CartDto> cart)throws Exception {
		try {
			if (cart == null) {
				return cart;
			}
			CartDto itemCart = new CartDto();
			if (cart.containsKey(id)) {
				itemCart = cart.get(id);
				itemCart.setQuanty(quanty);
				itemCart.setTotalPrice(quanty * itemCart.getProduct().getPrice());
			}
			cart.put(id, itemCart);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cart;
	}
	
	public HashMap<Long, CartDto> DeleteCart(long id, HashMap<Long, CartDto> cart) throws Exception{
		try {
			if (cart == null) {
				return cart;
			}

			if (cart.containsKey(id)) {
				cart.remove(id);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cart;
	}
	
	public int TotalQuanty(HashMap<Long, CartDto> cart)throws Exception {
		int totalQuanty = 0;
		try {
			for(Map.Entry<Long, CartDto> itemCart : cart.entrySet()) {
				totalQuanty += itemCart.getValue().getQuanty();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalQuanty;
	}
	
	public double TotalPrice(HashMap<Long, CartDto> cart)throws Exception {
		double totalPrice = 0;
		try {
			for(Map.Entry<Long, CartDto> itemCart : cart.entrySet()) {
				totalPrice += itemCart.getValue().getTotalPrice();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalPrice;
	}
}
