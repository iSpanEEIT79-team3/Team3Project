package com.mmmooonnn.service;

import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mmmooonnn.model.CourseRepository;
import com.mmmooonnn.model.CoursesBean;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

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

    public List<CoursesBean> getAll() {
        return courseRepos.findAll();
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

    public void saveJson() {
        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        List<CoursesBean> courses = courseRepos.findAll();

        String json = gson.toJson(courses);

        String folderPath = "C:/Users/User/Downloads";
        String fileName = "CoursesData.json";

        try {
            Path path = Paths.get(folderPath);
            if (!Files.exists(path)) {
                Files.createDirectories(path);
            }

            String filePath = folderPath + "/" + fileName;

            try (FileWriter writer = new FileWriter(filePath)) {
                writer.write(json);
                System.out.println("JSON data successfully written to file: " + filePath);
            } catch (IOException e) {
                System.err.println("Failed to write JSON data to file: " + filePath);
                e.printStackTrace();
            }
        } catch (IOException e) {
            System.err.println("Failed to create target folder: " + folderPath);
            e.printStackTrace();
        }
    }
    
    
    public void saveXml() {
        XStream xstream = new XStream(new DomDriver());
        List<CoursesBean> courses = courseRepos.findAll();

        xstream.alias("course", CoursesBean.class);
        
        String xml = xstream.toXML(courses);

        String folderPath = "C:/Users/User/Downloads";
        String fileName = "課程資料.xml";

        try {
            Path path = Paths.get(folderPath);
            if (!Files.exists(path)) {
                Files.createDirectories(path);
            }

            String filePath = folderPath + "/" + fileName;

            try (FileWriter writer = new FileWriter(filePath)) {
                writer.write(xml);
                System.out.println("XML data successfully written to file: " + filePath);
            } catch (IOException e) {
                System.err.println("Failed to write XML data to file: " + filePath);
                e.printStackTrace();
            }
        } catch (IOException e) {
            System.err.println("Failed to create target folder: " + folderPath);
            e.printStackTrace();
        }
    }

    public void saveExcel() {
        List<CoursesBean> courses = courseRepos.findAll();

        String folderPath = "C:/Users/User/Downloads";
        String fileName = "CoursesData.xlsx";

        try {
            Path path = Paths.get(folderPath);
            if (!Files.exists(path)) {
                Files.createDirectories(path);
            }

            String filePath = folderPath + "/" + fileName;

            Workbook workbook = new XSSFWorkbook();
            Sheet sheet = workbook.createSheet("Courses Data");

            Row headerRow = sheet.createRow(0);
            headerRow.createCell(0).setCellValue("產品ID");
            headerRow.createCell(1).setCellValue("用戶ID");
            headerRow.createCell(2).setCellValue("課程名稱");
            headerRow.createCell(3).setCellValue("描述");
            headerRow.createCell(4).setCellValue("課程類型");
            headerRow.createCell(5).setCellValue("開始日期");
            headerRow.createCell(6).setCellValue("結束日期");
            headerRow.createCell(7).setCellValue("截止日期");
            headerRow.createCell(8).setCellValue("地點");
            headerRow.createCell(9).setCellValue("價格");
            headerRow.createCell(10).setCellValue("教師名稱");
            headerRow.createCell(11).setCellValue("教師聯繫方式");
            headerRow.createCell(12).setCellValue("報名人數");
            headerRow.createCell(13).setCellValue("最大容量");
            headerRow.createCell(14).setCellValue("課程圖片");

            int rowNum = 1;
            for (CoursesBean course : courses) {
                Row row = sheet.createRow(rowNum++);
                row.createCell(0).setCellValue(course.getProductId());
                row.createCell(1).setCellValue(course.getIdUser());
                row.createCell(2).setCellValue(course.getCourseName());
                row.createCell(3).setCellValue(course.getDescription());
                row.createCell(4).setCellValue(course.getCourseType());
                row.createCell(5).setCellValue(course.getStartDate().toString());
                row.createCell(6).setCellValue(course.getEndDate().toString());
                row.createCell(7).setCellValue(course.getDeadlineDate().toString());
                row.createCell(8).setCellValue(course.getLocation());
                row.createCell(9).setCellValue(course.getPrice());
                row.createCell(10).setCellValue(course.getTeacherName());
                row.createCell(11).setCellValue(course.getTeacherContact());
                row.createCell(12).setCellValue(course.getEnrollmentCount());
                row.createCell(13).setCellValue(course.getMaxCapacity());
                row.createCell(14).setCellValue(course.getCourseImage());
            }

            try (FileOutputStream outputStream = new FileOutputStream(filePath)) {
                workbook.write(outputStream);
                System.out.println("Excel file successfully saved: " + filePath);
            } catch (IOException e) {
                System.err.println("Failed to write Excel file: " + filePath);
                e.printStackTrace();
            }
        } catch (IOException e) {
            System.err.println("Failed to create target folder: " + folderPath);
            e.printStackTrace();
        }
    }
}
