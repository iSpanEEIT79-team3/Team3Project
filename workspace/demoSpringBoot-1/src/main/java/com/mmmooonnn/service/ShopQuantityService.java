package com.mmmooonnn.service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mmmooonnn.model.ShopBean;
import com.mmmooonnn.model.ShopQuantityBean;
import com.mmmooonnn.model.ShopQuantityRepository;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class ShopQuantityService {
	@Autowired
	private ShopQuantityRepository shopQuanRepos;
	
	public List<ShopQuantityBean> findAll(){
		return shopQuanRepos.findAll();
	}
	
	public List<ShopQuantityBean> findById(Integer productid) {
	    return shopQuanRepos.findById(productid)
	                  .map(Collections::singletonList) // 将 Optional 转换为单元素列表
	                  .orElse(Collections.emptyList()); // 如果 Optional 为空，则返回空列表
	}
	
	public void insert(ShopQuantityBean shopquanBean) {
		shopQuanRepos.save(shopquanBean);
	}
	
	public void update(ShopQuantityBean shopquanBean) {
		shopQuanRepos.save(shopquanBean);
	}
	
	public void deleteById(Integer productid) {
		shopQuanRepos.deleteById(productid);
	}
	
}
