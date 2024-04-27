package com.mmmooonnn.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ShopRepository extends JpaRepository<ShopBean, Integer> {
	
	List<ShopBean> findByproductnameContaining(String productName);//模糊搜尋
	List<ShopBean> findByproducttype(String productType);
	//List<ShopBean> findByproductname(String productName); //搜尋名稱 無法達到模糊搜尋
}
