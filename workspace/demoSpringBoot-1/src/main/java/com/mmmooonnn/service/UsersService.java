package com.mmmooonnn.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mmmooonnn.model.UsersBeanNew;
import com.mmmooonnn.model.UsersRepository;
import com.mmmooonnn.model.UserContactNew;
import com.mmmooonnn.model.UserContactRepository;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class UsersService {
	
	@Autowired
	private UserContactRepository uContactRepository;
	@Autowired
	private UsersRepository uRepository;
	
	//信箱是否存在
	public boolean isEmailExist(String email) {
		int resout = uContactRepository.countByEmail(email);
		return resout>0;
	}
	public UsersBeanNew findByEmail(String email) {
		UserContactNew userContactNew = uContactRepository.findByEmail(email);
		Optional<UsersBeanNew> result = uRepository.findById(userContactNew.getContactId());
		if(result.isPresent()) {
			return result.get();
		}
		return null;
	}
	
	public void insert(UsersBeanNew usersBeanNew) {
		uRepository.save(usersBeanNew);
	}
	
	public void update(UsersBeanNew usersBeanNew) {
		uRepository.save(usersBeanNew);
	}
	
	public void deleteById(Integer id) {
		uRepository.deleteById(id);
	}
	
	public UsersBeanNew findUserById(Integer id) {
		Optional<UsersBeanNew> result = uRepository.findById(id);
		
		if(result.isPresent()) {
			return result.get();
		}
		return null;
	}
	
	public List<UsersBeanNew> getAll(){
		return uRepository.findAll();
	}
	
	
}
