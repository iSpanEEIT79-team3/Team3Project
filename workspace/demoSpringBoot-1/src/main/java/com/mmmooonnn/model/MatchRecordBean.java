package com.mmmooonnn.model;

import java.io.Serializable;
import java.time.LocalDate;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "MATCHS")
@Component
public class MatchRecordBean implements Serializable {


	private static final long serialVersionUID = 1L;
	
	 @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    @Column(name = "MATCHID")
	    private Integer matchid; // 配對紀錄ID

	    @Column(name = "ID1")
	    private Integer id1; // 會員1 ID

	    @Column(name = "ID2")
	    private Integer id2; // 會員2 ID

	    @Column(name = "IS_MATCH")
	    private String isMatch; // 配對是否成功的布林屬性
	    
	    @JsonFormat(pattern = "yyyy-MM-dd" , timezone = "GMT+8")
	    @Column(name = "MATCH_DATE")
	    private LocalDate matchdate; // 配對日期

	    @Column(name = "PICTURE")
	    private String picture;
	    public MatchRecordBean() {
	        super();
	    }

	    public MatchRecordBean(Integer id1, Integer id2, String isMatch, LocalDate matchdate, String picture) {
	        super();
	        this.id1 = id1;
	        this.id2 = id2;
	        this.isMatch = isMatch;
	        this.matchdate = matchdate;
	        this.picture = picture;
	    }

	    @Override
	    public String toString() {
	        return "MatchRecordBean [matchid=" + matchid + ", id1=" + id1 + ", id2=" + id2 + ", isMatch=" + isMatch
	                + ", matchdate=" + matchdate + ", picture=" + picture + "]";
	    }

	    public Integer getMatchid() {
	        return matchid;
	    }

	    public void setMatchid(Integer matchid) {
	        this.matchid = matchid;
	    }

	    public Integer getId1() {
	        return id1;
	    }

	    public void setId1(Integer id1) {
	        this.id1 = id1;
	    }

	    public Integer getId2() {
	        return id2;
	    }

	    public void setId2(Integer id2) {
	        this.id2 = id2;
	    }

	    public String getIsMatch() {
	        return isMatch;
	    }

	    public void setIsMatch(String isMatch) {
	        this.isMatch = isMatch;
	    }

	    public LocalDate getMatchdate() {
	        return matchdate;
	    }

	    public void setMatchdate(LocalDate matchdate) {
	        this.matchdate = matchdate;
	    }

	    public String getPicture() {
	        return picture;
	    }

	    public void setPicture(String picture) {
	        this.picture = picture;
	    }

	    public static long getSerialversionuid() {
	        return serialVersionUID;
	    }
}
