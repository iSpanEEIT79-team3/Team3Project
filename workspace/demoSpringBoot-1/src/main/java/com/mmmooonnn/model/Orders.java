package com.mmmooonnn.model;


import java.util.List;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;



@Component
@Entity
@Table(name = "ORDER3")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class Orders {

    @Id
    @Column(name = "ORDER_ID")
    private long orderId;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    @JoinColumn(name = "FK_CONTACTID")
    private UserContactNew userContactNew;

    @Column(name = "TOTAL_PRICE")
    private Integer totalPrice;

    @Column(name = "PAY_STATUS")
    private String payStatus;

    @Column(name = "SHIPPING_STATUS")
    private String shippingStatus;

    @Column(name = "ORDER_DATE")
    private String orderDate;

    @Column(name = "SHIPPING_DATE")
    private String shippingDate;

    @Column(name = "PAY_DEADLINE")
    private String payDeadline;

    @Column(name = "ORDER_NOTE")
    private String orderNote;

    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<OrderDetail> orderDetails;

    public Orders() {

    }

    public UserContactNew getUserContactNew() {
        return userContactNew;
    }

    public void setUserContactNew(UserContactNew userContactNew) {
        this.userContactNew = userContactNew;
    }

    public List<OrderDetail> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(List<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }

    public long getOrderId() {
        return orderId;
    }

    public void setOrderId(long orderId) {
        this.orderId = orderId;
    }

    public Integer getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Integer totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getPayStatus() {
        return payStatus;
    }

    public void setPayStatus(String payStatus) {
        this.payStatus = payStatus;
    }

    public String getShippingStatus() {
        return shippingStatus;
    }

    public void setShippingStatus(String shippingStatus) {
        this.shippingStatus = shippingStatus;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getShippingDate() {
        return shippingDate;
    }

    public void setShippingDate(String shippingDate) {
        this.shippingDate = shippingDate;
    }

    public String getPayDeadline() {
        return payDeadline;
    }

    public void setPayDeadline(String payDeadline) {
        this.payDeadline = payDeadline;
    }

    public String getOrderNote() {
        return orderNote;
    }

    public void setOrderNote(String orderNote) {
        this.orderNote = orderNote;
    }

    @Override
    public String toString() {
        return "Orders [orderId=" + orderId + ", userContactNew=" + userContactNew + ", totalPrice=" + totalPrice
                + ", payStatus=" + payStatus + ", shippingStatus=" + shippingStatus + ", orderDate=" + orderDate
                + ", shippingDate=" + shippingDate + ", payDeadline=" + payDeadline + ", orderNote=" + orderNote
                + ", orderDetails=" + orderDetails + "]";
    }
}
