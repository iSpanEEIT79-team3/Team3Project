package com.mmmooonnn.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mmmooonnn.model.LTBean;
import com.mmmooonnn.service.LTService;
import com.mmmooonnn.service.LikeService;



@Controller

// @MultipartConfig(location =
// "C:/Spring/workspace/SpringMVC/src/main/webapp/images")
public class LTController {

	@Autowired
	private LTService lt;
	@Autowired
	private LikeService lr;

	
	@GetMapping("/LTSelectById1.controller")
	public String findByLTId(@RequestParam("ltId") Integer ltId, Model mm) {
		LTBean resultBean = lt.findByLTId(ltId);
		System.out.println(resultBean);
		mm.addAttribute("ltBean", resultBean);
		
		return "forward:/WEB-INF/jsp/back/lt/LTSelect.jsp";

	}
	
	@GetMapping("/LTSelectById.controller/{ltId}")
	public String findByLTIdup(@PathVariable  Integer ltId, Model m) {
		LTBean resultBean = lt.findByLTId(ltId);
		System.out.println(resultBean);
		m.addAttribute("ltBean", resultBean);
		
		return "forward:/WEB-INF/jsp/back/lt/LTUpdate.jsp";

	}

	@GetMapping("/LTSelectAll")
	public String LTSelectAll(Model m) {
		List<LTBean> LTList = lt.findLT();
		m.addAttribute("ltBeans", LTList);

		return "forward:/WEB-INF/jsp/back/lt/LTBack.jsp";

	}
	


	@PostMapping("/LTinsert.controller")
	@ResponseBody
	public ModelAndView InsertLT(@RequestParam("title") String title, @RequestParam("userId") String userId,
			@RequestParam("picture") MultipartFile picture, @RequestParam("content") String content
			/*@RequestParam("saveLike") Integer saveLike*/) {
		ModelAndView mv = new ModelAndView();

		try {
			LTBean ltBean = new LTBean();
			if (!picture.isEmpty()) {
				String fileurl = "C:\\Spring\\workspace\\SpringMvcWork\\src\\main\\webapp\\images";
				String fileName = picture.getOriginalFilename();

				File fileurl1 = new File(fileurl, fileName);
				picture.transferTo(fileurl1);
				ltBean.setPicture("images/" + fileName);
			}

			ltBean.setTitle(title);
			ltBean.setUserId(Integer.parseInt(userId));
			ltBean.setContent(content);
			ltBean.setSaveLike(0);
			 Date DATE = new Date(System.currentTimeMillis());

			ltBean.setDate(DATE);
			lt.insertLT(ltBean);

		} catch (Exception e) {

			e.printStackTrace();
			mv.addObject("errorMessage", "An error occurred: " + e.getMessage());

		}
		mv.setViewName("redirect:/LTSelectAll");

		return mv;
	}

	@DeleteMapping("/LTDeleteById.controller")
	public String deleteBYLTId(@RequestParam("ltId") Integer ltId) {
		lt.deleteById(ltId);
		return "redirect:/LTSelectAll";
	}

	@PutMapping("/LTUpdate.controller")
	public String update(@RequestParam("ltId") String ltId, @RequestParam("title") String title,
			@RequestParam("userId") String userId, @RequestParam("date") String date,
			@RequestParam("picture") MultipartFile picture, @RequestParam("content") String content
			) {
		
		Integer LTID = Integer.parseInt(ltId);
		Integer USERID = Integer.parseInt(userId);
			LTBean ltBean = new LTBean();

//		try {
//
//			if (!picture.isEmpty()) {
//				String fileurl = "C:\\Spring\\workspace\\SpringMvcWork\\src\\main\\webapp\\images";
//				String fileName = picture.getOriginalFilename();
//
//				File fileurl1 = new File(fileurl, fileName);
//				picture.transferTo(fileurl1);
//				ltBean.setPicture("images/" + fileName);
//			}
			ltBean.setLtId(LTID);
			ltBean.setUserId(USERID);
			
			ltBean.setTitle(title);
			
			ltBean.setContent(content);	
			ltBean.setSaveLike(0);
			Date DATE = new Date(System.currentTimeMillis());

			ltBean.setDate(DATE);

			lt.update(ltBean);

//		} catch (Exception e) {
//
//			e.printStackTrace();
//
//		}
		return "redirect:/LTSelectAll";

	}
	
	
	
	@GetMapping("/findtitle")
	public String findByTitle(@RequestParam("title") String title, Model mm) {
	    List<LTBean> ltBeans = lt.findByTitle(title);
	    mm.addAttribute("ltBeans", ltBeans);
	    return "forward:/WEB-INF/jsp/back/lt/LTTitle.jsp";
	}
	
//	@PostMapping("/Likeinsert1.controller")
//	public ModelAndView InsertLike(@RequestParam("userId") Integer userId, @RequestParam("ltId") Integer ltId) {
//	    ModelAndView mv = new ModelAndView();
//
//	    // 檢查是否已經按過讚
//	    LikeBean existingLike = lr.findByUserIdAndLtId(userId, ltId);
//	    if (existingLike != null) {
//	        // 如果已經按過讚，則取消按讚
//	        lr.deleteByUserIdAndLtId(userId, ltId);
//	        // 更新文章的按讚數量
//	        int likeCount = lr.getLikeCount(ltId);
//	        lt.updateLikeCount(ltId, likeCount - 1);
//	    } else {
//	        // 如果還未按讚，則新增一條按讚紀錄
//	        LikeBean newLike = new LikeBean();
//	        newLike.setUserId(userId);
//	        newLike.setLtId(ltId);
//	        lr.insertLike(newLike);
//	        // 更新文章的按讚數量
//	        int likeCount = lr.getLikeCount(ltId);
//	        lt.updateLikeCount(ltId, likeCount + 1);
//	    }
//
//	    // 重定向到該文章的頁面
//	    mv.setViewName("redirect:/LTSelectById.controller?ltId=" + ltId);
//	    return mv;
//	}

	//分ㄧㄝ
	
}
