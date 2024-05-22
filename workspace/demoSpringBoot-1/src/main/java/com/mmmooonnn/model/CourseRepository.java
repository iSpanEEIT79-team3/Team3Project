package com.mmmooonnn.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface CourseRepository extends JpaRepository<CoursesBean, Integer> {
	
    List<CoursesBean> findAll(); // 這個方法已經確保只返回課程資料

    @Query("SELECT c FROM CoursesBean c ORDER BY (c.maxCapacity - c.enrollmentCount) ASC")
    List<CoursesBean> findTopCloseToFullCourses();

    List<CoursesBean> findByCourseNameContainingOrDescriptionContaining(String courseName, String description);

    List<CoursesBean> findByTeacherName(String teacherName);

}