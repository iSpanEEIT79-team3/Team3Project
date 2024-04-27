package com.mmmooonnn.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mmmooonnn.model.LTBean;
import com.mmmooonnn.model.LTRepository;

@Service
@Transactional
public class LTService {
	
	@Autowired
	private LTRepository lt;
	
	public LTBean insertLT(LTBean ltBean) {
		return lt.save(ltBean);
	}
		
	
	public LTBean update(LTBean ltBean) {
		return  lt.save(ltBean);		
	}
	
	public LTBean findByLTId(Integer ltId) {
		Optional<LTBean> op1 = lt.findById(ltId);
		if(op1.isPresent()) {
			
			return op1.get();
		}
	return null;
	}

	public List<LTBean> findLT() {
		return lt.findAll()
;		
	}
	public void deleteById(Integer ltId) {
		lt.deleteById(ltId);
	}
	
//	
////	public List<LTBean> findByTitle(String title){
////		return lt.findByTitle(title);
////		
////	}

	
}