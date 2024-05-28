package com.mmmooonnn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class PageContorller {

	// 前端點選會員登入
	@GetMapping("/UserLogin")
	public String processActionLogin() {
		return "redirect:/html/frontPage.html";
	}

	// 跳轉到後端會員資料
	@GetMapping("/back")
	public String processActionGet() {
		return "redirect:/back/user/UserGetAll.html";
	}

	// 跳轉到登入畫面
	@GetMapping("/UserLoginTest")
	public String processActionGetUserLoginTest() {
		return "redirect:/front/user/UserLoginTest.html";
	}

	// 跳轉到註冊頁面
	@GetMapping("/registerUser")
	public String processActionRegisterUser() {
		return "redirect:/front/user/UserRegister.html";
	}

	// 後端登出
	@GetMapping("/backLogout")
	public String processActionLogout() {
		return "redirect:/html/frontPage.html";
	}

	// 首頁跳轉
	@GetMapping("/frontPage")
	public String processActionFrontPage() {
		return "redirect:/html/frontPage.html";
	}

	// 會員中心
	@GetMapping("/UpdateUser")
	public String processActionUpdateUser(HttpSession session) {
		Object user = session.getAttribute("usersBean");
		if (user != null) {
			return "redirect:/front/user/UpdateUser.html";

		}
		System.out.println("沒有登入會員");
		return "redirect:/UserLoginTest";
	}

}
