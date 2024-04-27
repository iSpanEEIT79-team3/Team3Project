package com.mmmooonnn.model;

import java.io.Serializable;




import org.springframework.stereotype.Component;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="BACKSTAGE")
@Component
public class BackstageBean implements Serializable{

	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "EMAIL")
	private String email;
	@Column(name = "PASSWORD")
	private String password;
	
	public BackstageBean() {
	}
	

	public BackstageBean(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}


	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "Backstage [email=" + email + ", password=" + password + "]";
	}

	
	
	
	
}
