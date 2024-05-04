package com.mmmooonnn.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.boot.json.JsonParser;
import org.springframework.boot.json.JsonParserFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.ui.Model;

import com.mmmooonnn.model.HttpRequestSender;
import com.mmmooonnn.model.Orders;
import com.mmmooonnn.model.OrdersRepository;


import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;

@RestController
public class PayController {
	public static AllInOne all;
	
	@Autowired
	private OrdersRepository ordersDao;
	
	
	//forLinePay
	private Orders order;
	
	
	//綠界付款
	@GetMapping("/PayTest/{id}")
	@ResponseBody
	public String test(@PathVariable("id") Long id){
		Orders order=ordersDao.getById(id);
		System.out.println(order);
		//String=order.getTotalPrice();
		long orderId = order.getOrderId();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date currentDate = new Date();
		String formattedDate = sdf.format(currentDate);
		System.out.println("訂單時間：" + formattedDate);
		int totalPrice = order.getTotalPrice();

		AllInOne all = new AllInOne("");
		AioCheckOutALL obj = new AioCheckOutALL();
		obj.setMerchantTradeNo("" + orderId);
		obj.setMerchantTradeDate(formattedDate);
		obj.setTotalAmount("" + totalPrice);
		obj.setTradeDesc("Test Description");
		obj.setItemName("TestItem");
		// 交易結果回傳網址，只接受 https 開頭的網站，可以使用 ngrok
		obj.setReturnURL("https://c160-118-168-85-64.ngrok-free.app/PayResult");
		obj.setNeedExtraPaidInfo("N");
		// 商店轉跳網址 (Optional)
		obj.setClientBackURL("http://localhost:8080/html/OrderForClient.html");
		String form=all.aioCheckOut(obj, null);
		System.out.print(form);
		return form;
        //return form;

	}
	
	
	//綠界回傳
	@PostMapping("/PayResult")
	public ResponseEntity<String> PayResult(@RequestBody MultiValueMap<String, String> payResult) {
		System.out.println("payResult:" + payResult + "666666666666666666666666");
		String rtnCode = payResult.getFirst("RtnCode");
		String orderId=payResult.getFirst("MerchantTradeNo");
		System.out.println("orderId=" + orderId);

		// 打印 RtnCode 的值
		System.out.println("RtnCode: " + rtnCode);
		
		int num = Integer.parseInt(rtnCode);
		if ( num== 1) {
			System.out.println("是一樣的哦");
			 Orders order=ordersDao.findById(Long.parseLong(orderId)).orElse(null);
			order.setPayStatus("已付款");
			ordersDao.save(order);
		}
		System.out.println("...............................");
		//String url = "https://payment-stage.ecPay.com.tw/Cashier/AioCheckOut/V5";
		//String response = "1|OK";
		//return "1|OK";
		/*RestTemplate restTemplate = new RestTemplate();		
		 HttpEntity<String> entity = new HttpEntity<>(response);
	        //發送請求
	     ResponseEntity<String> payresult = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);
	     String responseBody = payresult.getBody();
	        System.out.println("Response: " + responseBody);*/

		return ResponseEntity.ok().body("1|OK");
	}
	
	//linepay付款
	@PostMapping("/LinePayTest/{id}")
	public String LinePayTest(@PathVariable("id") Long id) {
		order=ordersDao.getById(id);
		System.out.println(order);
		long orderId = order.getOrderId();
		int totalPrice = order.getTotalPrice();
		
		RestTemplate restTemplate = new RestTemplate();		
        String apiUrl = "https://sandbox-api-pay.line.me/v2/payments/request";

        // headers
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.add("X-LINE-ChannelId","2003995648");
        headers.add("X-LINE-ChannelSecret","53ff3dc1e4b8efc99edf22ad6a4aec1e");
        
        
        //body
        JSONObject jsonObject = new JSONObject();
        try {
			jsonObject.put("productName", "Test");
			jsonObject.put("amount", totalPrice);
			jsonObject.put("currency", "TWD");
			jsonObject.put("confirmUrl", "http://localhost:8080/html/LinePayDone.html");
			jsonObject.put("orderId", ""+orderId);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        String jsonString = jsonObject.toString();

        //建立HttpEntity,加入body、header
        HttpEntity<String> entity = new HttpEntity<>(jsonString, headers);

        //發送請求
        ResponseEntity<String> response = restTemplate.exchange(apiUrl, HttpMethod.POST, entity, String.class);

        // 取得回應
        String responseBody = response.getBody();
        System.out.println("Response: " + responseBody);
        
        
        try {
            
            JSONObject ResponseJson = new JSONObject(responseBody);
            //info 下的paymentUrl的web
            String webUrl = ResponseJson.getJSONObject("info").getJSONObject("paymentUrl").getString("web");
            System.out.println("Web URL: " + webUrl);
            // info下的web
            long transactionId = ResponseJson.getJSONObject("info").getLong("transactionId");
            System.out.println("Transaction ID: " + transactionId);
            return webUrl ;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
      
	}
	
	
	//Linepay check		
	@PostMapping("/LinePayCheck/{TranId}")
	public void LinePayCheck(@PathVariable("TranId") Long TranId) {
		System.out.println("TranId="+TranId);
		RestTemplate restTemplate = new RestTemplate();		
		String apiUrl = "https://sandbox-api-pay.line.me/v2/payments/" + TranId + "/confirm";
		System.out.println();

        // headers
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.add("X-LINE-ChannelId","2003995648");
        headers.add("X-LINE-ChannelSecret","53ff3dc1e4b8efc99edf22ad6a4aec1e");
        
    
        //body
        JSONObject jsonObject = new JSONObject();
        try {
        	System.out.println(order.getOrderId());
        	
			jsonObject.put("amount",order.getTotalPrice());
			jsonObject.put("currency", "TWD");
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        String jsonString = jsonObject.toString();

        //建立HttpEntity,加入body、header
        HttpEntity<String> entity = new HttpEntity<>(jsonString, headers);

        //發送請求
        ResponseEntity<String> response = restTemplate.exchange(apiUrl, HttpMethod.POST, entity, String.class);

        // 取得回應
        String responseBody = response.getBody();
        System.out.println("Response: " + responseBody);
        try {
			JSONObject ResponseJson = new JSONObject(responseBody);
			String returnCode=ResponseJson.getString("returnCode");
			System.out.println(Integer.parseInt(returnCode));
			if(Integer.parseInt(returnCode)==0) {
				order.setPayStatus("已付款");
				System.out.println(order);
				ordersDao.save(order);
				
			}
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
	}
	
	
}