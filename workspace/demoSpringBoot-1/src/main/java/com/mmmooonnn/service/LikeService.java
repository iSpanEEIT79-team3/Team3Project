package com.mmmooonnn.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mmmooonnn.model.LTBean;
import com.mmmooonnn.model.LikeBean;
import com.mmmooonnn.model.LikeRepository;

@Service
@Transactional
public class LikeService {
	@Autowired
	private LikeRepository lr;

	public LikeBean insertLike(LikeBean likeBean) {
		return lr.save(likeBean);

	}

	public LikeBean update(LikeBean likeBean) {
		return lr.save(likeBean);
	}

	public LikeBean findByLikeId(Integer likeId) {
		Optional<LikeBean> op1 = lr.findById(likeId);

		if (op1.isPresent()) {
			return op1.get();

		}
		return null;
	}

	public List<LikeBean> findLike() {
		return lr.findAll();
	}

	public void deleteByLikeId(Integer likeId) {

		lr.deleteById(likeId);

	}
	public LikeBean findByUserIdAndLtId(Integer userId, Integer ltId) {
        return lr.findByUserIdAndLtId(userId, ltId);
    }
}
