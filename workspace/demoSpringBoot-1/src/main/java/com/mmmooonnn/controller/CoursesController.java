package com.mmmooonnn.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.mmmooonnn.model.CoursesBean;
import com.mmmooonnn.service.CoursesService;

@Controller
public class CoursesController {
	@Autowired
	private CoursesService cService;
	
	@GetMapping("/GetAllCourses")
	public ModelAndView processActionGetAllCourses() {
		ModelAndView modelAndView = new ModelAndView();
		List<CoursesBean> Courses = cService.getAll();
		modelAndView.addObject("Courses", Courses);
		modelAndView.setViewName("forward:/WEB-INF/jsp/courses_getall.jsp");
		return modelAndView;
	}
	

    @GetMapping("/GetCourseById/{id}")
	public String findCourseById(@PathVariable("id") int id ,Model m){
    	
    	CoursesBean coursesBean = cService.findCourseById(id);
		m.addAttribute("course",coursesBean);
		return "forward:/WEB-INF/jsp/course_updata.jsp";
	}
    
	//修改
	@PostMapping("/upd")
	public String upd(@ModelAttribute("CoursesBean")CoursesBean coursesBean) {
		cService.update(coursesBean);
//		return "redirect:/WEB-INF/jsp/courses_getall.jsp";		
		//導向網址redirect: 字符串時，Spring MVC 會生成一個 HTTP 重定向響應（HTTP 狀態碼 302），並將用戶的瀏覽器導向到指定的路徑
		return "redirect:GetAllCourses";		
	}
    
	@DeleteMapping("/DeleteById")
	public ModelAndView processActionDeleteCourse(@RequestParam("courseID") Integer id) {
		ModelAndView modelAndView = new ModelAndView();
		
		cService.deleteById(id);
		
		List<CoursesBean> Courses = cService.getAll();
		
		modelAndView.addObject("Courses", Courses);
		
		modelAndView.setViewName("forward:/WEB-INF/jsp/course_delete.jsp");
		return modelAndView;
	}
	
	
	//新增 
	
    @GetMapping("/course-insert")
    public String showInsertCoursePage() {
        return "forward:WEB-INF/jsp/course_insert.jsp";
    }

	@PostMapping("/insert")
	public String Insert(
			 @RequestParam("idUser") int idUser,
			 @RequestParam("productId") int productId,
		      @RequestParam("courseName") String courseName,
		      @RequestParam("description") String description,
		      @RequestParam("courseType") String courseType,
		      @RequestParam("startDate") Date startDate,
		      @RequestParam("endDate") Date endDate,
		      @RequestParam("deadlineDate") Date deadlineDate,
		      @RequestParam("location") String location,
		      @RequestParam("price") double price,
		      @RequestParam("teacherName") String teacherName,
		      @RequestParam("teacherContact") String teacherContact,
		      @RequestParam("enrollmentCount") int enrollmentCount,
		      @RequestParam("maxCapacity") int maxCapacity,
		      @RequestParam("courseImage") String courseImage) {
	    CoursesBean coursesBean = new CoursesBean(idUser, productId, courseName, description, courseType, startDate, endDate, deadlineDate, location, price, teacherName, teacherContact, enrollmentCount, maxCapacity, courseImage);
		cService.insert(coursesBean);
		return "redirect:GetAllCourses";
	}
	


	@GetMapping("/index")
	public String showBackCoursePage() {
    return "back.jsp";
	}
}
