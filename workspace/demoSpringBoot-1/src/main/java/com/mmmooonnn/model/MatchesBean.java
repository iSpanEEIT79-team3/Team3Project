//package com.mmmooonnn.model;
//
//import java.io.Serializable;
//import java.time.LocalDate;
//
//import org.springframework.stereotype.Component;
//
//import com.fasterxml.jackson.annotation.JsonFormat;
//
//import jakarta.persistence.Column;
//import jakarta.persistence.Entity;
//import jakarta.persistence.GeneratedValue;
//import jakarta.persistence.GenerationType;
//import jakarta.persistence.Id;
//
//import jakarta.persistence.Table;
//
//@Entity
//@Table(name = "MATCHES")
//@Component
//public class MatchesBean implements Serializable {
//	private static final long serialVersionUID = 1L;
//
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	@Column(name = "MATCH_ID")
//	private Integer matchid;
//	@Column(name = "USER1_ID")
//	private Integer user1id;
//	@Column(name = "USER2_ID")
//	private Integer user2id;
//	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
//	@Column(name = "MATCH_DATE")
//	private LocalDate matchdate;
//	@Column(name = "MATCH_SUCCESS")
//	private String matchsuccess;
//	
//
//	public Integer getMatchid() {
//		return matchid;
//	}
//
//	public void setMatchid(Integer matchid) {
//		this.matchid = matchid;
//	}
//
//	public Integer getUser1id() {
//		return user1id;
//	}
//
//	public void setUser1id(Integer user1id) {
//		this.user1id = user1id;
//	}
//
//	public Integer getUser2id() {
//		return user2id;
//	}
//
//	public void setUser2id(Integer user2id) {
//		this.user2id = user2id;
//	}
//
//	public LocalDate getMatchdate() {
//		return matchdate;
//	}
//
//	public void setMatchdate(LocalDate matchdate) {
//		this.matchdate = matchdate;
//	}
//
//	public String getMatchsuccess() {
//		return matchsuccess;
//	}
//
//	public void setMatchsuccess(String matchsuccess) {
//		this.matchsuccess = matchsuccess;
//	}
//
//	public static long getSerialversionuid() {
//		return serialVersionUID;
//	}
//
//	@Override
//	public String toString() {
//		return "MatchesBean [matchid=" + matchid + ", user1id=" + user1id + ", user2id=" + user2id + ", matchdate="
//				+ matchdate + ", matchsuccess=" + matchsuccess + "]";
//	}
//
//	public MatchesBean(Integer matchid, Integer user1id, Integer user2id, LocalDate matchdate, String matchsuccess) {
//		super();
//		this.matchid = matchid;
//		this.user1id = user1id;
//		this.user2id = user2id;
//		this.matchdate = matchdate;
//		this.matchsuccess = matchsuccess;
//	}
//
//}
