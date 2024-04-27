package com.mmmooonnn.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mmmooonnn.model.BackstageBean;
import com.mmmooonnn.model.BackstageRepository;

@Service
@Transactional
public class BackstageService {
	
	@Autowired
	private BackstageRepository bRepository;
	
	public boolean findUserByEmailPassword(String email , String password) {
		Optional<BackstageBean> result = bRepository.findByEmail(email);
		
		if(result.isPresent()) {
			if(result.get().getPassword().equals(password)) {
				return true;
			}else {
				return false;
			}
		}
		return false;
	}
}
