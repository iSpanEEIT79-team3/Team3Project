package com.mmmooonnn.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mmmooonnn.model.MatchBean;
import com.mmmooonnn.model.MatchRecordBean;
import com.mmmooonnn.service.MatchRecordService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MatchRecordController {
	
	@Autowired
	private MatchRecordService mReService;
	
	   

	    @PostMapping("/match")
	    public String matchUsers(HttpServletRequest request,
	                             @RequestParam("genderPreference") String genderPreference,
	                             @RequestParam("maxAge") int maxAge) {
	        HttpSession session = request.getSession();
	        MatchBean matchBean = (MatchBean) session.getAttribute("Match");
	        System.out.println(matchBean);
	        int specifiedUserId = matchBean.getId();
	        System.out.println(specifiedUserId);
	        MatchRecordBean matchRecordBean = mReService.matchUsers(genderPreference, maxAge, specifiedUserId);
	        request.setAttribute("matchRecord", matchRecordBean);
	        return "forward:/WEB-INF/jsp/match.jsp"; // 如果是 RESTful API，可以返回 JSON 字串，如果是 MVC 模式，可以返回視圖名稱
	    }
	
	
}
