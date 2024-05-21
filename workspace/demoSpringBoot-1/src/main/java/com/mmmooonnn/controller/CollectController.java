package com.mmmooonnn.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.el.stream.Stream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.util.Streamable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mmmooonnn.model.CollectBean;
import com.mmmooonnn.model.LTBean;
import com.mmmooonnn.model.LTRepository;
import com.mmmooonnn.model.UsersBeanNew;
import com.mmmooonnn.service.CollectService;
import com.mmmooonnn.service.LTService;

import jakarta.servlet.http.HttpSession;

@Controller
public class CollectController {
	@Autowired
	private LTService lt;
	@Autowired
	private CollectService cs;
	@Autowired
	private LTRepository abc;
	
	
	@PostMapping("/Collectgo")
	public String Collect() {
		return "forward:/WEB-INF/jsp/front/lt/CollectFront.jsp";
		
	}
	

	@PostMapping("/collectFront.controller")
	@ResponseBody
	public ModelAndView InsertCollect(@RequestParam("ltId") Integer ltId,HttpSession session) {
		UsersBeanNew user = (UsersBeanNew)session.getAttribute("usersBean");
		Integer userId = user.getUserId();
		LTBean ltBean = lt.findByLTId(ltId);
		
		int collect = 0;
	    if (ltBean != null && ltBean.getCollect() != null) {
	        collect = ltBean.getCollect();
	    }

		int num=collect+1;
		ltBean.setCollect(num);
		CollectBean collectBean = new CollectBean();
		
		collectBean.setLtId(ltId);
		collectBean.setUserId(userId);

		
try {
	cs.insert(collectBean);
	lt.update(ltBean);
} catch (Exception e) {
	Integer collect1 = ltBean.getCollect();
	int num1 = collect1-2;
	ltBean.setCollect(num1);
	lt.update(ltBean);
	cs.deleteByUserIdAndLtId(userId, ltId);
	
}

		
		
		
		
return new ModelAndView("redirect:/LTSelectAllFront");

	}

	// 檢查使用者是否已經收藏了指定文章
	@PostMapping("/checkIfUserHasCollected")
	@ResponseBody
	public Page<LTBean> checkIfUserHasCollected( HttpSession session,@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "5") int size) {
	    UsersBeanNew user = (UsersBeanNew) session.getAttribute("usersBean");
	    Integer userId = user.getUserId();
	    Page<LTBean> pageLT= abc.findCollectPage(null, userId);
	    
	
	    //Page<LTBean> findAllPage2(Pageable pageable,Integer userld);

	return pageLT;
	
	

	    // 檢查是否存在收藏記錄
//	    boolean hasCollected = (collect != null);
	    
	
	    }
	}

	
	

