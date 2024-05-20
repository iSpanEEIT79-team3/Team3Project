package com.mmmooonnn.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

import com.mmmooonnn.CustomHandshakeHandler;



@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

//    @Autowired
//    private  WebsocketHandler websocketHandler;
//    @Autowired
//    private WebsocketInterceptor websocketInterceptor;

    @Override
    public void configureMessageBroker(MessageBrokerRegistry config) {
    	config.enableSimpleBroker("/chat");
    }


    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
//        registry.addEndpoint("/chatroom").setAllowedOriginPatterns("*").withSockJS(); 
        registry.addEndpoint("/websocket/{id}").setHandshakeHandler(new CustomHandshakeHandler());
    }
    
//    public void registerWebsocketHandlers(WebSocketHandlerRegistry webSocketHandlerRegistry) {
//    	webSocketHandlerRegistry.addHandler(null, "").withSockJS();
//    }

}


