package com.mmmooonnn.model;

public class ShopcartBean {
	private Integer productId;
	private String productName;
	private String productImg;
	private Integer productPrice;
	private String Size;
	private Integer quantity;
	
	public ShopcartBean() {
		
	}

	public ShopcartBean(Integer productId, String productName, String productImg, Integer productPrice, String size,
			Integer quantity) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productImg = productImg;
		this.productPrice = productPrice;
		this.Size = size;
		this.quantity = quantity;
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

	public String getSize() {
		return Size;
	}

	public void setSize(String size) {
		this.Size = size;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	
	
	
}
