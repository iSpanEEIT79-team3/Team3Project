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
	private ShopImgRepository shopImgRepos;
	
	public List<ShopImgBean> findAll(){
		return shopImgRepos.findAll();
	}
	
	public List<ShopImgBean> findById(Integer productId) {
		return shopImgRepos.findByProductId(productId);
	}
	
	public List<ShopImgBean> findByImageId(Integer imageId){
		return shopImgRepos.findByImageId(imageId);
	}
    
	
	public void insert(ShopImgBean shopImgBean) {
		shopImgRepos.save(shopImgBean);
	}
	
	public void update(ShopImgBean shopImgBean) {
		shopImgRepos.save(shopImgBean);
	}
	
	public void deleteById(Integer imageId) {

		shopImgRepos.deleteById(imageId);
	}
}
