package com.mmmooonnn.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mmmooonnn.model.CourseRepository;
import com.mmmooonnn.model.CoursesBean;

@Service
@Transactional
public class CoursesService {
    @Autowired
    private CourseRepository courseRepos;

    @Autowired
    private JavaMailSender mailSender; // 添加郵件發送器

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
        return result.orElse(null);
    }

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

    public List<CoursesBean> getAll() {
        return courseRepos.findAll();
    }

    // 添加用於發送純文本郵件的方法
    public void sendPlainText(String to, String subject, String content, String from) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(to);
        message.setSubject(subject);
        message.setText(content);
        message.setFrom(from); // 設置郵件的發件人
        mailSender.send(message);
    }

    public void registerUserToCourse(CoursesBean course, Object user) {
        // Logic to register the user to the course
        // Update the course's enrollment count, check for capacity, etc.
    }

}
