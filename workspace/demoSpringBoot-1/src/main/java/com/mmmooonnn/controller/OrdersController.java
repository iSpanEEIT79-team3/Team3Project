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

import com.mmmooonnn.model.OrderDetail;
import com.mmmooonnn.model.Orders;
import com.mmmooonnn.model.OrdersRepository;
import com.mmmooonnn.model.UserContactNew;
import com.mmmooonnn.model.UserContactRepository;
import com.mmmooonnn.model.UsersRepository;

@RestController
public class OrdersController {
	
	
	@Autowired
	private Orders orders;
	@Autowired
	private OrdersRepository ordersDao;
	
	
	@Autowired
	private UserContactRepository UsersDao;
	
	
	
	@GetMapping("/test")
	public void test(){
		System.out.println(ordersDao);
		System.out.println(UsersDao);
		System.out.println(UsersDao.findAll());
		}

	@GetMapping("/orders")
	public List<Orders> Allorders() {
	    List<Orders> ordersList = ordersDao.findAll();
	    
	   

	    return ordersList;
	}

	@PostMapping("/orders")
	@Transactional
	public void addOrder(@RequestBody Orders order) {
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
	    // 保存订单
	    ordersDao.save(order);
	}

	@DeleteMapping("/orders/{id}")
	@Transactional
	public void deleteOrder(@PathVariable("id") Long id) {
		ordersDao.deleteById(id);
	}

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
	
	@GetMapping("/OrdersList")
	public List<Orders> OrdersList(Integer contactId) {
		contactId=1001;
		List<Orders> ordersList=ordersDao.findByUserContactNew_ContactId(contactId);
		System.out.print(ordersList);
		return ordersList;
		
	}

	
}
