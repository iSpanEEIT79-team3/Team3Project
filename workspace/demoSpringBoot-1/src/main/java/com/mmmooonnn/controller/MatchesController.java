package com.mmmooonnn.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mmmooonnn.model.MatchUserDetailsDTO;
import com.mmmooonnn.model.UsersBeanNew;
import com.mmmooonnn.service.MatchesService;
import com.mmmooonnn.service.UsersService;

import jakarta.servlet.http.HttpSession;

@Controller
//@RequestMapping("/api/matches")
public class MatchesController {

	@Autowired
	private MatchesService matchesService;
	@Autowired
	private UsersService usersService3;





//	@RequestMapping("/index")
	@GetMapping("/matchIndex")
	public String index(HttpSession session, Model model) {
		UsersBeanNew user = (UsersBeanNew)session.getAttribute("usersBean");
		System.out.println(user);
		 List<UsersBeanNew> matches = matchesService.getMatchesByStatus(user.getUserId());
		 System.out.println(matches);
	        model.addAttribute("matches", matches);
	        model.addAttribute("loginuser", user);
		return "forward:/WEB-INF/jsp/test.jsp";
	}
	@PostMapping("/createMatch")
	public String createMatch(@RequestParam("userId1") Integer userId1, @RequestParam("userId2") Integer userId2) {
	    matchesService.createMatch(userId1, userId2);
	    return "redirect:/matchIndex"; // 重定向到顯示配對結果的頁面
	}
	 
	
	
}
