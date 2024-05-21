package com.mmmooonnn.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CollectReporitory extends JpaRepository<CollectBean, Integer> {

	CollectBean findByUserIdAndLtId(Integer userId, Integer ltId);
	
	List<CollectBean> findByUserId(Integer userId);


}
