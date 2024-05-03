package com.mmmooonnn.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mmmooonnn.model.MatchUserDetailsDTO;
import com.mmmooonnn.model.UsersBeanNew;
import com.mmmooonnn.service.MatchesService;
import com.mmmooonnn.service.UsersService;

@Controller
@RequestMapping("/api/matches")
public class MatchesController {

	@Autowired
	private MatchesService matchesService;
	@Autowired
	private UsersService usersService3;

	@GetMapping("/matchUserDetails/byStatus")
	public List<MatchUserDetailsDTO> getMatchesByStatus(@RequestParam("status") String status) {

		return matchesService.getMatchesByStatus(status);
	}

	@GetMapping("/GetAllUser2")
	@ResponseBody
	public String processActionGetAllUser() {
	    List<UsersBeanNew> users = usersService3.getAll();
	    StringBuilder htmlBuilder = new StringBuilder();

	    // 開始HTML
	    htmlBuilder.append("<!DOCTYPE html>");
	    htmlBuilder.append("<html lang=\"en\">");
	    htmlBuilder.append("<head>");
	    htmlBuilder.append("<meta charset=\"UTF-8\">");
	    htmlBuilder.append("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">");
	    htmlBuilder.append("<title>User List</title>");
	    htmlBuilder.append("</head>");
	    htmlBuilder.append("<body>");
	    htmlBuilder.append("<h1>User List</h1>");
	    htmlBuilder.append("<ul id=\"userList\">");

	    // 對每個用戶生成卡片
	    for (UsersBeanNew user : users) {
	        htmlBuilder.append("<div class=\"card\">");
	        // 插入會員圖片
	        htmlBuilder.append("<img src=\"" + user.getPicture() + "\" alt=\"User Image\">");
	        // 添加按鈕和愛心
	        htmlBuilder.append("<div class=\"buttons\">");
	        htmlBuilder.append("<div class=\"like-btn\">❤️</div>");
	        htmlBuilder.append("<div class=\"dislike-btn\">❌</div>");
	        htmlBuilder.append("</div>");
	        // 愛心動畫
	        htmlBuilder.append("<div class=\"heart\"></div>");
	        htmlBuilder.append("</div>");
	    }

	    // 結束HTML
	    htmlBuilder.append("</ul>");
	    htmlBuilder.append("</body>");
	    htmlBuilder.append("</html>");

	    return htmlBuilder.toString();
	}

}
