package com.mmmooonnn.service;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mmmooonnn.model.ReplyBean;
import com.mmmooonnn.model.ReplyRepository;


@Service
@Transactional
public class ReplyService {

	@Autowired
	private ReplyRepository ry;
	
	public ReplyBean InsertReply(ReplyBean replyBean) {
		return ry.save(replyBean);
	}
				
	public ReplyBean update(ReplyBean replyBean) {
		return ry.save(replyBean);
		
	}
	public ReplyBean findByReplyId(Integer ReplyId) {
		Optional<ReplyBean> op1 = ry.findById(ReplyId);
		if(op1.isPresent()) {
			
			return op1.get();
		}
		return null;
	}
	public List<ReplyBean> findReply(){
		return ry.findAll();
		
	}
	
	public void deleteBYReplyId(Integer ReplyId) {
		ry.deleteById(ReplyId);
		
	}
	public List<ReplyBean> findID(Integer ltId){
	return ry.findByID(ltId);

}
	
}
