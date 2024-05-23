package com.mmmooonnn.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

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
		return lt.save(ltBean);
	}

	public LTBean findByLTId(Integer ltId) {
		Optional<LTBean> op1 = lt.findById(ltId);
		if (op1.isPresent()) {

			return op1.get();
		}
		return null;
	}

	public List<LTBean> findLT() {
		return lt.findAll();
	}

	public void deleteById(Integer ltId) {
		lt.deleteById(ltId);
	}

	public List<LTBean> findByTitle(@RequestParam String title) {
		return lt.findByTitle(title);

	}

	LTService likeService;

	public Integer getLikeCount(Integer ltId) {
		// 使用 LikeService 中的方法獲取按讚數量
		return likeService.getLikeCount(ltId);
	}

	public void updateLikeCount(Integer ltId, Integer saveLike) {
		LTBean ltBean = lt.findById(ltId).orElse(null);
		if (ltBean != null) {
			ltBean.setSaveLike(saveLike);
			lt.save(ltBean);
		}
	}

	public Page<LTBean> finPage(Pageable pageable) {
		return lt.findAllPage(pageable);
	}


	
	
	
}