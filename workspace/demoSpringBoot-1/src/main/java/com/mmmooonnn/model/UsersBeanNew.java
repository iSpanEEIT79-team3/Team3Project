package com.mmmooonnn.model;

import java.time.LocalDate;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;



@Entity
@Table(name = "usersnew")
@Component
public class UsersBeanNew {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="USERID")
	private Integer userId;
	@Column(name="NICKNAME")
	private String nickName;
	@Column(name="GENDER")
	private String gender;
	@Column(name="PASSWORD")
	private String password;
	
	@JsonFormat(pattern = "yyyy-MM-dd" , timezone = "GMT+8")
	@Column(name="BIRTHDAY")
	private LocalDate birthday;
	
	@Column(name="DANCECHARACTER")
	private String danceCharacter;
	@Column(name="DANCEAGE")
	private String danceAge;
	@Column(name="USERPICTURE")
	private String picture;
	
	
	 @OneToOne(cascade = CascadeType.ALL)
	 @JoinColumn(name = "FK_CONTACTID")
	 private UserContactNew userContact;


	public Integer getUserId() {
		return userId;
	}


	public void setUserId(Integer userId) {
		this.userId = userId;
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


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
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


	public UserContactNew getUserContact() {
		return userContact;
	}


	public void setUserContact(UserContactNew userContact) {
		this.userContact = userContact;
	}


	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("UsersBeanNew [userId=");
		builder.append(userId);
		builder.append(", nickName=");
		builder.append(nickName);
		builder.append(", gender=");
		builder.append(gender);
		builder.append(", password=");
		builder.append(password);
		builder.append(", birthday=");
		builder.append(birthday);
		builder.append(", danceCharacter=");
		builder.append(danceCharacter);
		builder.append(", danceAge=");
		builder.append(danceAge);
		builder.append(", picture=");
		builder.append(picture);
		builder.append(", userContact=");
		builder.append(userContact);
		builder.append("]");
		return builder.toString();
	}
	
	
	
}