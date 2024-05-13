package com.mmmooonnn.service;


import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;


@Service
public class MailService {
	
	@Autowired
    private JavaMailSender sender;
 
    private String from = "JFSwing <mhou6vm0@gmail.com>";
    
    /**
     * 發送純文本的信件
     * @param to
     * @param subject
     * @param content
     */
    public void sendSimpleMail(String to, String subject, String content){
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(from);
        message.setTo(to);
        message.setSubject(subject);
        message.setText(content);
        try {
            sender.send(message);
            System.out.println("郵件已經發送。"); 
        } catch (Exception e) {
            System.out.println("發送郵件發生異常！"); 
        }
    }
    /**
     * 發送html格式的信件
     * @param to
     * @param subject
     * @param content
     */
    public void sendHtmlMail(String subject, String content,String to){
        MimeMessage message = sender.createMimeMessage();
        try {
            //true表示需要创建一个multipart message
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setFrom(from);
            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(content, true);
            sender.send(message);
            System.out.println("html信件已經發送。");
        } catch (MessagingException e) {
            System.out.println("發送html信件發生異常！");
        }
    }
    /**
     * 發送帶附件的信件
     * @param to
     * @param subject
     * @param content
     * @param filePath
     */
    public void sendAttachmentsMail(String to, String subject, String content, String filePath){
        MimeMessage message = sender.createMimeMessage();
        try {
            //true表示需要創建一個multipart message
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setFrom(from);
            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(content, true);
            FileSystemResource file = new FileSystemResource(new File(filePath));
            String fileName = filePath.substring(filePath.lastIndexOf(File.separator));
            helper.addAttachment(fileName, file);
            sender.send(message);
            System.out.println("带附件的信件已經發送。");
        } catch (MessagingException e) {
        	System.out.println("發送带附件的信件時發生異常！");
        }
    }
    /**
     * 發送嵌入靜態資源（圖片）的信件
     * @param to
     * @param subject
     * @param content 信件内容，需要包括一個靜態資源的id，比如：<img src=\"cid:rscId01\" >
     * @param rscPath 靜態資源路徑和文件名
     * @param rscId 靜態資源id
     */
    public void sendInlineResourceMail(String to, String subject, String content, String rscPath, String rscId){
        MimeMessage message = sender.createMimeMessage();
        try {
            //true表示需要创建一个multipart message
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setFrom(from);
            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(content, true);
            FileSystemResource res = new FileSystemResource(new File(rscPath));
            helper.addInline(rscId, res);
            sender.send(message);
            System.out.println("嵌入靜態資源的信件已經發送。");
        } catch (MessagingException e) {
        	System.out.println("發送嵌入靜態資源的信件時發生異常！");
        }
    }
	
	
	
	
	
	
	
	
	
	
	
}
