package com.mmmooonnn.model;

import org.springframework.data.jpa.repository.JpaRepository;

public interface LikeRepository extends JpaRepository<LikeBean, Integer> {
	   LikeBean findByUserIdAndLtId(Integer userId, Integer ltId);

	
}
