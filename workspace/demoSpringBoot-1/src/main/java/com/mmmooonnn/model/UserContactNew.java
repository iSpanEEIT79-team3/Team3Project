package com.mmmooonnn.model;



import org.springframework.stereotype.Component;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "usercontactnew")
@Component
public class UserContactNew {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="CONTACTID")
	private  Integer contactId;
	@Column(name="USERNAME")
	private String name;
	@Column(name="USEREMAIL")
	private String email;
	@Column(name="USERPHONE")
	private String phone;
	@Column(name="USERADDRESS")
	private String address;
	
	 
	
	 
	public UserContactNew() {
		super();
	}


	public Integer getContactId() {
		return contactId;
	}


	public void setContactId(Integer contactId) {
		this.contactId = contactId;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}




	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("UserContactNew [contactId=");
		builder.append(contactId);
		builder.append(", name=");
		builder.append(name);
		builder.append(", email=");
		builder.append(email);
		builder.append(", phone=");
		builder.append(phone);
		builder.append(", address=");
		builder.append(address);

		builder.append("]");
		return builder.toString();
	}

	

	
}