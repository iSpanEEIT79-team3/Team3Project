package com.mmmooonnn.service;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mmmooonnn.model.ShopBean;
import com.mmmooonnn.model.ShopRepository;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class ShopService {
	
	@Autowired
	private ShopRepository shopRepos;
	
	
	public List<ShopBean> findAll(){
		return shopRepos.findAll();
	}
	

	public List<ShopBean> findById(Integer productid) {
	    return shopRepos.findById(productid)
	                  .map(Collections::singletonList) // 将 Optional 转换为单元素列表
	                  .orElse(Collections.emptyList()); // 如果 Optional 为空，则返回空列表
	}
	
    public List<ShopBean> findByProductType(String ProductType) {
        return shopRepos.findByProductType(ProductType);
    }

    public List<ShopBean> findByproductnameContaining(String ProductName) {
//        return sRepos.findByproductname(productName);
        return shopRepos.findByProductNameContaining(ProductName);
    }
    
	public void insert(ShopBean shopBean) {
		shopRepos.save(shopBean);
	}
	
	public void update(ShopBean shopBean) {
		shopRepos.save(shopBean);
	}
	
	public void deleteById(Integer productid) {

		shopRepos.deleteById(productid);
	}

 
}

