package com.mmmooonnn.model;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


@Repository
public interface UserContactRepository extends JpaRepository<UserContactNew, Integer> {
	
	@Query("SELECT COUNT(uc) FROM UserContactNew uc WHERE uc.email = ?1")
    int countByEmail(String email);
	
	UserContactNew findByEmail(String email);
	
}
