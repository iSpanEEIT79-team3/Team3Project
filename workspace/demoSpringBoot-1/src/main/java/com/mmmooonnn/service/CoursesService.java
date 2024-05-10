package com.mmmooonnn.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mmmooonnn.model.CourseRepository;
import com.mmmooonnn.model.CoursesBean;



@Service
@Transactional
public class CoursesService {
	@Autowired
	private CourseRepository courseRepos;
	
	public void insert(CoursesBean course) {
		courseRepos.save(course);
	}
	
	public void update(CoursesBean course) {
		courseRepos.save(course);
	}
	
	public void deleteById(Integer id) {
		courseRepos.deleteById(id);
	}
	
	public CoursesBean findCourseById(Integer id) {
		Optional<CoursesBean> result = courseRepos.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		return null;
	}

    // Define missing methods

    public List<CoursesBean> getTeacherCourses() {
        // Implement this method to retrieve courses for a teacher
        // You can query the repository based on teacher criteria
        // For example:
        // return courseRepos.findByTeacher(teacher);
        return null; // Placeholder, replace with actual implementation
    }

    public List<CoursesBean> getAllCourseDetails() {
        // Implement this method to retrieve all course details
        // This can be achieved by calling the existing method getAll()
        return getAll(); // Return all courses as course details
    }
	
	
	public List<CoursesBean> getAll(){
		return courseRepos.findAll();
	}

}