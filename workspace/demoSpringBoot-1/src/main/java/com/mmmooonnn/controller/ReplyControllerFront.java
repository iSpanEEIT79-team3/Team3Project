package com.mmmooonnn.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mmmooonnn.model.LTBean;
import com.mmmooonnn.model.ReplyBean;
import com.mmmooonnn.service.LTService;
import com.mmmooonnn.service.ReplyService;



@Controller
public class ReplyControllerFront {
	@Autowired
	private ReplyService ry;
	@Autowired
	private LTService lt;

	@GetMapping("/ReplySelectByIdFront.controller")
	public String findByReplyId(@RequestParam("replyId") Integer replyId,Integer ltId,Model mm) {
		//呼叫主文加到MODEL
		LTBean resultBean = lt.findByLTId(ltId);
		
		ReplyBean resultBean1 = ry.findByReplyId(replyId);
		mm.addAttribute("replyBean",resultBean);
		mm.addAttribute("ltBeans", resultBean1);

		
		return "forward:/WEB-INF/jsp/ReplySelectFront.jsp";
	}
	@GetMapping("/ReplySelectByIdFront.controller/{replyId}")
	public String findByReplyIdup(@RequestParam("replyId") Integer replyId,Model m) {
		ReplyBean resultBean = ry.findByReplyId(replyId);
		m.addAttribute("replyBean",resultBean);
		
		return "forward:/WEB-INF/jsp/ReplyUpdate.jsp";
	}	
	
	
@GetMapping("/ReplySelectAllFront")
	public String findReply(Model m) {
			List<ReplyBean> replyList = ry.findReply();
			
			m.addAttribute("replyBeans", replyList);
			
			return "forward:/WEB-INF/jsp/ReplySelectAllFront.jsp";
			
	}
@PostMapping("ReplyinsertFront.controller")
public ModelAndView InsertReply(
		@RequestParam("userId") Integer userId,
		@RequestParam("replypost") String replypost, 
		@RequestParam("LTId") Integer LTId ,Model m) {
		
	ModelAndView mv = new ModelAndView("redirect:ReplySelectAll");
	
		LTBean ltBean = lt.findByLTId(LTId);
		ReplyBean replyBean = new ReplyBean();
		replyBean.setLtBean(ltBean);
		replyBean.setReplypost(replypost);
		replyBean.setUserId(userId);
		
		 Date replytime1 = new Date(System.currentTimeMillis());
//            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 
		 
//            String time = sdf.format(replytime1);
           
            replyBean.setReplytime(replytime1);
            ry.InsertReply(replyBean);
		m.addAttribute("replyBean",replyBean);
	
	
	return mv;
}

		
@DeleteMapping("/ReplyDeleteFront.controller")
    public String deleteBYReplyId(@RequestParam("replyId") Integer replyId) {
       ry.deleteBYReplyId(replyId);
       return"redirect:ReplySelectAll";
	
	
    }
    
 @PutMapping("/ReplyUpdateFront.controller")
    public String update(@RequestParam("replyId") String replyId,
            @RequestParam("userId") String userId,
            @RequestParam("LTId") Integer ltId,
            @RequestParam("replypost") String replypost,
            @RequestParam("replytime") String replytime )

 
 
 {
           System.out.println(replytime);
	 Integer REPLYID=Integer.parseInt(replyId);
//	 	Integer LTID = Integer.parseInt(ltId);
		Integer USERID = Integer.parseInt(userId);
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS"); 
	    Date parsedDate = null;
	    
	        try {
	        	LTBean	ltBean	= lt.findByLTId(ltId);
				parsedDate = dateFormat.parse(replytime);
				ReplyBean replyBean = new ReplyBean(REPLYID,parsedDate,replypost,USERID,ltBean);
				ry.update(replyBean);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		
		return "redirect:ReplySelectAll";
    }
		
	@GetMapping("/findLTIDFront/{ltId}")
	public String findByID(@PathVariable("ltId") Integer ltId,Model mm) 
	{
		System.out.println("ltId:"+ltId);
		//List<ReplyBean> replyBeans = ry.findID(ltId);
		//System.out.println("replyBeans"+replyBeans);
		LTBean resultBean = lt.findByLTId(ltId);
		System.out.println("resultBean"+resultBean);
		Set<ReplyBean> replyBeans = resultBean.getReplyBeans();
		System.out.println("ReplyBeans"+resultBean.getReplyBeans());
	    mm.addAttribute("replyBean", replyBeans);
		mm.addAttribute("items", resultBean);
	    return "forward:/WEB-INF/jsp/ReplySelectLTIdFront.jsp";
	}
}
		

