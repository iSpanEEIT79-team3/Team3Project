package com.mmmooonnn.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mmmooonnn.model.MatchUserDetailsDTO;
import com.mmmooonnn.model.UsersBeanNew;
import com.mmmooonnn.service.MatchesService;
import com.mmmooonnn.service.UsersService;

@Controller
//@RequestMapping("/api/matches")
public class MatchesController {

	@Autowired
	private MatchesService matchesService;
	@Autowired
	private UsersService usersService3;





//	@RequestMapping("/index")
	@GetMapping("/matchIndex")
	public String index(@RequestParam Integer userid, Model model) {
		 List<UsersBeanNew> matches = matchesService.getMatchesByStatus(userid);
		 System.out.println(matches);
	        model.addAttribute("matches", matches);
		return "forward:/WEB-INF/jsp/test.jsp";
	}
	 
	
	
}
