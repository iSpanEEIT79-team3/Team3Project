package com.mmmooonnn.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mmmooonnn.model.CoursesBean;
import com.mmmooonnn.service.CoursesService;

@Controller
public class CoursesControllerFront {
	@Autowired
	private CoursesService cService;
	
	@GetMapping("/GetAllCoursesFront")
	public ModelAndView processActionGetAllCourses() {
		ModelAndView modelAndView = new ModelAndView();
		List<CoursesBean> Courses = cService.getAll();
		modelAndView.addObject("Courses", Courses);
		modelAndView.setViewName("forward:/WEB-INF/jsp/courses_getall_Front.jsp");
		return modelAndView;
	}
	
	@GetMapping("/GetTeacherCoursesFront")
	@ResponseBody
	public List<CoursesBean> processActionGetTeacherCourses() {
	    List<CoursesBean> teacherCourses = cService.getTeacherCourses();
	    return teacherCourses; // 直接返回数据，Spring会使用Jackson转换成JSON
	}

	
//	
//	@GetMapping("/GetTeacherCoursesFront")
//	public ModelAndView processActionGetTeacherCourses() {
//	    ModelAndView modelAndView = new ModelAndView();
//	    List<CoursesBean> teacherCourses = cService.getTeacherCourses();
//	    modelAndView.addObject("teacherCourses", teacherCourses);
//	    modelAndView.setViewName("Courses_index.html");
//	    return modelAndView;
//	}

    //getid後得到詳細資料
    @GetMapping("/courseDetailsFront/{id}")
    public String getCourseDetailsFront(@PathVariable("id") int id, Model model) {
    	CoursesBean course = cService.findCourseById(id);
    	if (course != null) {
    		model.addAttribute("course", course);
    		return "forward:/WEB-INF/jsp/courses_details.jsp";  // Ensure this matches the name of your JSP file
    	}
    	return "redirect:/error";  // Redirect to an error page if no course is found
    }
    
    
//    @GetMapping("/courses")
//    public ResponseEntity<List<CoursesBean>> getAllCourses() {
//        List<CoursesBean> courses = cService.getAll();
//        return ResponseEntity.ok(courses);
//    }
//    
//    @GetMapping("/courses/{id}")
//    public ResponseEntity<CoursesBean> getCourseById(@PathVariable int id) {
//        CoursesBean course = cService.findCourseById(id);
//        if (course != null) {
//            return ResponseEntity.ok(course);
//        }
//        return ResponseEntity.notFound().build();
//    }
//    
//    
    
    
	@GetMapping("/GetAllCourseDetailsFront")
	public ModelAndView processActionGetAllCourseDetails() {
	    ModelAndView modelAndView = new ModelAndView();
	    List<CoursesBean> courseDetails = cService.getAllCourseDetails();
	    modelAndView.addObject("courseDetails", courseDetails);
	    modelAndView.setViewName("Courses_index.html");
	    return modelAndView;
	}

	
	
    //getid後得到詳細資料
    @GetMapping("/courseFrontDetails/{id}")
    public String getCourseDetails(@PathVariable("id") int id, Model model) {
    	CoursesBean course = cService.findCourseById(id);
    	if (course != null) {
    		model.addAttribute("course", course);
    		return "CoursesDetail.html";  // Ensure this matches the name of your JSP file
    	}
    	return "redirect:/error";  // Redirect to an error page if no course is found
    }
    

    
    
}
