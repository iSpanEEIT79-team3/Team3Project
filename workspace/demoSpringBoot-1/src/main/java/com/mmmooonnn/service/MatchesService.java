package com.mmmooonnn.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mmmooonnn.model.MatchUserDetailsDTO;
import com.mmmooonnn.model.MatchesBean;
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
	
	
	 public void createMatch(Integer userId1, Integer userId2, String matchSuccess, String matchStatus) {
	        matchesRepository.createMatch(userId1, userId2, matchSuccess, matchStatus);
	    }

	 public List<MatchUserDetailsDTO> getMatches(Integer userid){
		    return matchesRepository.findMatches(userid);
		}
	 
	 public List<MatchesBean> getAll(){
		 return matchesRepository.findAll();
	 }
	 public void updateMatchStatus(Integer userId1, Integer userId2, String matchStatus, String matchSuccess) {
	        matchesRepository.updateMatchStatus(userId1, userId2, matchStatus, matchSuccess);
	    }
}
