package com.mmmooonnn.model;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Component
@Entity
@Table(name = "ORDER_DETAILS")
public class OrderDetail {
	
	 

	 
	
 
	@Column(name = "ORDER_DETAIL_ID")
	@Id
	private  Long OrderDetailId;
	
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "ORDER_ID")
    @JsonIgnore
    private Orders order;
	
	
	//@Column(name = "ORDER_ID")
    //private Long orderId;

	
	/*@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "ORDER_ID")
	@Column(name = "ORDER_ID") // 添加一个名为 ORDER_ID 的列，用于存储订单的 ID
	private Long orderId; // 将订单的 ID 存储在此属性中*/

    @Column(name = "PRODUCT_NUM")
    private int productNum;

    @Column(name = "PRODUCT_NAME", length = 20)
    private String productName;

    @Column(name = "PRODUCT_PRICE")
    private int productPrice;

    @Column(name = "PRODUCT_QUANTITY")
    private int productQuantity;

    @Column(name = "ORDER_TOTALPRICE")
    private int orderTotalPrice;
    
    public OrderDetail() {
    }
    
 

	public int getProductNum() {
		return productNum;
	}

	/*public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}*/
	

	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}

	public Long getOrderDetailId() {
		return OrderDetailId;
	}

	public void setOrderDetailId(Long orderDetailId) {
		OrderDetailId = orderDetailId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}

	public int getOrderTotalPrice() {
		return orderTotalPrice;
	}

	public void setOrderTotalPrice(int orderTotalPrice) {
		this.orderTotalPrice = orderTotalPrice;
	}



	public Orders getOrder() {
		return order;
	}



	public void setOrder(Orders order) {
		this.order = order;
	}





	
	
	

}