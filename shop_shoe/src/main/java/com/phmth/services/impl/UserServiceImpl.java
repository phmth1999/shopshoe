package com.phmth.services.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.phmth.common.status.RoleStatus;
import com.phmth.common.status.UserStatus;
import com.phmth.controller.admin.AccountController;
import com.phmth.dto.FormChangePassword;
import com.phmth.dto.FormForgotPassword;
import com.phmth.dto.FormProfile;
import com.phmth.dto.FormRegister;
import com.phmth.entities.UserEntity;
import com.phmth.repositories.IUserRepository;
import com.phmth.services.IUserService;
import com.phmth.utils.CompareUtil;
import com.phmth.utils.CheckNoEmptyUtil;

@Service
@Qualifier("userService")
public class UserServiceImpl implements IUserService {
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(AccountController.class);
	@Autowired
	private IUserRepository userRepository;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public UserEntity findByUsername(String username) {
		return userRepository.findByUsername(username);
	}

	@Override
	public List<UserEntity> findAll() {
		return userRepository.findAll();
	}

	@Override
	public UserEntity findById(long id) {
		return userRepository.findById(id).get();
	}

	@Override
	public UserEntity register(FormRegister newUser) {
		UserEntity userEntity = new UserEntity();
		userEntity.setUsername(newUser.getUsername());
		userEntity.setPassword(passwordEncoder.encode(newUser.getPassword()));
		userEntity.setFullname(newUser.getFullname());
		userEntity.setEmail(newUser.getEmail());
		userEntity.setPhone(newUser.getPhone());
		userEntity.setAddress(newUser.getAddress());
		userEntity.setRole(RoleStatus.ROLE_USER.toString());
		userEntity.setStatus(UserStatus.InActivated.toString());
		return userRepository.save(userEntity);
	}

	@Override
	public void delete(UserEntity user) {
		userRepository.delete(user);
	}

	@Override
	public void deleteById(long id) {
		userRepository.deleteById(id);
	}

	@Override
	public long count() {
		return userRepository.count();
	}

	@Override
	public void updateProfile(FormProfile newUser, long id) {
		UserEntity userEntity = userRepository.findById(id).get();
		userEntity.setFullname(newUser.getFullname());
		userEntity.setEmail(newUser.getEmail());
		userEntity.setPhone(newUser.getPhone());
		userEntity.setAddress(newUser.getAddress());
		if(CheckNoEmptyUtil.image(newUser.getImage())) {
			userEntity.setImage(newUser.getImage());
		}
		userRepository.save(userEntity);
	}
	
	@Override
	public boolean changePassword(FormChangePassword formPassword, long id) {
		UserEntity userEntity = userRepository.findById(id).get();
		if(CompareUtil.password(passwordEncoder.encode(formPassword.getPassword()), userEntity.getPassword())) {
			userEntity.setPassword(passwordEncoder.encode(formPassword.getNewPassword()));
			userRepository.save(userEntity);
			return true;
		}
		return false;
	}

	@Override
	public boolean usernameExist(String username) {
		if(userRepository.existsByUsername(username)) {
			return true;
		}
		return false;
	}

	@Override
	public boolean emailExist(String email) {
		if(userRepository.existsByUsername(email)) {
			return true;
		}
		return false;
	}

	@Override
	public boolean phoneExist(String phone) {
		if(userRepository.existsByUsername(phone)) {
			return true;
		}
		return false;
	}

	@Override
	public boolean changePassword(FormForgotPassword formForgotPassword) {
		UserEntity userEntity = userRepository.findByEmail(formForgotPassword.getEmail());
		if(userEntity != null) {
			userEntity.setPassword(passwordEncoder.encode(formForgotPassword.getNewPassword()));
			userRepository.save(userEntity);
			return true;
		}
		return false;
	}

	@Override
	public Page<UserEntity> getAllAccount(Pageable pageable) {
		return userRepository.findAll(pageable);
	}

	@Override
	public UserEntity editStatus(long userID, String status) {
		UserEntity userEntity = userRepository.findById(userID).get();
		userEntity.setStatus(status);
		return userRepository.save(userEntity);
	}

	@Override
	public UserEntity editRole(long userID, String role) {
		UserEntity userEntity = userRepository.findById(userID).get();
		userEntity.setRole(role);
		return userRepository.save(userEntity);
	}


}
