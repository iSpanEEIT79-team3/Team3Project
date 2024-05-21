package com.mmmooonnn.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mmmooonnn.model.pageViewsBean;
import com.mmmooonnn.model.pageViewsRepository;

@Service
@Transactional
public class pageViewsService {
	@Autowired
	private pageViewsRepository pv;
	
	public pageViewsBean insert(pageViewsBean pageViewsBean) {
		return pv.save(pageViewsBean);
		
		
	}

}
