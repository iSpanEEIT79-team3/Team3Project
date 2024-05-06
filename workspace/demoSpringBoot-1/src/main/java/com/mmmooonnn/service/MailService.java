package com.mmmooonnn.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailService {
	
	@Autowired
	private JavaMailSender mailSender;
	
	public void sendPlainText(String receivers, String subject,String content) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(receivers);
		message.setSubject(subject);
		message.setText(content);
		
		message.setFrom("JFSwing<xxx@gmail.com>");
		
		mailSender.send(message);
	}
	
	
}
