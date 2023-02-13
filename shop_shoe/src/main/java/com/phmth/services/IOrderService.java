package com.phmth.services;

import java.util.HashMap;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.phmth.dto.CartDto;
import com.phmth.dto.FormOrder;
import com.phmth.entities.OrderDetailEntity;
import com.phmth.entities.OrderEntity;
import com.phmth.entities.UserEntity;

public interface IOrderService {

	void save( FormOrder formOrder, HashMap<Long, CartDto> cart);

	Page<OrderEntity> getAllOrderByUser(UserEntity userEntity, Pageable pageable);

	List<OrderDetailEntity> getAllOrderDetailByOrder(OrderEntity orderEntity);

	Page<OrderEntity> getAllOrder(Pageable pageable);

	OrderEntity editStatus(long orderID, String status);

}
