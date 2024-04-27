package com.mmmooonnn.model;

import org.springframework.http.*;
import org.springframework.web.client.RestTemplate;

public class HttpRequestSender {

	private final RestTemplate restTemplate;

	public HttpRequestSender() {
		this.restTemplate = new RestTemplate();
	}

	public void sendPostRequest(String url, String requestBody) {
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

		// 创建请求实体
		HttpEntity<String> requestEntity = new HttpEntity<>(requestBody, headers);

		// 发送POST请求
		ResponseEntity<String> responseEntity = restTemplate.exchange(url, HttpMethod.POST, requestEntity,
				String.class);

		// 获取响应
		HttpStatusCode statusCode = responseEntity.getStatusCode();
		String responseBody = responseEntity.getBody();

		// 打印响应信息
		System.out.println("Status code: " + statusCode);
		System.out.println("Response body: " + responseBody);
	}
}