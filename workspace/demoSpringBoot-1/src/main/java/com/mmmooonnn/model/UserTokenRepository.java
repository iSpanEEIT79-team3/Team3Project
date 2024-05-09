package com.mmmooonnn.model;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface UserTokenRepository extends JpaRepository<UserTokenBean, Integer>{
	
	Optional<UserTokenBean> findByUserid(Integer userid);
}
