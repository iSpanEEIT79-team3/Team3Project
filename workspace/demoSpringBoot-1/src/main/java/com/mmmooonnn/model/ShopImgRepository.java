package com.mmmooonnn.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ShopImgRepository extends JpaRepository<ShopImgBean, Integer>{
	
	List<ShopImgBean> findByProductId(Integer productId);
	
}
