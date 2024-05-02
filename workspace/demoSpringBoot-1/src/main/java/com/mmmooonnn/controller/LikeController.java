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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mmmooonnn.model.LTBean;
import com.mmmooonnn.model.LikeBean;
import com.mmmooonnn.service.LikeService;

@Controller
public class LikeController {
@Autowired
 private LikeService lr;


@GetMapping("/LikeSelectById.controller")
public String findByLikeId(@RequestParam("likeId") Integer likeId, Model mm) {
	LikeBean resultBean = lr.findByLikeId(likeId);
	mm.addAttribute("likeBean", resultBean);
	
	return null;

}
@GetMapping("/LikeSelectAll")
public String LikeSelectAll(Model m) {
	List<LikeBean> LikeList =lr.findLike();
	m.addAttribute("likeBeans", LikeList);

	return null;

}
@PostMapping("/Likeinsert.controller")
@ResponseBody
public ModelAndView InsertLike(@RequestParam("userId") Integer userId,
		@RequestParam("ltId") Integer ltId) {
	ModelAndView mv = new ModelAndView();

	
		LikeBean likeBean = new LikeBean();
		likeBean.setLtId(ltId);
		likeBean.setUserId(userId);

		lr.insertLike(likeBean);
	
		return null;

}
@DeleteMapping("/LTDeleteByLikeId.controller")
public String deleteBYLikeId(@RequestParam("likeId") Integer likeId) {

	lr.deleteByLikeId(likeId);
	return null;
	
}
@PutMapping("/LikeUpdate.controller")
public String update(@RequestParam("userId") Integer userId,
		@RequestParam("ltId") Integer ltId) {

	LikeBean likeBean = new LikeBean(userId,ltId);
    lr.update(likeBean);
	return null;

}
























}
