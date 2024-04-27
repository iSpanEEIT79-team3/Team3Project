package com.mmmooonnn.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mmmooonnn.model.BackstageBean;
import com.mmmooonnn.model.BackstageRepository;
import com.mmmooonnn.model.MatchBean;
import com.mmmooonnn.model.MatchRepository;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class MatchService {

	@Autowired
	private MatchRepository mRepos;

	public void intsert(MatchBean match) {
		mRepos.save(match);
	}

	public void update(MatchBean match) {
		mRepos.save(match);
	}

	public void deleteById(Integer id) {
		mRepos.deleteById(id);
	}

	public MatchBean findMatchById(Integer id) {
		Optional<MatchBean> result = mRepos.findById(id);
		if (result.isPresent()) {
			return result.get();
		}

		return null;
	}

	public List<MatchBean> getAll() {
		return mRepos.findAll();
	}

	public MatchBean findMatchByEmail(String email) {
		Optional<MatchBean> findMatchByEmail = mRepos.findMatchByEmail(email);
		MatchBean matchBean2 = findMatchByEmail.get();
		
//		MatchBean matchBean = mRepos.findMatchByEmail(email).get();
	    return matchBean2;
	}

	public boolean findUserByEmailPassword(String email, String password) {
		Optional<MatchBean> result = mRepos.findMatchByEmail(email);

		if (!result.isEmpty()) {
			MatchBean match = result.get();
			if (match.getPassword().equals(password)) {
				return true;
			} else {
				return false;
			}
		}
		return false;
	}
}
