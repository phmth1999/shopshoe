package com.phmth.repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.phmth.entities.OrderEntity;
import com.phmth.entities.UserEntity;

public interface IOrderRepository extends JpaRepository<OrderEntity, Long>{

	Page<OrderEntity> findByUser(UserEntity userEntity, Pageable pageable);


}
