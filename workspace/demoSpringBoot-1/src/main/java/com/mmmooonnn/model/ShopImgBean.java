package com.mmmooonnn.model;

import org.springframework.stereotype.Component;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Table;

@Entity
@Table(name="shop_img")
@Component
public class ShopImgBean {

	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "image_id")
	private Integer imageId;
	
	@Column(name = "product_id")
	private Integer productId;
	
	@Column(name = "product_images") 
	private String productImages;

	public ShopImgBean() {
		
	}
	
	public ShopImgBean(Integer imageId, Integer productId, String productImages) {
		super();
		this.imageId = imageId;
		this.productId = productId;
		this.productImages = productImages;
	}

	public Integer getImageId() {
		return imageId;
	}

	public void setImageId(Integer imageId) {
		this.imageId = imageId;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getProductImages() {
		return productImages;
	}

	public void setProductImages(String productImages) {
		this.productImages = productImages;
	}
	
}
