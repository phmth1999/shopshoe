package com.phmth.controller.web.api;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.phmth.common.Constant;
import com.phmth.dto.CartDto;
import com.phmth.services.ICartService;

@RestController
public class CartApi {
	
	@Autowired
	@Qualifier("cartService")
	private ICartService cartService;

	@GetMapping("/cart")
	public ModelAndView Index() throws Exception{
		ModelAndView mav = null;
		try {
			mav = new ModelAndView(Constant.PAGE_CART);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@SuppressWarnings("unchecked")
	@PostMapping("/api/addcart/{id}")
	public HashMap<Long, CartDto> AddCart(HttpServletRequest request, HttpSession session, @PathVariable long id) {
		HashMap<Long, CartDto> cart = new HashMap<>();
		try {	
			cart = (HashMap<Long, CartDto>) session.getAttribute("Cart");
			if (cart == null) {
				cart = new HashMap<Long, CartDto>();
			}
			if(request.getParameter("quanty")!=null && !request.getParameter("quanty").isEmpty()){
				int quanty = Integer.parseInt(request.getParameter("quanty").toString());
				cart = cartService.AddCart(id, cart, quanty);
			}else{
				cart = cartService.AddCart(id, cart, 1);
			}
			session.setAttribute("Cart", cart);
			session.setAttribute("TotalQuantyCart", cartService.TotalQuanty(cart));
			session.setAttribute("TotalPriceCart", cartService.TotalPrice(cart));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cart;
	}

	@SuppressWarnings("unchecked")
	@PostMapping("/api/editcart/{id}/{quanty}")
	public HashMap<Long, CartDto> EditCart(HttpServletRequest request, HttpSession session, @PathVariable long id, @PathVariable int quanty){
		HashMap<Long, CartDto> cart = new HashMap<>();
		try {
			cart = (HashMap<Long, CartDto>) session.getAttribute("Cart");
			if (cart == null) {
				cart = new HashMap<Long, CartDto>();
			}
			cart = cartService.EditCart(id, quanty, cart);
			session.setAttribute("Cart", cart);
			session.setAttribute("TotalQuantyCart", cartService.TotalQuanty(cart));
			session.setAttribute("TotalPriceCart", cartService.TotalPrice(cart));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cart;
	}

	@SuppressWarnings("unchecked")
	@PostMapping("/api/deletecart/{id}")
	public HashMap<Long, CartDto> DeleteCart(HttpServletRequest request, HttpSession session, @PathVariable long id) {
		HashMap<Long, CartDto> cart = new HashMap<>();
		try {
			cart = (HashMap<Long, CartDto>) session.getAttribute("Cart");
			if (cart == null) {
				cart = new HashMap<Long, CartDto>();
			}
			cart = cartService.DeleteCart(id, cart);
			session.setAttribute("Cart", cart);
			session.setAttribute("TotalQuantyCart", cartService.TotalQuanty(cart));
			session.setAttribute("TotalPriceCart", cartService.TotalPrice(cart));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cart;
	}
}
