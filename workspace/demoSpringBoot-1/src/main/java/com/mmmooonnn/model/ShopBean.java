package com.mmmooonnn.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import org.springframework.stereotype.Component;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="shop")
@Component
public class ShopBean {
	
	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@JoinColumn(name = "product_id")
	private Integer productId;
	@Column(name = "product_name")
	private String productName;
	@Column(name = "product_img") 
	private String productImg;
	@Column(name = "product_price")
	private Integer productPrice;
	@Column(name = "product_introduce")
	private String productIntroduce;
	@Column(name = "product_type")
	private String productType;
	
	
	public ShopBean() {
		
	}
	public ShopBean(Integer productId, String productName, String productImg, Integer productPrice,
			String productIntroduce, String productType) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productImg = productImg;
		this.productPrice = productPrice;
		this.productIntroduce = productIntroduce;
		this.productType = productType;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductImg() {
		return productImg;
	}

	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}

	public Integer getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(Integer productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductIntroduce() {
		return productIntroduce;
	}

	public void setProductIntroduce(String productIntroduce) {
		this.productIntroduce = productIntroduce;
	}

	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

	
	@Override
	public String toString() {
		return "ShopBean [productId=" + productId + ", productName=" + productName + ", productImg=" + productImg
				+ ", productPrice=" + productPrice + ", productIntroduce=" + productIntroduce + ", productType="
				+ productType + "]";
	}
	
	

}
