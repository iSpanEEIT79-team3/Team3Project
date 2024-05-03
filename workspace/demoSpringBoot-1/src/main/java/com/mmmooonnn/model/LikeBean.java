package com.mmmooonnn.model;

import org.springframework.stereotype.Component;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="LIKEPOST")
@Component
public class LikeBean {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
	
@Column(name = "LIKEID")	
private Integer likeId ;
@Column(name="USERID")
private Integer userId;
@Column(name = "LTID")
private Integer ltId;


public Integer getLikeId() {
	return likeId;
}
public void setLikeId(Integer likeId) {
	this.likeId = likeId;
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
@Override
public String toString() {
	return "LikeBean [likeId=" + likeId + ", userId=" + userId + ", ltId=" + ltId + "]";
}
public LikeBean() {
	super();
	// TODO Auto-generated constructor stub
}
public LikeBean(Integer userId, Integer ltId) {
	super();
	this.userId = userId;
	this.ltId = ltId;
}




}