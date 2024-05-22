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
	
    //得到所有資訊
	@GetMapping("/GetAllCoursesFront")
	public ModelAndView processActionGetAllCourses() {
		ModelAndView modelAndView = new ModelAndView();
		List<CoursesBean> Courses = cService.getAll();
		modelAndView.addObject("Courses", Courses);
		modelAndView.setViewName("forward:/WEB-INF/jsp/front/course/courses_getall_Front.jsp");
		return modelAndView;
	}
	
	
	@GetMapping("/GetTeacherCoursesFront")
	@ResponseBody
	public List<CoursesBean> processActionGetTeacherCourses() {
	    List<CoursesBean> teacherCourses = cService.getTeacherCourses();
	    return teacherCourses; // 直接返回数据，Spring会使用Jackson转换成JSON
	}

	//判斷熱門課程
    @GetMapping("/getTop3CoursesNearFullCapacity")
    @ResponseBody
    public ResponseEntity<List<CoursesBean>> getTop3CoursesNearFullCapacity() {
        List<CoursesBean> courses = cService.getTop3CoursesNearFullCapacity();
        return ResponseEntity.ok(courses);
    }

	//報名後增加人數
    
//	@GetMapping("/GetTeacherCoursesFront")
//	public ModelAndView processActionGetTeacherCourses() {
//	    ModelAndView modelAndView = new ModelAndView();
//	    List<CoursesBean> teacherCourses = cService.getTeacherCourses();
//	    modelAndView.addObject("teacherCourses", teacherCourses);
//	    modelAndView.setViewName("courses_back_index.html");
//	    return modelAndView;
//	}

    //getid後得到詳細資料
    @GetMapping("/courseDetailsFront/{id}")
    public String getCourseDetailsFront(@PathVariable("id") int id, Model model) {
    	CoursesBean course = cService.findCourseById(id);
    	if (course != null) {
    		model.addAttribute("course", course);
    		return "forward:/WEB-INF/jsp/front/course/courses_details_Front.jsp";  // Ensure this matches the name of your JSP file
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

    @PostMapping("/registerCourse")
    @ResponseBody
    public ResponseEntity<String> registerCourse(@RequestParam("productId") Integer productId, HttpSession session) {
        CoursesBean course = cService.findCourseById(productId);
        UsersBeanNew user = (UsersBeanNew) session.getAttribute("usersBean");
        if (course != null && user != null) {
            try {
                cService.registerUserToCourse(course);
                return ResponseEntity.ok("Registration successful");
            } catch (IllegalStateException e) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
            }
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Course not found or User not logged in");
        }
    }

    @GetMapping("/search")
    public List<CoursesBean> searchCourses(@RequestParam("keyword") String keyword) {
        return cService.searchCourses(keyword);
    }
    
    
    
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
    //老師名字
    @GetMapping("/getTeacherCoursesFront")
    public ModelAndView getTeacherCourses(@RequestParam("teacherName") String teacherName) {
        List<CoursesBean> teacherCourses = cService.findByTeacherName(teacherName);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("teacherCourses", teacherCourses);
        modelAndView.setViewName("forward:/WEB-INF/jsp/front/course/courses_teacher_Front.jsp");
        return modelAndView;
    }
    
    
}
