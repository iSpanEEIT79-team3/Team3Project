package com.mmmooonnn.model;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;


public interface BackstageRepository extends JpaRepository<BackstageBean, String> {
	
	
	public Optional<BackstageBean> findByEmail(String email);
}
