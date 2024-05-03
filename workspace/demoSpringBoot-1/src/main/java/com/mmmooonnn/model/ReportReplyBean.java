package com.mmmooonnn.model;

import org.springframework.stereotype.Component;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "REPORTREPLY")
@Component
public class ReportReplyBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "REPORTREPLYID")
	private Integer reportReplyId;
	@Column(name = "REPORTCONTENT")
	private String reportContent;

	@Column(name = "REPLYID")
	private Integer replyId;

	public ReportReplyBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getReportReplyId() {
		return reportReplyId;
	}

	public void setReportReplyId(Integer reportReplyId) {
		this.reportReplyId = reportReplyId;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public Integer getReplyId() {
		return replyId;
	}

	public void setReplyId(Integer replyId) {
		this.replyId = replyId;
	}

	@Override
	public String toString() {
		return "ReportReplyBean [reportReplyId=" + reportReplyId + ", reportContent=" + reportContent + ", replyId="
				+ replyId + "]";
	}

	public ReportReplyBean(Integer reportReplyId, String reportContent, Integer replyId) {
		super();
		this.reportReplyId = reportReplyId;
		this.reportContent = reportContent;
		this.replyId = replyId;
	}

	
	
	
}
