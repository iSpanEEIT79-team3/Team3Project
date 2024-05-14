package com.mmmooonnn.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RestController;

import com.mmmooonnn.model.MessageEntity;
import com.mmmooonnn.service.MessageService;

@RestController
public class ChatController {

    private final SimpMessagingTemplate simpMessagingTemplate;

    @Autowired
    public ChatController(SimpMessagingTemplate simpMessagingTemplate) {
        this.simpMessagingTemplate = simpMessagingTemplate;
    }

    @MessageMapping("/sendMsg")
    public void sendMsg(MessageEntity messageEntity) {
        simpMessagingTemplate.convertAndSend("/chat/contact/" + messageEntity.getTo(), messageEntity);
    }
}

