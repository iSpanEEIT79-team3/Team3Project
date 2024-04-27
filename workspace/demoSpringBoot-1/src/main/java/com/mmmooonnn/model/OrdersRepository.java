package com.mmmooonnn.model;



import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;




@Repository
public interface OrdersRepository extends JpaRepository<Orders, Long> {
	public List<Orders> findByUserContactNew_ContactId(Integer contactId);
	
	
}
