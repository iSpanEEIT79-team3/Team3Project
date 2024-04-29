package com.mmmooonnn.model;

import org.springframework.stereotype.Component;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="shopimg")
@Component
public class ShopImgBean {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ShopImgId")
	private Integer ShopImgId;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="SHOP_ID")
	private ShopBean shopBean;
	
	@Column(name = "productimages") 
	private String productimages;
	
}
