package com.phmth.security;

import java.util.HashSet;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.phmth.common.status.UserStatus;
import com.phmth.entities.UserEntity;
import com.phmth.repositories.IUserRepository;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

	private static final Logger logger = LoggerFactory.getLogger(UserDetailsServiceImpl.class);

	@Autowired
	private IUserRepository userRepository;

	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		try {
			UserEntity user = userRepository.findByUsernameAndStatus(username, UserStatus.InActivated.toString());
			if (user != null) {
				Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
				grantedAuthorities.add(new SimpleGrantedAuthority(user.getRole()));
				UserLogin userLogin = new UserLogin(user.getUsername(), user.getPassword(), grantedAuthorities);
				userLogin.setId(user.getId());
				userLogin.setFullName(user.getFullname());
				return userLogin;
			} else {
				logger.error("No user found with username: "+username);
			}
		} catch (Exception e) {
			logger.error("Message: {} -> ", e);
		}
		return null;
	}
}
