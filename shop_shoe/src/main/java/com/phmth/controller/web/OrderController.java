package com.phmth.controller.web;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.phmth.common.Constant;
import com.phmth.dto.CartDto;
import com.phmth.dto.FormOrder;
import com.phmth.entities.OrderDetailEntity;
import com.phmth.entities.OrderEntity;
import com.phmth.entities.UserEntity;
import com.phmth.security.CustomSuccesHandler;
import com.phmth.services.IOrderService;
import com.phmth.services.IUserService;

@RestController
public class OrderController {
	@Autowired
	@Qualifier("userService")
	private IUserService userService;
	
	@Autowired
	@Qualifier("orderService")
	private IOrderService orderService;
	
	@GetMapping("/order")
	public ModelAndView orderPage(HttpSession session) {
		ModelAndView mav = new ModelAndView(Constant.PAGE_ORDER);
		if(session.getAttribute("Cart") != null && !session.getAttribute("Cart").equals("{}")){
			UserEntity userEntity = userService.findById(CustomSuccesHandler.getPrincipal().getId());
			FormOrder formOrder = new FormOrder();
			formOrder.setUser(userEntity);
			mav.addObject("order", formOrder);
		}else{
			mav = new ModelAndView(Constant.REDIRECT_PAGE_HOME);
		}
		return mav;
	}
	
	@PostMapping("/order")
	public ModelAndView order(HttpSession session, @ModelAttribute("order") FormOrder formOrder) {
		ModelAndView mav = new ModelAndView(Constant.REDIRECT_PAGE_HISTORY);
		@SuppressWarnings("unchecked")
		HashMap<Long, CartDto> cart = (HashMap<Long, CartDto>) session.getAttribute("Cart");
		formOrder.setUser(userService.findById(CustomSuccesHandler.getPrincipal().getId()));
		orderService.save(formOrder, cart);
		return mav;
	}
	
	@GetMapping("/history")
	public ModelAndView historyPage(@RequestParam(value = "page", 
			  									  required = false, 
			  									  defaultValue = "1") int page) {
		ModelAndView mav = new ModelAndView(Constant.PAGE_HISTORY);
		int limit = 9;
		Sort sort = Sort.by(Sort.Direction.DESC, "id");
		Pageable pageable = PageRequest.of(page-1, limit, sort);
		UserEntity userEntity = new UserEntity();
		userEntity.setId(CustomSuccesHandler.getPrincipal().getId());
		Page<OrderEntity> listPageOrder = orderService.getAllOrderByUser(userEntity, pageable);
		List<OrderEntity> listOrder = listPageOrder.getContent();
		mav.addObject("currentPage", page);
		mav.addObject("totalPage", listPageOrder.getTotalPages());
		mav.addObject("listOrder", listOrder);
		return mav;
	}
	
	@GetMapping("/history/{orderID}")
	public ModelAndView historyPage(@RequestParam("pageHistory") int pageHistory, 
									@PathVariable("orderID") long orderID) {
		ModelAndView mav = new ModelAndView(Constant.PAGE_HISTORY_DETAIL);
		OrderEntity orderEntity = new OrderEntity();
		orderEntity.setId(orderID);
		
		List<OrderDetailEntity> listOrderDetail = orderService.getAllOrderDetailByOrder(orderEntity);
		mav.addObject("listOrderDetail", listOrderDetail);
		mav.addObject("pageHistory", pageHistory);
		return mav;
	}
}
