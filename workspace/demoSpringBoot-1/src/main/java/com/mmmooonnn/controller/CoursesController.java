package com.mmmooonnn.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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
		modelAndView.setViewName("forward:/WEB-INF/jsp/back/course/courses_index_back.jsp");
		return modelAndView;
	}
	


    
    //getid後得到詳細資料
    @GetMapping("/courseDetails/{id}")
    public String getCourseDetails(@PathVariable("id") int id, Model model) {
        CoursesBean course = cService.findCourseById(id);
        if (course != null) {
            model.addAttribute("course", course);
            return "forward:/WEB-INF/jsp/back/course/course_get_id_back.jsp";  // Ensure this matches the name of your JSP file
        }
        return "redirect:/error";  // Redirect to an error page if no course is found
    }
    
    
	//getid後修改

    @GetMapping("/GetCourseById/{id}")
	public String findCourseById(@PathVariable("id") int id ,Model m){
    	
    	CoursesBean coursesBean = cService.findCourseById(id);
		m.addAttribute("course",coursesBean);
		return "forward:/WEB-INF/jsp/back/course/course_updata_back.jsp";
	}
    
	//修改
    @PostMapping("/upd")
    public String updateCourse(@RequestParam("productId") int productId,
                               @RequestParam("idUser") int idUser,
                               @RequestParam("courseName") String courseName,
                               @RequestParam("description") String description,
                               @RequestParam("courseType") String courseType,
                               @RequestParam("startDate") String startDate,
                               @RequestParam("endDate") String endDate,
                               @RequestParam("deadlineDate") String deadlineDate,
                               @RequestParam("location") String location,
                               @RequestParam("price") double price,
                               @RequestParam("teacherName") String teacherName,
                               @RequestParam("teacherContact") String teacherContact,
                               @RequestParam("enrollmentCount") int enrollmentCount,
                               @RequestParam("maxCapacity") int maxCapacity,
                               @RequestParam("courseImage") MultipartFile courseImage) {

        CoursesBean coursesBean = new CoursesBean();
        coursesBean.setProductId(productId);
        coursesBean.setIdUser(idUser);
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

        // 插入课程信息到数据库
        cService.update(coursesBean);

        return "redirect:/GetAllCourses";
    }
    

    
	@DeleteMapping("/DeleteById")
	public ModelAndView processActionDeleteCourse(@RequestParam("courseID") Integer id) {
		ModelAndView modelAndView = new ModelAndView();
		
		cService.deleteById(id);
		
		List<CoursesBean> Courses = cService.getAll();
		
		modelAndView.addObject("Courses", Courses);
		
		modelAndView.setViewName("forward:/WEB-INF/jsp/back/course/course_delete_back.jsp");
		return modelAndView;
	}
	

	
	
	//新增 
	
    @GetMapping("/course-insert")
    public String showInsertCoursePage() {
        return "forward:WEB-INF/jsp/back/course/course_insert_back.jsp";
    }

    @PostMapping("/insert")
    public String Insert(
        @RequestParam("idUser") int idUser,
        //@RequestParam("productId") int productId,
        @RequestParam("courseName") String courseName,
        @RequestParam("description") String description,
        @RequestParam("courseType") String courseType,
        @RequestParam("startDate") String startDate,
        @RequestParam("endDate") String endDate,
        @RequestParam("deadlineDate") String deadlineDate,
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
	
    @PostMapping("/export/json")
    public ResponseEntity<String> exportJson() {
        try {
            cService.saveJson();
            return ResponseEntity.ok("JSON data successfully written");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Failed to save JSON data: " + e.getMessage());
        }
    }
	
	
	
    @PostMapping("/export/xml")
    public ResponseEntity<String> exportXml() {
        try {
            cService.saveXml();
            return ResponseEntity.ok("XML data successfully written");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Failed to save XML data: " + e.getMessage());
        }
    }

    @PostMapping("/export/excel")
    public ResponseEntity<String> exportExcel() {
        try {
            cService.saveExcel();
            return ResponseEntity.ok("Excel data successfully written");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Failed to save Excel data: " + e.getMessage());
        }
    }
    
    
	
}
