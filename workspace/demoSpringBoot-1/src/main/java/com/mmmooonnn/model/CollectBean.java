package com.mmmooonnn.model;

import org.springframework.stereotype.Component;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "COLLECT")
@Component
public class CollectBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column(name = "COLLECTID")	
	private Integer collectId;
	@Column(name = "LTID")
	private Integer ltId;
	@Column(name="USERID")
	private Integer userId;
	public Integer getCollectId() {
		return collectId;
	}
	public void setCollectId(Integer collectId) {
		this.collectId = collectId;
	}
	public Integer getLtId() {
		return ltId;
	}
	public void setLtId(Integer ltId) {
		this.ltId = ltId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "CollectBean [collectId=" + collectId + ", ltId=" + ltId + ", userId=" + userId + "]";
	}
	public CollectBean(Integer collectId, Integer ltId, Integer userId) {
		super();
		this.collectId = collectId;
		this.ltId = ltId;
		this.userId = userId;
	}
	public CollectBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	

}
