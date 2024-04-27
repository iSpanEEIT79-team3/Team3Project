package com.mmmooonnn.model;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import jakarta.persistence.*;


@Entity
@Table(name="LT")
@Component
public class LTBean {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
//@OneToMany(mappedBy = "ltBean")
@JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
//private Set<ReplyBean> replyBean =new LinkedHashSet<>();
	@Column(name = "LTID")
	private Integer ltId;
	@Column(name="TITLE")
	private String title;
	@Column(name="USERID")
	private Integer userId;
	@Column(name="DATE")
	private Date date;
	@Column(name = "PICTURE")
	private String picture;
	@Column(name="CONTENT")
	private String content;
	@Column (name="CLASSIFY")
	private String classify;
	public LTBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public LTBean(String title, Integer userId, Date date, String picture, String content, String classify) {
		super();
		this.title = title;
		this.userId = userId;
		this.date = date;
		this.picture = picture;
		this.content = content;
		this.classify = classify;
	}

	public LTBean(Integer ltId, String title, Integer userId, Date date, String picture, String content,
			String classify) {
		super();
		this.ltId = ltId;
		this.title = title;
		this.userId = userId;
		this.date = date;
		this.picture = picture;
		this.content = content;
		this.classify = classify;
	}
	@Override
	public String toString() {
		return "LTBean [ltId=" + ltId + ", title=" + title + ", userId=" + userId + ", date=" + date + ", picture="
				+ picture + ", content=" + content + ", classify=" + classify + "]";
	}
	public Integer getLtId() {
		return ltId;
	}
	public void setLtId(Integer ltId) {
		this.ltId = ltId;
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
	public String getClassify() {
		return classify;
	}
	public void setClassify(String classify) {
		this.classify = classify;
	}
	public LTBean(Integer ltId, String title, Integer userId, String picture, String content, String classify) {
		super();
		this.ltId = ltId;
		this.title = title;
		this.userId = userId;
		this.picture = picture;
		this.content = content;
		this.classify = classify;
	}

	
	
	
	
}
