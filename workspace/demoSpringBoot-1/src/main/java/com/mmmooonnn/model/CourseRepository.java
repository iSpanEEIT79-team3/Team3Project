package com.mmmooonnn.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CourseRepository extends JpaRepository<CoursesBean, Integer> {
	
    List<CoursesBean> findAll(); // 這個方法已經確保只返回課程資料

	
	
	
}