package com.mmmooonnn.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.mmmooonnn.model.pageViewsBean;
import com.mmmooonnn.service.LTService;
import com.mmmooonnn.service.LikeService;
import com.mmmooonnn.service.UsersService;

import jakarta.servlet.http.HttpSession;

@Controller

// @MultipartConfig(location =
// "C:/Spring/workspace/SpringMVC/src/main/webapp/images")
public class LTControllerFront {

	@Autowired
	private LTService lt;
	@Autowired
	private LikeService lr;
	@Autowired
	private UsersService usersService;

	@GetMapping("/LTSelectById1Front.controller")
	public String findByLTId(@RequestParam("ltId") Integer ltId, Model mm) {
		LTBean resultBean = lt.findByLTId(ltId);
		System.out.println(resultBean);
		mm.addAttribute("ltBean", resultBean);

		return "forward:/WEB-INF/jsp/front/lt/LTSelectFront.jsp";

	}

	@GetMapping("/LTSelectByIdFront.controller/{ltId}")
	public String findByLTIdup(@PathVariable Integer ltId, Model m) {
		LTBean resultBean = lt.findByLTId(ltId);
		System.out.println(resultBean);
		m.addAttribute("ltBean", resultBean);

		return "forward:/WEB-INF/jsp/front/lt/LTUpdateFront.jsp";

	}

	@GetMapping("/LTSelectAllFront")
	public String LTSelectAll(Model m) {
		List<LTBean> LTList = lt.findLT();
//		List<UsersBeanNew> usersNickName= new ArrayList<>();
//		for (LTBean ltBean : LTList) {
//			Integer userId = ltBean.getUserId();
//			UsersBeanNew findUserById = usersService.findUserById(userId);
//			usersNickName.add(findUserById);
//			
//		}

		m.addAttribute("ltBeans", LTList);
//		m.addAttribute("usersNickName",usersNickName);
		return "forward:/WEB-INF/jsp/front/lt/LTSelectAllFront.jsp";

	}

	@PostMapping("/LTinsertFront.controller")
	@ResponseBody
	public ModelAndView InsertLT(@RequestParam("title") String title, @RequestParam("picture") MultipartFile picture,
			@RequestParam("content") String content, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		UsersBeanNew user = (UsersBeanNew) session.getAttribute("usersBean");

		try {
			LTBean ltBean = new LTBean();
			if (!picture.isEmpty()) {
				String fileurl = "C:\\team3\\workspace\\demoSpringBoot-1\\src\\main\\resources\\static\\images";
				String fileName = picture.getOriginalFilename();

				File fileurl1 = new File(fileurl, fileName);
				picture.transferTo(fileurl1);
				ltBean.setPicture("images/" + fileName);
			}
			ltBean.setUserId(user.getUserId());
			ltBean.setUserName(user.getNickName());

			ltBean.setTitle(title);
			ltBean.setContent(content);
			ltBean.setSaveLike(0);
			ltBean.setPageViews(0);
			Date DATE = new Date(System.currentTimeMillis());

			ltBean.setDate(DATE);
			lt.insertLT(ltBean);

		} catch (Exception e) {

			e.printStackTrace();
			mv.addObject("errorMessage", "An error occurred: " + e.getMessage());

		}
		mv.setViewName("redirect:/LTSelectAllFront");

		return mv;
	}

	@DeleteMapping("/LTDeleteByIdFront.controller")
	public String deleteBYLTId(@RequestParam("ltId") Integer ltId) {
		lt.deleteById(ltId);
		return "redirect:/LTSelectAllFront";
	}

