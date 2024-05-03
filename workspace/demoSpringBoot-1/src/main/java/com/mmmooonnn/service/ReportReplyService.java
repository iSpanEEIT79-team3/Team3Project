package com.mmmooonnn.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mmmooonnn.model.ReportReplyBean;
import com.mmmooonnn.model.ReportReplyRepository;



@Service
@Transactional

public class ReportReplyService {
	@Autowired
	private ReportReplyRepository rr;

	public ReportReplyBean insertReportReply(ReportReplyBean reportReplyBean) {
		return rr.save(reportReplyBean);
	}

	public ReportReplyBean update(ReportReplyBean reportReplyBean) {

		return rr.save(reportReplyBean);
	}

	public ReportReplyBean findById(Integer reportReplyId) {
		Optional<ReportReplyBean> op1 = rr.findById(reportReplyId);
		if (op1.isPresent()) {
			return op1.get();
		}
		return null;
	}

	public List<ReportReplyBean> findReportReply() {
		return rr.findAll();
	}

	public void deleteById(Integer reportReplyId) {
		 rr.deleteById(reportReplyId);
	}

	public List<ReportReplyBean> findId(Integer replyId){
		
		return rr.findByID(replyId);
		
	}
	
	
	
	
}