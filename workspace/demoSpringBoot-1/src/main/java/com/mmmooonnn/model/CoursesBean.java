package com.mmmooonnn.model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;


@Entity
@Component
@Table(name = "COURSES")
public class CoursesBean implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "PRODUST_ID") // IDENTITY column assumed to be the primary key
    private int productId;

    @Column(name = "IDUSER")
    private int idUser;

    @Column(name = "COURSE_NAME")
    private String courseName;

    @Column(name = "DESCRIPTION")
    private String description;

    @Column(name = "COURSE_TYPE")
    private String courseType;

	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "START_DATE")
    private Date startDate;

    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "END_DATE")
    private Date endDate;
    
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "DEADLINE_DATE")
    private Date deadlineDate;

    @Column(name = "LOCATION")
    private String location;

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
    public CoursesBean(int productId, int idUser, String courseName, String description, String courseType, Date startDate,
                       Date endDate, Date deadlineDate, String location, double price, String teacherName, String teacherContact,
                       int enrollmentCount, int maxCapacity, String courseImage) {
        this.productId = productId;
        this.idUser = idUser;
        this.courseName = courseName;
        this.description = description;
        this.courseType = courseType;
        this.startDate = startDate;
        this.endDate = endDate;
        this.deadlineDate = deadlineDate;
        this.location = location;
        this.price = price;
        this.teacherName = teacherName;
        this.teacherContact = teacherContact;
        this.enrollmentCount = enrollmentCount;
        this.maxCapacity = maxCapacity;
        this.courseImage = courseImage;
    }

    // Getters and setters for all fields
    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
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

    public String getCourseType() {
        return courseType;
    }

    public void setCourseType(String courseType) {
        this.courseType = courseType;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Date getDeadlineDate() {
        return deadlineDate;
    }

    public void setDeadlineDate(Date deadlineDate) {
        this.deadlineDate = deadlineDate;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
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
        return "CoursesBean [productId=" + productId + ", idUser=" + idUser + ", courseName=" + courseName
                + ", description=" + description + ", courseType=" + courseType + ", startDate=" + startDate
                + ", endDate=" + endDate + ", deadlineDate=" + deadlineDate + ", location=" + location
                + ", price=" + price + ", teacherName=" + teacherName + ", teacherContact=" + teacherContact
                + ", enrollmentCount=" + enrollmentCount + ", maxCapacity=" + maxCapacity + ", courseImage=" + courseImage + "]";
    }

}
