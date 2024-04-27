package com.mmmooonnn.model;

import org.springframework.stereotype.Component;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="shop")
@Component
public class ShopBean {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "productid")
	private Integer productid;
	@Column(name = "productimg") 
	private String productimg;
	@Column(name = "productname")
	private String productname;
	@Column(name = "productprice")
	private Integer productprice;
	@Column(name = "productintroduce")
	private String productintroduce;
	@Column(name = "producttype")
	private String producttype;
	@Column(name = "productquantity")
	private Integer productquantity;
	
	public ShopBean() {
		
	}
	
	
	public ShopBean(Integer productid, String productimg, String productname, Integer productprice,
			String productintroduce, String producttype, Integer productquantity) {
		super();
		this.productid = productid;
		this.productimg = productimg;
		this.productname = productname;
		this.productprice = productprice;
		this.productintroduce = productintroduce;
		this.producttype = producttype;
		this.productquantity = productquantity;
	}

	public Integer getProductid() {
		return productid;
	}

	public void setProductid(Integer productid) {
		this.productid = productid;
	}

	public String getProductimg() {
		return productimg;
	}

	public void setProductimg(String productimg) {
		this.productimg = productimg;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public Integer getProductprice() {
		return productprice;
	}

	public void setProductprice(Integer productprice) {
		this.productprice = productprice;
	}

	public String getProductintroduce() {
		return productintroduce;
	}

	public void setProductintroduce(String productintroduce) {
		this.productintroduce = productintroduce;
	}

	public String getProducttype() {
		return producttype;
	}

	public void setProducttype(String producttype) {
		this.producttype = producttype;
	}

	public Integer getProductquantity() {
		return productquantity;
	}

	public void setProductquantity(Integer productquantity) {
		this.productquantity = productquantity;
	}

	@Override
	public String toString() {
		return "ShopBean [productid=" + productid + ", productimg=" + productimg + ", productname=" + productname
				+ ", productprice=" + productprice + ", productintroduce=" + productintroduce + ", producttype="
				+ producttype + ", productquantity=" + productquantity + "]";
	}
}
