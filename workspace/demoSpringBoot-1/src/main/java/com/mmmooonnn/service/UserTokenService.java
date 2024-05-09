package com.mmmooonnn.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mmmooonnn.model.UserTokenBean;
import com.mmmooonnn.model.UserTokenRepository;

@Service
public class UserTokenService {
	
	@Autowired
	private UserTokenRepository userTokenRepository;
	
	public void insert(UserTokenBean userTokenBean) {
		userTokenRepository.save(userTokenBean);
	}
	
	public Optional<UserTokenBean> findByUserid(Integer userId) {
		Optional<UserTokenBean> result = userTokenRepository.findByUserid(userId);
		
		return result;
	}
}
