package com.mmmooonnn.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
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
import com.mmmooonnn.model.LikeBean;
import com.mmmooonnn.model.UsersBeanNew;
import com.mmmooonnn.service.LTService;
import com.mmmooonnn.service.LikeService;

import jakarta.servlet.http.HttpSession;

@Controller

// @MultipartConfig(location =
// "C:/Spring/workspace/SpringMVC/src/main/webapp/images")
public class LTControllerFront {

	@Autowired
	private LTService lt;
	@Autowired
	private LikeService lr;


	@GetMapping("/LTSelectById1Front.controller")
	public String findByLTId(@RequestParam("ltId") Integer ltId, Model mm) {
		LTBean resultBean = lt.findByLTId(ltId);
		System.out.println(resultBean);
		mm.addAttribute("ltBean", resultBean);

		return "forward:/WEB-INF/jsp/LTSelectFront.jsp";

	}

	@GetMapping("/LTSelectByIdFront.controller/{ltId}")
	public String findByLTIdup(@PathVariable Integer ltId, Model m) {
		LTBean resultBean = lt.findByLTId(ltId);
		System.out.println(resultBean);
		m.addAttribute("ltBean", resultBean);

		return "forward:/WEB-INF/jsp/LTUpdateFront.jsp";

	}

	@GetMapping("/LTSelectAllFront")
	public String LTSelectAll(Model m) {
		List<LTBean> LTList = lt.findLT();
		m.addAttribute("ltBeans", LTList);

		return "forward:/WEB-INF/jsp/LTSelectAllFront.jsp";

	}

	@PostMapping("/LTinsertFront.controller")
	@ResponseBody
	public ModelAndView InsertLT(@RequestParam("title") String title, /* @RequestParam("userId") String userId */
			@RequestParam("picture") MultipartFile picture, @RequestParam("content") String content
			/* @RequestParam("saveLike") Integer saveLike */, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		UsersBeanNew user = (UsersBeanNew) session.getAttribute("usersBean");

		try {
			LTBean ltBean = new LTBean();
			if (!picture.isEmpty()) {
				String fileurl = "C:\\Spring\\workspace\\SpringMvcWork\\src\\main\\webapp\\images";
				String fileName = picture.getOriginalFilename();

				File fileurl1 = new File(fileurl, fileName);
				picture.transferTo(fileurl1);
				ltBean.setPicture("images/" + fileName);
			}
			ltBean.setUserId(user.getUserId());
			ltBean.setTitle(title);
			ltBean.setContent(content);
			ltBean.setSaveLike(0);
			Date DATE = new Date(System.currentTimeMillis());

			ltBean.setDate(DATE);
			lt.insertLT(ltBean);

		} catch (Exception e) {

			e.printStackTrace();
			mv.addObject("errorMessage", "An error occurred: " + e.getMessage());

		}
		mv.setViewName("redirect:LTSelectAllFront");

		return mv;
	}

	@DeleteMapping("/LTDeleteByIdFront.controller")
	public String deleteBYLTId(@RequestParam("ltId") Integer ltId) {
		lt.deleteById(ltId);
		return "redirect:LTSelectAllFront";
	}

	@PutMapping("/LTUpdateFront.controller")
	public String update(@RequestParam("ltId") String ltId, @RequestParam("title") String title,
			@RequestParam("userId") String userId, @RequestParam("date") String date,
			@RequestParam("picture") MultipartFile picture, @RequestParam("content") String content
			) {
		
		Integer LTID = Integer.parseInt(ltId);
		Integer USERID = Integer.parseInt(userId);

		try {

			LTBean ltBean = new LTBean();
			if (!picture.isEmpty()) {
				String fileurl = "C:\\Spring\\workspace\\SpringMvcWork\\src\\main\\webapp\\images";
				String fileName = picture.getOriginalFilename();

				File fileurl1 = new File(fileurl, fileName);
				picture.transferTo(fileurl1);
				ltBean.setPicture("images/" + fileName);
			}
			ltBean.setLtId(LTID);
			ltBean.setUserId(USERID);
			
			ltBean.setTitle(title);
			
			ltBean.setContent(content);
			ltBean.setSaveLike(0);
			Date DATE = new Date(System.currentTimeMillis());

			ltBean.setDate(DATE);

			lt.update(ltBean);

		} catch (Exception e) {

			e.printStackTrace();

		}
		return "redirect:LTSelectAllFront";

	}

	@GetMapping("/findtitleFront")
	public String findByTitle(@RequestParam("title") String title, Model mm) {
		List<LTBean> ltBeans = lt.findByTitle(title);
		mm.addAttribute("ltBeans", ltBeans);
		System.out.println(title);
		System.out.println(88888888);
		System.out.println(ltBeans);
		return "forward:/WEB-INF/jsp/LTTitleFront.jsp";
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

	@GetMapping("LTIndex")
	public String ltIndex() {

		return "forward:/WEB-INF/jsp/LTIndex.jsp";
	}

	// 分頁
	@GetMapping(path = "/pageALL")
	@ResponseBody
	public Page<LTBean> LTPage(@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "5") int size) {
		Pageable pageable = PageRequest.of(page, size, Sort.by("ltId").descending());
		Page<LTBean> pageL = lt.finPage(pageable);
		System.out.println(pageL);

		return pageL;

	}

	@GetMapping("/getuserId")
	@ResponseBody
	public Integer getUserId(HttpSession session) {

		UsersBeanNew user = (UsersBeanNew) session.getAttribute("usersBean");
		if (user != null) {
			System.out.println(user);
			return user.getUserId();
		} else {

			return null;

		}

	}

}
