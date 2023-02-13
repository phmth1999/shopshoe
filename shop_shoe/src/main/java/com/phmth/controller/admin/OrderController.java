package com.phmth.controller.admin;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.phmth.common.Constant;
import com.phmth.entities.OrderDetailEntity;
import com.phmth.entities.OrderEntity;
import com.phmth.services.IOrderService;

@RestController("adminOrder")
public class OrderController {
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	@Autowired
	private IOrderService orderService;
	
	@GetMapping("/admin/order")
	public ModelAndView accountPage(@RequestParam(value = "page", 
	  											  required = false, 
	  											  defaultValue = "1") int page) {
		ModelAndView mav = new ModelAndView(Constant.PAGE_ADMIN_ORDER);
		int limit = 6;
		Sort sort = Sort.by(Sort.Direction.DESC, "id");
		Pageable pageable = PageRequest.of(page-1, limit, sort);
		Page<OrderEntity> listPageOrder = orderService.getAllOrder(pageable);
		List<OrderEntity> listOrder = listPageOrder.getContent();
		mav.addObject("currentPage", page);
		mav.addObject("totalPage", listPageOrder.getTotalPages());
		mav.addObject("listOrder", listOrder);
		return mav;
	}
	@PostMapping("/admin/order/edit-status")
	public ModelAndView blockUser(@RequestParam("status") String status,
								  @RequestParam("orderID") long orderID, 
								  @RequestParam("pageOrder") int pageOrder) {
		ModelAndView mav = new ModelAndView(Constant.REDIRECT_PAGE_ADMIN_ORDER+"?page="+pageOrder);
		orderService.editStatus(orderID, status);
		return mav;
	}
	@GetMapping("/admin/order/{orderID}")
	public ModelAndView historyPage(@RequestParam("pageOrder") int pageOrder, 
									@PathVariable("orderID") long orderID) {
		ModelAndView mav = new ModelAndView(Constant.PAGE_ADMIN_ORDER_DETAIL);
		OrderEntity orderEntity = new OrderEntity();
		orderEntity.setId(orderID);
		
		List<OrderDetailEntity> listOrderDetail = orderService.getAllOrderDetailByOrder(orderEntity);
		mav.addObject("listOrderDetail", listOrderDetail);
		mav.addObject("pageOrder", pageOrder);
		
		return mav;
	}
}
