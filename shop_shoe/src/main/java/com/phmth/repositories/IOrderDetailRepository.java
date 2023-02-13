package com.phmth.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.phmth.entities.OrderDetailEntity;
import com.phmth.entities.OrderEntity;

public interface IOrderDetailRepository extends JpaRepository<OrderDetailEntity, Long>{

	List<OrderDetailEntity> findByOrder(OrderEntity orderEntity);


}
