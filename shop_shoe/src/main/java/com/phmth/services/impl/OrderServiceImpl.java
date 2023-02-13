package com.phmth.services.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.phmth.common.status.OrderStatus;
import com.phmth.dto.CartDto;
import com.phmth.dto.FormOrder;
import com.phmth.entities.OrderDetailEntity;
import com.phmth.entities.OrderEntity;
import com.phmth.entities.UserEntity;
import com.phmth.repositories.IOrderDetailRepository;
import com.phmth.repositories.IOrderRepository;
import com.phmth.repositories.IProductRepository;
import com.phmth.services.IOrderService;
@Service
public class OrderServiceImpl implements IOrderService{
	@Autowired
	private IOrderRepository orderRepository;
	
	@Autowired 
	private IOrderDetailRepository orderDetailRepository;
	
	@Autowired
	private IProductRepository productRepository;
	
	@Override
	public void save( FormOrder formOrder, HashMap<Long, CartDto> cart) {
		OrderEntity orderEntity = new OrderEntity();
		orderEntity.setDeliveryAddress(formOrder.getDeliveryAddress());
		orderEntity.setOrderDate(new Date());
		orderEntity.setStatus(OrderStatus.Pending.toString());
		orderEntity.setUser(formOrder.getUser());
		orderEntity.setTotalPrice(formOrder.getTotalPrice());
		orderEntity.setTotalQuantity(formOrder.getTotalQuantity());
		OrderEntity saved = orderRepository.save(orderEntity);
		
		for (Map.Entry<Long, CartDto> itemCart : cart.entrySet()) {
			OrderDetailEntity orderDetail = new OrderDetailEntity();
			orderDetail.setOrder(saved);
			orderDetail.setProduct(productRepository.findById(itemCart.getValue().getProduct().getId()).get());
			orderDetail.setQuantity(itemCart.getValue().getQuanty());
			orderDetail.setPrice(itemCart.getValue().getTotalPrice());
			orderDetailRepository.save(orderDetail);
		}
	}

	@Override
	public Page<OrderEntity> getAllOrderByUser(UserEntity userEntity, Pageable pageable) {
		return orderRepository.findByUser(userEntity, pageable);
	}

	@Override
	public List<OrderDetailEntity> getAllOrderDetailByOrder(OrderEntity orderEntity) {
		return orderDetailRepository.findByOrder(orderEntity);
	}

	@Override
	public Page<OrderEntity> getAllOrder(Pageable pageable) {
		return orderRepository.findAll(pageable);
	}

	@Override
	public OrderEntity editStatus(long orderID, String status) {
		OrderEntity orderEntity = orderRepository.findById(orderID).get();
		orderEntity.setStatus(status);
		return orderRepository.save(orderEntity);
	}

}
