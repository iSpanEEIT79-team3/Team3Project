package com.mmmooonnn.model;

import java.io.Serializable;



import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Component
@Table(name = "COURSES")
public class CoursesBean implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "COURSE_ID")
	private int courseID;

	@Column(name = "COURSE_NAME")
	private String courseName;

	@Column(name = "DESCRIPTION")
	private String description;

	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	@Column(name = "START_DATE")
	private String startDate;

	@Column(name = "END_DATE")
	private String endDate;

	@Column(name = "DEADLINE_DATE")
	private String deadlineDate;

	@Column(name = "PRICE")
	private double price;

	@Column(name = "TEACHER_NAME")
	private String teacherName;

	@Column(name = "TEACHER_CONTACT")
	private String teacherContact;

	@Column(name = "ENROLLMENT_COUNT")
	private int enrollmentCount;

	@Column(name = "MAX_CAPACITY")
	private int maxCapacity;

	@Column(name = "COURSE_IMAGE")
	private String courseImage;

    // Default constructor
    public CoursesBean() {
    }

    // All-args constructor
    public CoursesBean(int courseID, String courseName, String description, String startDate, String endDate,
            String deadlineDate, double price, String teacherName, String teacherContact,
            int enrollmentCount, int maxCapacity, String courseImage) {
    	
        this.courseID = courseID;
        this.courseName = courseName;
        this.description = description;
        this.startDate = startDate;
        this.endDate = endDate;
        this.deadlineDate = deadlineDate;
        this.price = price;
        this.teacherName = teacherName;
        this.teacherContact = teacherContact;
        this.enrollmentCount = enrollmentCount;
        this.maxCapacity = maxCapacity;
        this.courseImage = courseImage;
    }
	
	public int getCourseID() {
		return courseID;
	}

	public void setCourseID(int courseID) {
		this.courseID = courseID;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getDeadlineDate() {
		return deadlineDate;
	}

	public void setDeadlineDate(String deadlineDate) {
		this.deadlineDate = deadlineDate;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public String getTeacherContact() {
		return teacherContact;
	}

	public void setTeacherContact(String teacherContact) {
		this.teacherContact = teacherContact;
	}

	public int getEnrollmentCount() {
		return enrollmentCount;
	}

	public void setEnrollmentCount(int enrollmentCount) {
		this.enrollmentCount = enrollmentCount;
	}

	public int getMaxCapacity() {
		return maxCapacity;
	}

	public void setMaxCapacity(int maxCapacity) {
		this.maxCapacity = maxCapacity;
	}

	public String getCourseImage() {
		return courseImage;
	}

	public void setCourseImage(String courseImage) {
		this.courseImage = courseImage;
	}

	@Override
	public String toString() {
		return "CoursesBean [courseID=" + courseID + ", courseName=" + courseName + ", description=" + description
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", deadlineDate=" + deadlineDate + ", price="
				+ price + ", teacherName=" + teacherName + ", teacherContact=" + teacherContact + ", enrollmentCount="
				+ enrollmentCount + ", maxCapacity=" + maxCapacity + ", courseImage=" + courseImage + "]";
	}

}