	@PutMapping("/LTUpdateFront.controller")
	public String update(@RequestParam("ltId") String ltId, @RequestParam("title") String title,
			@RequestParam("userId") String userId, @RequestParam("date") String date,
			@RequestParam("picture") MultipartFile picture, @RequestParam("content") String content,
			@RequestParam("pageViews") Integer pageViews, @RequestParam("userName") String userName) {

		Integer LTID = Integer.parseInt(ltId);
		Integer USERID = Integer.parseInt(userId);

		try {

			LTBean ltBean = new LTBean();
			if (!picture.isEmpty()) {
				String fileurl = "C:\\team3\\workspace\\demoSpringBoot-1\\src\\main\\resources\\static\\images";
				String fileName = picture.getOriginalFilename();

				File fileurl1 = new File(fileurl, fileName);
				picture.transferTo(fileurl1);
				ltBean.setPicture("images/" + fileName);
			}
			ltBean.setLtId(LTID);
			ltBean.setUserId(USERID);
			ltBean.setPageViews(pageViews);
			ltBean.setTitle(title);
			ltBean.setContent(content);
			ltBean.setUserName(userName);

			ltBean.setSaveLike(0);
			Date DATE = new Date(System.currentTimeMillis());

			ltBean.setDate(DATE);

			lt.update(ltBean);

		} catch (Exception e) {

			e.printStackTrace();

		}
		return "redirect:/LTSelectAllFront";

	}

	@GetMapping("/findtitleFront")
	public String findByTitle(@RequestParam("title") String title, Model mm) {
		List<LTBean> ltBeans = lt.findByTitle(title);
		mm.addAttribute("ltBeans", ltBeans);
		System.out.println(title);
		System.out.println(88888888);
		System.out.println(ltBeans);
		return "forward:/WEB-INF/jsp/front/lt/LTTitleFront.jsp";
	}

	@GetMapping("LTIndex")
	public String ltIndex() {

		return "forward:/WEB-INF/jsp/LTIndex.jsp";
	}

	// 分頁
	@GetMapping(path = "/pageALL")
	@ResponseBody
	public Page<LTBean> LTPage(@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "5") int size,
			Model m, HttpSession session) {
		Pageable pageable = PageRequest.of(page, size, Sort.by("ltId").descending());
		Page<LTBean> pageL = lt.finPage(pageable);
		UsersBeanNew user = (UsersBeanNew) session.getAttribute("usersBean");
		System.out.println(pageL);
		List<UsersBeanNew> usersNickName = new ArrayList<>();
		for (LTBean ltBean : pageL) {
			Integer userId = ltBean.getUserId();
			UsersBeanNew findUserById = usersService.findUserById(userId);
			usersNickName.add(findUserById);
			

		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ltbean", pageL);
		map.put("user", user);
		m.addAttribute("usersNickName", usersNickName);
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

	@PostMapping("/pageviews")
	public ModelAndView InsertView(@RequestParam("userId") Integer userId, @RequestParam("ltId") Integer ltId) {

		LTBean ltBean1 = lt.findByLTId(ltId);

		Integer views = ltBean1.getPageViews();
		int num = views + 1;

		ltBean1.setSaveLike(num);
		LikeBean likeBean = new LikeBean();
		likeBean.setLtId(ltId);
		likeBean.setUserId(userId);

		return null;

	}

	@GetMapping("/orderby")
	@ResponseBody
	public Page<LTBean> LTPage1(@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "5") int size,
			Model m, HttpSession session) {
    Pageable pageable = PageRequest.of(page, size, Sort.by("saveLike").descending()); // 按照讚數降序排列
    
    Page<LTBean> pageL = lt.finPage(pageable);
    UsersBeanNew user = (UsersBeanNew) session.getAttribute("usersBean");
    System.out.println(pageL);
    List<UsersBeanNew> usersNickName = new ArrayList<>();
    for (LTBean ltBean : pageL) {
        Integer userId = ltBean.getUserId();
        UsersBeanNew findUserById = usersService.findUserById(userId);
        usersNickName.add(findUserById);
    }
    Map<String, Object> map = new HashMap<String, Object>();
	map.put("ltBean", pageL);
	map.put("user", user);
	m.addAttribute("usersNickName", usersNickName);
	return pageL;
}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
