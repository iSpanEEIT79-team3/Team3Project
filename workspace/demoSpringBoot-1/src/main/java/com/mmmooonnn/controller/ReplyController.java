package com.mmmooonnn.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mmmooonnn.model.ReplyBean;
import com.mmmooonnn.service.ReplyService;


@Controller
public class ReplyController {
	@Autowired
	private ReplyService ry;

	@GetMapping("/ReplySelectById1.controller")
	public String findByReplyId(@RequestParam("replyId") Integer replyId,Model mm) {
		ReplyBean resultBean = ry.findByReplyId(replyId);
		mm.addAttribute("replyBean",resultBean);
		
		return "forward:/WEB-INF/jsp/ReplySelect.jsp";
	}
	
	@GetMapping("/ReplySelectById.controller/{replyId}")
	public String findByReplyIdup(@RequestParam("replyId") Integer replyId,Model m) {
		ReplyBean resultBean = ry.findByReplyId(replyId);
		m.addAttribute("replyBean",resultBean);
		
		return "forward:/WEB-INF/jsp/ReplyUpdate.jsp";
	}
	
	
@GetMapping("/ReplySelectAll")
	public String findReply(Model m) {
			List<ReplyBean> replyList = ry.findReply();
			m.addAttribute("replyBeans", replyList);
			
			return "forward:/WEB-INF/jsp/ReplySelectAll.jsp";
			
	}

@PostMapping("Replyinsert.controller")
	public ModelAndView InsertReply(
			
			

			@RequestParam("userId") Integer userId,
			@RequestParam("replypost") String replypost, 
			@RequestParam("LTId") Integer LTId) {
		ModelAndView mv = new ModelAndView("redirect:ReplySelectAll");
		try {
			ReplyBean replyBean = new ReplyBean();
			replyBean.setLTId(LTId);
			replyBean.setReplypost(replypost);
			replyBean.setUserId(userId);
			
			 Date replytime1 = new Date(System.currentTimeMillis());
//	            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//	            String time = sdf.format(replytime1);
	           
	            replyBean.setReplytime(replytime1);
	            ry.InsertReply(replyBean);
			

		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("errorMessage", "An error occurred: " + e.getMessage());
		}
		return mv;
	}
		
@DeleteMapping("/ReplyDelete.controller")
    public String deleteBYReplyId(@RequestParam("replyId") Integer replyId) {
       ry.deleteBYReplyId(replyId);
       return"redirect:ReplySelectAll";
	
	
    }
    
 @PutMapping("/ReplyUpdate.controller")
    public String update(@RequestParam("replyId") String replyId,
            @RequestParam("userId") String userId,
            @RequestParam("LTId") String ltId,
            @RequestParam("replypost") String replypost,
            @RequestParam("replytime") String replytime ) {
           System.out.println(replytime);
	 Integer REPLYID=Integer.parseInt(replyId);
	 	Integer LTID = Integer.parseInt(ltId);
		Integer USERID = Integer.parseInt(userId);
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS"); 
	    Date parsedDate = null;
	    
	        try {
				parsedDate = dateFormat.parse(replytime);
			} catch (ParseException e) {
				e.printStackTrace();
			}
	        System.out.println(parsedDate);
		ReplyBean replyBean = new ReplyBean(REPLYID,parsedDate,replypost,LTID,USERID);
		ry.update(replyBean);
		
		return "redirect:ReplySelectAll";
    }
		
		

}
