package com.phmth.services;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.phmth.dto.FormChangePassword;
import com.phmth.dto.FormForgotPassword;
import com.phmth.dto.FormProfile;
import com.phmth.dto.FormRegister;
import com.phmth.entities.UserEntity;

public interface IUserService{

	void updateProfile(FormProfile newUser, long id);

	long count();

	void deleteById(long id);

	void delete(UserEntity user);

	UserEntity register(FormRegister newUser);

	UserEntity findById(long id);

	List<UserEntity> findAll();

	UserEntity findByUsername(String username);
	
	boolean changePassword(FormChangePassword formPassword, long id);
	
	boolean changePassword(FormForgotPassword formPassword);

	boolean usernameExist(String username);
	
	boolean emailExist(String email);
	
	boolean phoneExist(String phone);

	Page<UserEntity> getAllAccount(Pageable pageable);

	UserEntity editStatus(long userID, String status);

	UserEntity editRole(long userID, String role);
	
}
