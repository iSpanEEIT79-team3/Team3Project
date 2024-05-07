package com.mmmooonnn.model;


import org.springframework.data.jpa.repository.JpaRepository;

public interface ValidateRepository extends JpaRepository<ValidateBean, Integer> {
	
	ValidateBean findByEmail(String email);
}
