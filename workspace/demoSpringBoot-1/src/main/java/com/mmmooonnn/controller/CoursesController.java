package com.mmmooonnn.controller;

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
	
//    @GetMapping("/GetCourseById")
//    public ModelAndView findCourseById(@RequestParam("courseID") Integer id) {
//    	
//        ModelAndView modelAndView = new ModelAndView("course_get_id.jsp");
//
//    	CoursesBean coursesBean	= cService.findCourseById(id);
//    	modelAndView.addObject("Courses", coursesBean);
//    	
//		return modelAndView;
//	}
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
		  @RequestParam("courseID") int courseID,
		  @RequestParam("courseName") String courseName,
          @RequestParam("description") String description,
          @RequestParam("startDate") String startDate,
          @RequestParam("endDate") String endDate,
          @RequestParam("deadlineDate") String deadlineDate,
          @RequestParam("price") double price,
          @RequestParam("teacherName") String teacherName,
          @RequestParam("teacherContact") String teacherContact,
          @RequestParam("enrollmentCount") int enrollmentCount,
          @RequestParam("maxCapacity") int maxCapacity,
          @RequestParam("courseImage") String courseImage) {
          CoursesBean coursesBean = new CoursesBean(courseID, courseName, description, startDate, endDate, deadlineDate, price, teacherName, teacherContact, enrollmentCount, maxCapacity, courseImage);
		cService.insert(coursesBean);
		return "redirect:GetAllCourses";
	}
	


	@GetMapping("/index")
	public String showBackCoursePage() {
    return "back.jsp";
	}
}

    // 更新課程資訊
//    @PostMapping("/Update")
//    public String update(@RequestParam("courseID") int courseID,
//            @RequestParam("courseName") String courseName,
//            @RequestParam("description") String description,
//            @RequestParam("startDate") String startDate,
//            @RequestParam("endDate") String endDate,
//            @RequestParam("deadlineDate") String deadlineDate,
//            @RequestParam("price") double price,
//            @RequestParam("teacherName") String teacherName,
//            @RequestParam("teacherContact") String teacherContact,
//            @RequestParam("enrollmentCount") int enrollmentCount,
//            @RequestParam("maxCapacity") int maxCapacity,
//            @RequestParam("courseImage") String courseImage) {
//      
//    	try {
//            CoursesBean coursesBean = new CoursesBean(courseID, courseName, description, startDate, endDate, deadlineDate, price, teacherName, teacherContact, enrollmentCount, maxCapacity, courseImage);
//            cService.update(coursesBean); // 執行更新
//        } catch (Exception e) {
//            e.printStackTrace();
//            return "course_update.jsp";
//        }
//        return "redirect:/GetAllCourses";
//    }
//    

//    // 添加新課程
//    @PostMapping("/Insert")
//    public ModelAndView insertCourse(@RequestParam("courseName") String courseName,
//            @RequestParam("description") String description,
//            @RequestParam("startDate") String startDate,
//            @RequestParam("endDate") String endDate,
//            @RequestParam("deadlineDate") String deadlineDate,
//            @RequestParam("price") double price,
//            @RequestParam("teacherName") String teacherName,
//            @RequestParam("teacherContact") String teacherContact,
//            @RequestParam("enrollmentCount") int enrollmentCount,
//            @RequestParam("maxCapacity") int maxCapacity,
//            @RequestParam("courseImage") String courseImage) {
//ModelAndView mv = new ModelAndView("/jsp/course_insert.jsp");
//try {
//CoursesBean course = new CoursesBean();
//course.setCourseName(courseName);
//course.setDescription(description);
//course.setStartDate(startDate);
//course.setEndDate(endDate);
//course.setDeadlineDate(deadlineDate);
//course.setPrice(price);
//course.setTeacherName(teacherName);
//course.setTeacherContact(teacherContact);
//course.setEnrollmentCount(enrollmentCount);
//course.setMaxCapacity(maxCapacity);
//course.setCourseImage(courseImage);
//cService.update(course); // 執行更新
//
//} catch (Exception e) {
//e.printStackTrace();
//mv.addObject("errorMessage", "新增課程時發生錯誤：" + e.getMessage());
//}
//        return new ModelAndView("redirect:/GetAllCourses");
//    }
//}