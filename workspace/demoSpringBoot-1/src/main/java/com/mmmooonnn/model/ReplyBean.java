package com.mmmooonnn.model;


import java.util.Date;

import org.springframework.stereotype.Component;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "REPLY")
@Component
public class ReplyBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "REPLYID")
	private Integer replyId;
	
	@Column(name = "REPLYTIME")
	private Date replytime;
	
	@Column(name = "REPLYPOST")
	private String replypost;
//	@ManyToOne
//	@JoinColumn(name = "USERID")
	@Column(name = "USERID")
	private Integer userId;
//	private UserBean userBean;
	
//	@ManyToOne
//	@JoinColumn(name = "LTID")
	@Column(name = "LTID")
	private Integer LTId;
//	private LTBean ltBean;

	public ReplyBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getReplyId() {
		return replyId;
	}

	public void setReplyId(Integer replyId) {
		this.replyId = replyId;
	}

	public Date getReplytime() {
		return replytime;
	}

	public void setReplytime(Date replytime) {
		this.replytime = replytime;
	}

	public String getReplypost() {
		return replypost;
	}

	public void setReplypost(String replypost) {
		this.replypost = replypost;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getLTId() {
		return LTId;
	}

	public void setLTId(Integer lTId) {
		LTId = lTId;
	}

	@Override
	public String toString() {
		return "ReplyBean [replyId=" + replyId + ", replytime=" + replytime + ", replypost=" + replypost + ", userId="
				+ userId + ", LTId=" + LTId + "]";
	}

	public ReplyBean(Integer replyId, Date replytime, String replypost, Integer userId, Integer lTId) {
		super();
		this.replyId = replyId;
		this.replytime = replytime;
		this.replypost = replypost;
		this.userId = userId;
		LTId = lTId;
	}

	public ReplyBean(Integer replyId, String replypost, Integer userId, Integer lTId) {
		super();
		this.replyId = replyId;
		this.replypost = replypost;
		this.userId = userId;
		LTId = lTId;
	}

	public ReplyBean(Date replytime, String replypost, Integer userId, Integer lTId) {
		super();
		this.replytime = replytime;
		this.replypost = replypost;
		this.userId = userId;
		LTId = lTId;
	}

	

}