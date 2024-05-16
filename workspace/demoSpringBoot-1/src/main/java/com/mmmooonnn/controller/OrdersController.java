package com.mmmooonnn.controller;


import java.time.LocalDate;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mmmooonnn.model.OrderDetail;
import com.mmmooonnn.model.Orders;
import com.mmmooonnn.model.OrdersRepository;
import com.mmmooonnn.model.UserContactNew;
import com.mmmooonnn.model.UserContactRepository;
import com.mmmooonnn.model.UsersBeanNew;
import com.mmmooonnn.model.UsersRepository;

import jakarta.servlet.http.HttpSession;

@RestController
public class OrdersController {
	
	
	@Autowired
	private Orders orders;
	@Autowired
	private OrdersRepository ordersDao;
	
	
	@Autowired
	private UserContactRepository UsersDao;
	
	
	
	//查詢所有訂單
	@GetMapping("/orders")
	public List<Orders> Allorders() {
	    List<Orders> ordersList = ordersDao.findAll();
	    
	   

	    return ordersList;
	}
	
	
	//新增訂單
	@PostMapping("/orders")
	@Transactional
	public Orders addOrder(@RequestBody Orders order) {
		System.out.println("order="+order);
		System.out.println("UserContactNew="+order.getUserContactNew());
		int ContactId =order.getUserContactNew().getContactId();
		UserContactNew userContact= UsersDao.getById(ContactId);
		order.setUserContactNew(userContact);
		//System.out.println(order.getUserContact().getIdUser());
		
		//order.getUser();
	    long orderId = System.currentTimeMillis();
	    order.setOrderId(orderId);
	    
	    String payStatus = "未付款";
	    String shippingStatus = "未出貨";
	    LocalDate payDeadline = LocalDate.now().plusDays(3); 
	    order.setPayStatus(payStatus);
	    order.setShippingStatus(shippingStatus);
	    order.setPayDeadline(payDeadline.toString());
	    order.setOrderDate(""+ LocalDate.now());
	    
	    int  totalPrice = 0;
	    List<OrderDetail> orderDetails = order.getOrderDetails();
	    for (int i = 0; i < orderDetails.size(); i++) {
	        long orderDetailId = orderId * 100 + i; // 根据订单ID生成唯一的订单详情ID
	        orderDetails.get(i).setOrderDetailId(orderDetailId);
	        orderDetails.get(i).setOrder(order);
	        totalPrice =totalPrice+orderDetails.get(i).getOrderTotalPrice();
	    }
	    order.setTotalPrice(totalPrice);

	    ordersDao.save(order);
	   
		return order;

	}
	
	
	//刪除訂單
	@DeleteMapping("/orders/{id}")
	@Transactional
	public String deleteOrder(@PathVariable("id") Long id) {
		ordersDao.deleteById(id);
		return "okay";
	}
	
	
	//更新訂單
	@PutMapping("/orders/{id}")
	@Transactional
	public void updateOrder(@PathVariable("id") Long id, @RequestBody Orders order) {
		System.out.println(order.toString());
		order.setOrderId(id);
		int a = order.getUserContactNew().getContactId();
		UserContactNew userContact= UsersDao.getById(a);
		order.setUserContactNew(userContact);
		ordersDao.save(order);

	}
	
	
	//透過USERID從session找訂單
	@GetMapping("/OrdersList")
	public List<Orders> OrdersList(HttpSession session) {
		System.out.println("session="+session);
		UsersBeanNew u1 = (UsersBeanNew)session.getAttribute("usersBean");
		System.out.println("u1:"+u1);
		int contactId=u1.getUserId();
		System.out.println("contactId="+contactId);
		List<Orders> ordersList=ordersDao.findByUserContactNew_ContactId(contactId);
		System.out.print(ordersList);
		return ordersList;
		
	}

	
}
