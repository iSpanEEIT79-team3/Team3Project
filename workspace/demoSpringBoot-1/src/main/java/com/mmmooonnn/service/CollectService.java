package com.mmmooonnn.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mmmooonnn.model.CollectBean;
import com.mmmooonnn.model.CollectReporitory;
import com.mmmooonnn.model.LikeBean;

@Service
@Transactional
public class CollectService {
	@Autowired
	private CollectReporitory cr;

	public CollectBean insert(CollectBean collectBean) {
	return	cr.save(collectBean);
		
		
	}
	 public void deleteByUserIdAndLtId(Integer userId, Integer ltId) {
	        CollectBean collectBean = cr.findByUserIdAndLtId(userId, ltId);
	        if (collectBean != null) {
	            cr.delete(collectBean);
	        }
	    }
	
	 public CollectBean findUserIdAndLtId(Integer userId, Integer ltId) {
	        CollectBean collectBean = cr.findByUserIdAndLtId(userId, ltId);
	        if (collectBean != null) {
	            cr.delete(collectBean);
	        }
			return cr.findByUserIdAndLtId(userId, ltId);
	    }
	 public   List<CollectBean> findUserId(Integer userId) {
		return (List<CollectBean>) cr.findByUserId(userId);
		 
		 
	 }
	 
	 
}
