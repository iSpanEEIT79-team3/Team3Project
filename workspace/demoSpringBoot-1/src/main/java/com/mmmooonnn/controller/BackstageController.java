package com.mmmooonnn.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mmmooonnn.service.BackstageService;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class BackstageController {
	
	@Autowired
	private BackstageService bService;
	
	//用於緩存的map
	//	private Map<String, Object> cacheMap = new HashMap<>();

	
	@PostMapping("/backstage")
	public ResponseEntity<String> processAction(@RequestParam("email") String email,
												@RequestParam("password") String password,
												HttpSession session){
		System.out.println(email + " " + password);
		if(bService.findUserByEmailPassword(email, password)) {
			System.out.println("正確");
			session.setAttribute("email", email);
			
			return ResponseEntity.ok().body("登入成功");
		} else {
            System.out.println("信箱或者密碼錯誤");
            
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("信箱或者密碼錯誤");
        }
		
	}
	
	@GetMapping("/successLogin")
	public ModelAndView getMethodName() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:html/allUsers.html");
		return modelAndView;
	}
	
}
