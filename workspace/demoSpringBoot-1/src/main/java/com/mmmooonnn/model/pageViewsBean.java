package com.mmmooonnn.model;

import org.springframework.stereotype.Component;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "PAGEVIEWS")
@Component

public class pageViewsBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PAGEVIEWSID")	
	private Integer pageViewsId ;
	@Column(name="USERID")
	private Integer userId;
	@Column(name = "LTID")
	private Integer ltId;


	public Integer getpageViewsId() {
		return pageViewsId;
	}
	public void setpageViewsId(Integer pageViewsId) {
		this.pageViewsId = pageViewsId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getLtId() {
		return ltId;
	}
	public void setLtId(Integer ltId) {
		this.ltId = ltId;
	}
	public pageViewsBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "pageViewsBean [pageViewsId=" + pageViewsId + ", userId=" + userId + ", ltId=" + ltId + "]";
	}
	public pageViewsBean(Integer pageViewsId, Integer userId, Integer ltId) {
		super();
		this.pageViewsId = pageViewsId;
		this.userId = userId;
		this.ltId = ltId;
	}
	
	
	
}
