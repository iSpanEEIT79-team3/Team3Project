package com.mmmooonnn.model;

import java.time.LocalDate;

public class MatchUserDetailsDTO {

	private Integer matchid;
	private Integer user1id;
	private Integer user2id;
	private LocalDate matchdate;
	private String matchsuccess;
	private String matchstatus;
	private String nickName;
	private String gender;
	private LocalDate birthday;
	private String danceCharacter;
	private String danceAge;
	private String picture;

	public MatchUserDetailsDTO() {
	}

	public MatchUserDetailsDTO(Integer matchid, Integer user1id, Integer user2id, LocalDate matchdate,
			String matchsuccess, String matchstatus, String nickName, String gender, LocalDate birthday,
			String danceCharacter, String danceAge, String picture) {
		super();
		this.matchid = matchid;
		this.user1id = user1id;
		this.user2id = user2id;
		this.matchdate = matchdate;
		this.matchsuccess = matchsuccess;
		this.matchstatus = matchstatus;
		this.nickName = nickName;
		this.gender = gender;
		this.birthday = birthday;
		this.danceCharacter = danceCharacter;
		this.danceAge = danceAge;
		this.picture = picture;
	}

	public Integer getMatchid() {
		return matchid;
	}

	public void setMatchid(Integer matchid) {
		this.matchid = matchid;
	}

	public Integer getUser1id() {
		return user1id;
	}

	public void setUser1id(Integer user1id) {
		this.user1id = user1id;
	}

	public Integer getUser2id() {
		return user2id;
	}

	public void setUser2id(Integer user2id) {
		this.user2id = user2id;
	}

	public LocalDate getMatchdate() {
		return matchdate;
	}

	public void setMatchdate(LocalDate matchdate) {
		this.matchdate = matchdate;
	}

	public String getMatchsuccess() {
		return matchsuccess;
	}

	public void setMatchsuccess(String matchsuccess) {
		this.matchsuccess = matchsuccess;
	}

	public String getMatchstatus() {
		return matchstatus;
	}

	public void setMatchstatus(String matchstatus) {
		this.matchstatus = matchstatus;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public LocalDate getBirthday() {
		return birthday;
	}

	public void setBirthday(LocalDate birthday) {
		this.birthday = birthday;
	}

	public String getDanceCharacter() {
		return danceCharacter;
	}

	public void setDanceCharacter(String danceCharacter) {
		this.danceCharacter = danceCharacter;
	}

	public String getDanceAge() {
		return danceAge;
	}

	public void setDanceAge(String danceAge) {
		this.danceAge = danceAge;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	@Override
	public String toString() {
		return "MatchUserDetailsDTO [matchid=" + matchid + ", user1id=" + user1id + ", user2id=" + user2id
				+ ", matchdate=" + matchdate + ", matchsuccess=" + matchsuccess + ", matchstatus=" + matchstatus
				+ ", nickName=" + nickName + ", gender=" + gender + ", birthday=" + birthday + ", danceCharacter="
				+ danceCharacter + ", danceAge=" + danceAge + ", picture=" + picture + "]";
	}

}
