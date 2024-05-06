package com.mmmooonnn.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mmmooonnn.model.MatchUserDetailsDTO;
import com.mmmooonnn.model.MatchesRepository;
import com.mmmooonnn.model.UsersBeanNew;
import com.mmmooonnn.model.UsersRepository;

@Service
public class MatchesService {

	@Autowired
	private MatchesRepository matchesRepository;
	
	@Autowired
	private UsersRepository usersRepository;

	public List<UsersBeanNew> getMatchesByStatus(Integer userid) {
		return usersRepository.findMatchesByStatus(userid);
	}

}
