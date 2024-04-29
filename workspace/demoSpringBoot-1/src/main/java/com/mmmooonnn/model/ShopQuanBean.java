package com.mmmooonnn.model;

import org.springframework.stereotype.Component;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="shopquan")
@Component
public class ShopQuanBean {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "shop_id")
    private Integer shopId;
    @Column(name = "xsquan")
    private Integer XSsize;
    @Column(name = "squan")
    private Integer Ssize;
    @Column(name = "mquan")
    private Integer Msize;
    @Column(name = "lquan")
    private Integer Lsize;
    @Column(name = "xlquan")
    private Integer XLsize;
    
    @ManyToOne
    @JoinColumn(name = "shop_id", referencedColumnName = "productid", insertable = false, updatable = false)
    private ShopBean shopBean; // 外鍵關聯到 ShopBean
    
    public ShopQuanBean() {
    	
    }
    
	public ShopQuanBean(Integer shopId, Integer xSsize, Integer ssize, Integer msize, Integer lsize, Integer xLsize) {
		super();
		this.shopId = shopId;
		XSsize = xSsize;
		Ssize = ssize;
		Msize = msize;
		Lsize = lsize;
		XLsize = xLsize;
	}

	public Integer getShopId() {
		return shopId;
	}

	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}

	public Integer getXSsize() {
		return XSsize;
	}

	public void setXSsize(Integer xSsize) {
		XSsize = xSsize;
	}

	public Integer getSsize() {
		return Ssize;
	}

	public void setSsize(Integer ssize) {
		Ssize = ssize;
	}

	public Integer getMsize() {
		return Msize;
	}

	public void setMsize(Integer msize) {
		Msize = msize;
	}

	public Integer getLsize() {
		return Lsize;
	}

	public void setLsize(Integer lsize) {
		Lsize = lsize;
	}

	public Integer getXLsize() {
		return XLsize;
	}

	public void setXLsize(Integer xLsize) {
		XLsize = xLsize;
	}
	
	@Override
	public String toString() {
		return "ShopQuanBean [shopId=" + shopId + ", XSsize=" + XSsize + ", Ssize=" + Ssize + ", Msize=" + Msize
				+ ", Lsize=" + Lsize + ", XLsize=" + XLsize + "]";
	}
}
