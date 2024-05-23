package com.mmmooonnn.controller;

import java.lang.annotation.AnnotationTypeMismatchException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.weaving.DefaultContextLoadTimeWeaver;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mmmooonnn.config.SocketModel;
import com.mmmooonnn.model.MatchUserDetailsDTO;
import com.mmmooonnn.model.MatchesBean;
import com.mmmooonnn.model.MessageEntity;
import com.mmmooonnn.model.UsersBeanNew;
import com.mmmooonnn.service.MatchesService;
import com.mmmooonnn.service.MessageService;
import com.mmmooonnn.service.UsersService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
//@RequestMapping("/api/matches")
public class MatchesController {

	@Autowired
	private MatchesService matchesService;
	@Autowired
	private UsersService usersService3;
	@Autowired
	MessageService messageService;

//	@RequestMapping("/index")
	@GetMapping("/matchIndex")
	public String index(HttpSession session, Model model) {
		UsersBeanNew user = (UsersBeanNew) session.getAttribute("usersBean");
		System.out.println(user);
		List<UsersBeanNew> matches = matchesService.getMatchesByStatus(user.getUserId());
		System.out.println(matches);
		model.addAttribute("matches", matches);
		model.addAttribute("loginuser", user);
		return "forward:/WEB-INF/jsp/front/match/MatchIndex.jsp";
	}

	@PostMapping("/createMatch")
	public String createMatch(@RequestParam("userId1") Integer userId1, @RequestParam("userId2") Integer userId2,
			@RequestParam("matchSuccess") String matchSuccess, @RequestParam("matchStatus") String matchStatus) {

		matchesService.createMatch(userId1, userId2, matchSuccess, matchStatus);

		return "redirect:/matchIndex"; // 重定向到顯示配對結果的頁面
	}

	@GetMapping("/matches")
	public String getMatch(HttpSession session, Model model) {
		UsersBeanNew user = (UsersBeanNew) session.getAttribute("usersBean");

		List<MatchUserDetailsDTO> isMatch = null;

		Integer userId = user.getUserId();
		System.out.println(userId);
		try {
			isMatch = matchesService.getMatches(userId);

		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(isMatch);

		model.addAttribute("isMatch", isMatch);
		model.addAttribute("loginuser", user);

		return "forward:/WEB-INF/jsp/front/match/IsMatch.jsp";
	}
	@GetMapping("/GetAllMatches")
	public ModelAndView processActionGetAllMatches() {
		ModelAndView modelAndView = new ModelAndView();
		
		List<MatchesBean> Allmatches = matchesService.getAll();
		System.out.println(Allmatches);
		modelAndView.addObject("Allmatches", Allmatches);
		modelAndView.setViewName("forward:/WEB-INF/jsp/back/match/PairingRecord.jsp");
		
		return modelAndView;
	}
	
	@GetMapping("/chatroomIndex")
	public String chatroomIndex(HttpSession session, Model model ,HttpServletRequest request) {
		UsersBeanNew user = (UsersBeanNew) session.getAttribute("usersBean");
		model.addAttribute("loginuser", user);
		model.addAttribute("user2id", request.getParameter("user2id"));
		model.addAttribute("nickName2", request.getParameter("nickName2"));
		model.addAttribute("picture2", request.getParameter("picture2"));
		return "forward:/WEB-INF/jsp/Chatroom_text.jsp";
	}

    @MessageMapping("/sendMsg")
    public void sendMsg(MessageEntity messageEntity) {
        messageService.sendToUser(messageEntity);
    }


}
