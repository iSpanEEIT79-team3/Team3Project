package com.mmmooonnn.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mmmooonnn.model.CoursesBean;
import com.mmmooonnn.model.UsersBeanNew;
import com.mmmooonnn.service.CoursesService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class CoursesControllerFront {
	@Autowired
	private CoursesService cService;
	
    @Autowired
    private JavaMailSender mailSender; // 添加郵件發送器
	
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
    
    
 // 發送課程註冊郵件的方法
    public void sendCourseRegistrationEmail(String to, String subject, String content) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(to);
        message.setSubject(subject);
        message.setText(content);
        mailSender.send(message);
    }

    
    // 控制器方法來處理發送郵件的請求
    @PostMapping("/sendCourseEmail")
	@ResponseBody
	public ResponseEntity<?> sendCourseEmail(
    		@RequestParam("START_DATE") String startDate ,   
    		@RequestParam("COURSE_NAME") String courseName,HttpSession session) 
         {
		UsersBeanNew user = (UsersBeanNew)session.getAttribute("usersBean");
		String userEmail=user.getUserContact().getEmail();
		
		  System.out.println("6666666666" + courseName);

	  
            String receivers = userEmail;
            String subject ="課程收藏成功";
            String content = "親愛的先生/小姐，您好！您已收藏課程，課程時間為：" + startDate +"課程名稱為：\""+ courseName + "\"\n期待您的蒞臨！";
            String From = "JFSwing搖擺舞教室<mhou6vm0@gmail.com>";
            
            System.out.println(content);
            cService.sendPlainText(receivers, subject, content,From);
            return ResponseEntity.ok().body("good");
        }

    
    //立即報名
    @PostMapping("/registerCourse")
    public String registerCourse(@RequestParam("productId") Integer productId, HttpServletRequest request) {
        CoursesBean course = cService.findCourseById(productId);
        HttpSession session = request.getSession();
        // Assume there's a method to register the user to the course
        cService.registerUserToCourse(course, session.getAttribute("user"));

        return "registerUserToCourse"; // Redirect to a success page
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
