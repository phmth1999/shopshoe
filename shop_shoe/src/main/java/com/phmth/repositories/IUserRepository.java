package com.phmth.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.phmth.entities.UserEntity;

@Repository
public interface IUserRepository extends JpaRepository<UserEntity, Long> {

	UserEntity findByUsernameAndStatus(String username, String status);

	UserEntity findByUsername(String username);

	boolean existsByUsername(String username);

	boolean existsByEmail(String email);

	boolean existsByPhone(String phone);

	UserEntity findByEmail(String email);

}
