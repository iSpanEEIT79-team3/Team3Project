package com.mmmooonnn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PageContorller {
	
	
		//管理者登入成功
		@GetMapping("/successLogin")
		public ModelAndView getMethodName() {
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("/back");
			return modelAndView;
		}
		
		//前端點選會員登入
		@GetMapping("/UserLogin")
		public String processActionLogin() {
			return "redirect:/html/frontPage.html";
		}
		//代訂
		@GetMapping("/back")
		public String processActionGet() {
			return "/back";
		}
		
		@GetMapping("/UserLoginTest")
		public String processActionGetUserLoginTest() {
			return "redirect:/html/UserLoginTest.html";
		}
}
