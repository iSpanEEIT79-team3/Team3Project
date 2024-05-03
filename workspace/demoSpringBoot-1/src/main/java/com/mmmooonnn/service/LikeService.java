package com.mmmooonnn.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import com.mmmooonnn.model.LTBean;
import com.mmmooonnn.model.LTRepository;
import com.mmmooonnn.model.LikeBean;
import com.mmmooonnn.model.LikeRepository;

@Service
@Transactional
public class LikeService {
	@Autowired
	private LikeRepository lr;

	@Autowired
	private LTRepository lt;
	public LikeBean insertLike(LikeBean likeBean) {
		return lr.save(likeBean);

	}

	public LikeBean update(LikeBean likeBean) {
		return lr.save(likeBean);
	}

	public LikeBean findByLikeId(Integer likeId) {
		Optional<LikeBean> op1 = lr.findById(likeId);

		if (op1.isPresent()) {
			return op1.get();

		}
		return null;
	}

	public List<LikeBean> findLike() {
		return lr.findAll();
	}

	public void deleteByLikeId(Integer likeId) {

		lr.deleteById(likeId);

	}
	public LikeBean findByUserIdAndLtId(Integer userId, Integer ltId) {
        return lr.findByUserIdAndLtId(userId, ltId);
    }


	    // 按讚功能
	    public LikeBean likePost(int userId, int ltId) {
	        LikeBean existingLike = lr.findByUserIdAndLtId(userId, ltId);
	        if (existingLike != null) {
	            // 如果用戶已經按過讚，則不做任何操作，也可以視情況更新按讚時間等資訊
	            return existingLike;
	        } else {
	            // 如果用戶還未按讚，則新增一條按讚紀錄
	            LikeBean newLike = new LikeBean();
	            newLike.setUserId(userId);
	            newLike.setLtId(ltId);
	            return lr.save(newLike);
	        }
	    }

	    // 取消按讚功能
	    public void unlikePost(int userId, int ltId) {
	        LikeBean existingLike = lr.findByUserIdAndLtId(userId, ltId);
	        if (existingLike != null) {
	            // 如果存在按讚紀錄，則刪除該按讚紀錄
	            lr.delete(existingLike);
	        }
	    }

	    // 獲取按讚數量
	    LikeService likeService;
	    public Integer getLikeCount(@RequestParam Integer ltId) {
	        Optional<LTBean> ltOptional = lt.findById(ltId);
	        if (ltOptional.isPresent()) {
	            LTBean lt = ltOptional.get();
				return likeService.getLikeCount(ltId);
	        } else {
	            // 如果找不到指定的貼文，返回 0 或是 null，視情況而定
	            return 0;
	        }
	    }
	    // 判斷用戶是否已按讚
	    public boolean isLikedByUser(int userId, int ltId) {
	        LikeBean existingLike = lr.findByUserIdAndLtId(userId, ltId);
	        return existingLike != null;
	    }
	}


