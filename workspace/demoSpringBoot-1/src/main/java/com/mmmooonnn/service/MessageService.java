package com.mmmooonnn.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

import com.mmmooonnn.model.MessageEntity;

@Service
public class MessageService {

    private final SimpMessagingTemplate simpMessagingTemplate;

    @Autowired
    public MessageService(SimpMessagingTemplate simpMessagingTemplate) {
        this.simpMessagingTemplate = simpMessagingTemplate;
    }

    public void sendToUser(MessageEntity messageEntity) {
        simpMessagingTemplate.convertAndSend("/chat/contact/" + messageEntity.getTo(), messageEntity);
    }
}



