package com.mmmooonnn.service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mmmooonnn.model.ShopBean;
import com.mmmooonnn.model.ShopImgBean;
import com.mmmooonnn.model.ShopImgRepository;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class ShopImgService {
	
	@Autowired
	private ShopImgRepository siRepos;
	
	public List<ShopImgBean> findAll(){
		return siRepos.findAll();
	}
	
    // 獲取所有的 ShopImgBean
    public List<ShopImgBean> findAllShopImgBeans() {
        return siRepos.findAll();
    }

    
	public List<ShopImgBean> findByProductId(Integer productId) {
		return siRepos.findByProductId(productId);
	}
    
	
	public void insert(ShopImgBean shopImgBean) {
		siRepos.save(shopImgBean);
	}
	
	public void update(ShopImgBean shopImgBean) {
		siRepos.save(shopImgBean);
	}
	
	public void deleteById(Integer imageId) {

		siRepos.deleteById(imageId);
	}
}
