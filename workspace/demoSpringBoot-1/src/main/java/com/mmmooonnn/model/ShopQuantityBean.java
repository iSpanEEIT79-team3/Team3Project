package com.mmmooonnn.model;

import org.springframework.stereotype.Component;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="shop_quantity")
@Component
public class ShopQuantityBean {
	
	@Id
	@Column(name = "product_id")
	Integer productId;
	@Column(name = "xs_size")
	Integer xsSize;
	@Column(name = "s_size")
	Integer sSize;
	@Column(name = "m_size")
	Integer mSize;
	@Column(name = "l_size")
	Integer lSize;
	@Column(name = "xl_size")
	Integer xlSize;
	
	public ShopQuantityBean() {

	}
	public ShopQuantityBean(Integer productId, Integer xsSize, Integer sSize, Integer mSize, Integer lSize,
			Integer xlSize) {
		super();
		this.productId = productId;
		this.xsSize = xsSize;
		this.sSize = sSize;
		this.mSize = mSize;
		this.lSize = lSize;
		this.xlSize = xlSize;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public Integer getXsSize() {
		return xsSize;
	}
	public void setXsSize(Integer xsSize) {
		this.xsSize = xsSize;
	}
	public Integer getsSize() {
		return sSize;
	}
	public void setsSize(Integer sSize) {
		this.sSize = sSize;
	}
	public Integer getmSize() {
		return mSize;
	}
	public void setmSize(Integer mSize) {
		this.mSize = mSize;
	}
	public Integer getlSize() {
		return lSize;
	}
	public void setlSize(Integer lSize) {
		this.lSize = lSize;
	}
	public Integer getXlSize() {
		return xlSize;
	}
	public void setXlSize(Integer xlSize) {
		this.xlSize = xlSize;
	}
	
	@Override
	public String toString() {
		return "ShopQuantityBean [productId=" + productId + ", xsSize=" + xsSize + ", sSize=" + sSize + ", mSize="
				+ mSize + ", lSize=" + lSize + ", xlSize=" + xlSize + "]";
	}
	
	
	
	
}
