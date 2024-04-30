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



@Controller

// @MultipartConfig(location =
// "C:/Spring/workspace/SpringMVC/src/main/webapp/images")
public class LTController {

	@Autowired
	private LTService lt;

	
	@GetMapping("/LTSelectById1.controller")
	public String findByLTId(@RequestParam("ltId") Integer ltId, Model mm) {
		LTBean resultBean = lt.findByLTId(ltId);
		System.out.println(resultBean);
		mm.addAttribute("ltBean", resultBean);
		
		return "forward:/WEB-INF/jsp/LTSelect.jsp";

	}
	
	@GetMapping("/LTSelectById.controller/{ltId}")
	public String findByLTIdup(@PathVariable  Integer ltId, Model m) {
		LTBean resultBean = lt.findByLTId(ltId);
		System.out.println(resultBean);
		m.addAttribute("ltBean", resultBean);
		
		return "forward:/WEB-INF/jsp/LTUpdate.jsp";

	}

	@GetMapping("/LTSelectAll")
	public String LTSelectAll(Model m) {
		List<LTBean> LTList = lt.findLT();
		m.addAttribute("ltBeans", LTList);

		return "forward:/WEB-INF/jsp/LTSelectAll.jsp";

	}

	@PostMapping("/LTinsert.controller")
	@ResponseBody
	public ModelAndView InsertLT(@RequestParam("title") String title, @RequestParam("userId") String userId,
			@RequestParam("picture") MultipartFile picture, @RequestParam("content") String content,
			@RequestParam("classify") String classify) {
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
			ltBean.setClassify(classify);
			 Date DATE = new Date(System.currentTimeMillis());
//			LocalDateTime localTime = LocalDateTime.now();
//
//			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
//			String formattedTime = localTime.format(formatter);
//
//			LocalDateTime parsedTime = LocalDateTime.parse(formattedTime, formatter);
//			java.sql.Date sqlDate = java.sql.Date.valueOf(parsedTime.toLocalDate());

			ltBean.setDate(DATE);
			lt.insertLT(ltBean);

		} catch (Exception e) {

			e.printStackTrace();
			mv.addObject("errorMessage", "An error occurred: " + e.getMessage());

		}
		mv.setViewName("redirect:LTSelectAll");

		return mv;
	}

	@DeleteMapping("/LTDeleteById.controller")
	public String deleteBYLTId(@RequestParam("ltId") Integer ltId) {
		lt.deleteById(ltId);
		return "redirect:LTSelectAll";
	}

	@PutMapping("/LTUpdate.controller")
	public String update(@RequestParam("ltId") String ltId, @RequestParam("title") String title,
			@RequestParam("userId") String userId,
			@RequestParam("date") String date,
			@RequestParam("picture") String picture, @RequestParam("content") String content,
			@RequestParam("classify") String classify) {

		Integer LTID = Integer.parseInt(ltId);
		Integer USERID = Integer.parseInt(userId);
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS"); 
	    Date parsedDate = null;
	    
	        try {
				parsedDate = dateFormat.parse(date);
			} catch (ParseException e) {
				e.printStackTrace();
			}
	    
		

		LTBean ltBean = new LTBean(LTID, title, USERID, parsedDate, picture, content, classify);
		lt.update(ltBean);
		return "redirect:LTSelectAll";

	}
	
	
	
	@GetMapping("/findtitle")
	public String findByTitle(@RequestParam("title") String title, Model mm) {
	    List<LTBean> ltBeans = lt.findByTitle(title);
	    mm.addAttribute("ltBeans", ltBeans);
	    return "forward:/WEB-INF/jsp/LTTitle.jsp";
	}
}
