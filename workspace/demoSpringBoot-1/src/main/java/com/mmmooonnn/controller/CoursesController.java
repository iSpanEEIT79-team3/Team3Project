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
	
	//html getall所有

	@RestController
	@RequestMapping("/api")
	public class CourseApiController {
	    @Autowired
	    private CoursesService cService;

	    // 获取所有课程的API
	    @GetMapping("/courses")
	    public ResponseEntity<List<CoursesBean>> getAllCourses() {
	        List<CoursesBean> courses = cService.getAll();
	        return ResponseEntity.ok(courses);  // 返回JSON格式的课程列表
	    }
	}
	
	//Thymeleaf html getall所有
	@GetMapping("/findAllCourses")
	public ModelAndView findAllCourses() {
	    ModelAndView mav = new ModelAndView("courses_getall"); // 修改視圖名稱為 "courses_getall"
	    try {
	        List<CoursesBean> courses = cService.getAll();
	        mav.addObject("Courses", courses); // 將課程列表添加到 ModelAndView 中
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return mav;
	}

	//getid後修改
    @GetMapping("/GetCourseById/{id}")
	public String findCourseById(@PathVariable("id") int id ,Model m){
    	
    	CoursesBean coursesBean = cService.findCourseById(id);
		m.addAttribute("course",coursesBean);
		return "forward:/WEB-INF/jsp/course_updata.jsp";
	}
    
    //getid後得到詳細資料
    @GetMapping("/courseDetails/{id}")
    public String getCourseDetails(@PathVariable("id") int id, Model model) {
    	CoursesBean course = cService.findCourseById(id);
    	if (course != null) {
    		model.addAttribute("course", course);
    		return "forward:/WEB-INF/jsp/courses_details.jsp";  // Ensure this matches the name of your JSP file
    	}
    	return "redirect:/error";  // Redirect to an error page if no course is found
    }
    
    // 根据课程ID获取课程详细信息
    @GetMapping("/courses/detail/{id}")
    public ModelAndView getCourseDetails(@PathVariable("id") int id) {
        ModelAndView modelAndView = new ModelAndView();
        CoursesBean course = cService.findCourseById(id);
        if (course != null) {
            modelAndView.addObject("course", course);
            modelAndView.setViewName("html/CoursesDetail.html");
        } else {
            modelAndView.setViewName("redirect:/error");  // Redirect to an error page if no course is found
        }
        return modelAndView;
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
        //@RequestParam("productId") int productId,
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
        @RequestParam("courseImage") MultipartFile courseImage) {

        CoursesBean coursesBean = new CoursesBean();


        // 处理文件上传
        if (courseImage != null && !courseImage.isEmpty()) {
            try {
                String imagesDir = "C:\\Team3\\workspace\\demoSpringBoot-1\\src\\main\\resources\\static\\images";
                String filename = System.currentTimeMillis() + "_" + courseImage.getOriginalFilename();
                File imagePath = new File(imagesDir, filename);
                courseImage.transferTo(imagePath);
                coursesBean.setCourseImage("/images/" + filename); // 设置文件名到课程对象
            } catch (IOException e) {
                e.printStackTrace();
                return "redirect:/error"; // 重定向到错误页面
            }
        }
        // 设置其他属性
        coursesBean.setIdUser(idUser);
        //coursesBean.setProductId(productId);
        coursesBean.setCourseName(courseName);
        coursesBean.setDescription(description);
        coursesBean.setCourseType(courseType);
        coursesBean.setStartDate(startDate);
        coursesBean.setEndDate(endDate);
        coursesBean.setDeadlineDate(deadlineDate);
        coursesBean.setLocation(location);
        coursesBean.setPrice(price);
        coursesBean.setTeacherName(teacherName);
        coursesBean.setTeacherContact(teacherContact);
        coursesBean.setEnrollmentCount(enrollmentCount);
        coursesBean.setMaxCapacity(maxCapacity);


       System.out.println(coursesBean);
        // 插入课程信息到数据库
        cService.insert(coursesBean);

        return "redirect:GetAllCourses";
    }

	


	@GetMapping("/index")
	public String showBackCoursePage() {
    return "back.jsp";
	}
}
