package com.mmmooonnn.config;

import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

public class WebAppConfig implements WebMvcConfigurer{
	
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
//		registry.addViewController("/login/page").setViewName("login.jsp");
//		registry.addViewController("/login/welcome").setViewName("welcome.jsp");
//		registry.addViewController("/logout").setViewName("logoutResult.jsp");
//		registry.addViewController("/logout/page").setViewName("logout.jsp");
		
	}
	
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/css/**").addResourceLocations("/WEB-INF/resources/css/");
	}
}
