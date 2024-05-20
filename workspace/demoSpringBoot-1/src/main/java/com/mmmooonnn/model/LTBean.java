package com.mmmooonnn.model;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Set;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.*;

@Entity
@Table(name = "LT")
@Component
@JsonIgnoreProperties(value = { "hibernateLazyInitializer", "handler" })
public class LTBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	@Column(name = "LTID")
	private Integer ltId;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "ltBean", cascade = CascadeType.ALL)
	private Set<ReplyBean> ReplyBeans = new HashSet<ReplyBean>();

//	@OneToMany(fetch = FetchType.LAZY, mappedBy = "ltBean", cascade = CascadeType.ALL)
//	private Set<ReportBean> ReportBeans = new HashSet<ReportBean>();

	@Column(name = "TITLE")
	private String title;
	@Column(name = "USERID")
	private Integer userId;
	@Column(name = "DATE")
	private Date date;
	@Column(name = "PICTURE")
	private String picture;
	@Column(name = "CONTENT")
	private String content;
	@Column(name = "SAVELIKE")
	private Integer saveLike;

	@Column(name = "PAGEVIEWS")
	private Integer pageViews;
	@Column(name = "COLLECT")
	private Integer collect;
	@Column(name = "USERNAME")
	private String userName;
	public LTBean() {
		super();
		// TODO Auto-generated constructor stub
	}



	@Override
	public String toString() {
		return "LTBean [ltId=" + ltId + ", ReplyBeans=" + ReplyBeans + ", title=" + title + ", userId=" + userId
				+ ", date=" + date + ", picture=" + picture + ", content=" + content + ", saveLike=" + saveLike
				+ ", pageViews=" + pageViews + ", collect=" + collect + ", userName=" + userName + "]";
	}

	public String getUserName() {
		return userName;
	}




	public void setUserName(String userName) {
		this.userName = userName;
	}







	public Integer getLtId() {
		return ltId;
	}




	public void setLtId(Integer ltId) {
		this.ltId = ltId;
	}




	public Set<ReplyBean> getReplyBeans() {
		return ReplyBeans;
	}




	public void setReplyBeans(Set<ReplyBean> replyBeans) {
		ReplyBeans = replyBeans;
	}




	public String getTitle() {
		return title;
	}




	public void setTitle(String title) {
		this.title = title;
	}




	public Integer getUserId() {
		return userId;
	}




	public void setUserId(Integer userId) {
		this.userId = userId;
	}




	public Date getDate() {
		return date;
	}




	public void setDate(Date date) {
		this.date = date;
	}




	public String getPicture() {
		return picture;
	}




	public void setPicture(String picture) {
		this.picture = picture;
	}




	public String getContent() {
		return content;
	}




	public void setContent(String content) {
		this.content = content;
	}




	public Integer getSaveLike() {
		return saveLike;
	}




	public void setSaveLike(Integer saveLike) {
		this.saveLike = saveLike;
	}




	public Integer getCollect() {
		return collect;
	}




	public void setCollect(Integer collect) {
		this.collect = collect;
	}




	public static long getSerialversionuid() {
		return serialVersionUID;
	}




	public LTBean(Integer ltId, Set<ReplyBean> replyBeans, String title, Integer userId, Date date, String picture,
			String content, Integer saveLike) {
		super();
		this.ltId = ltId;
		ReplyBeans = replyBeans;
		this.title = title;
		this.userId = userId;
		this.date = date;
		this.picture = picture;
		this.content = content;
		this.saveLike = saveLike;
	}

	public LTBean(String title, Integer userId, Date date, String picture, String content, Integer saveLike) {
		super();
		this.title = title;
		this.userId = userId;
		this.date = date;
		this.picture = picture;
		this.content = content;
		this.saveLike = saveLike;
	}

	public LTBean(Integer ltId, String title, Integer userId, Date date, String picture, String content,
			Integer saveLike) {
		super();
		this.ltId = ltId;
		this.title = title;
		this.userId = userId;
		this.date = date;
		this.picture = picture;
		this.content = content;
		this.saveLike = saveLike;
	}

	public Integer getPageViews() {
		return pageViews;
	}

	public void setPageViews(Integer pageViews) {
		this.pageViews = pageViews;
	}

	


	

}