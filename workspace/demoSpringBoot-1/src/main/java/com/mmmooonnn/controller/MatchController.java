package com.mmmooonnn.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mmmooonnn.model.MatchBean;
import com.mmmooonnn.service.MatchService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MatchController {

	@Autowired
	private MatchService mService;


	@DeleteMapping("/MatchDeleteByid/{id}")
	public ResponseEntity<String> processActionDeleteMatch(@PathVariable Integer id) {
	    ModelAndView modelAndView = new ModelAndView();

	    try {
	        mService.deleteById(id);
	        modelAndView.setViewName("forward:/WEB-INF/jsp/MatchDelete.jsp");
	        return ResponseEntity.ok().body("true");
	        
	    } catch (Exception e) {
	        modelAndView.setViewName("forward:/WEB-INF/jsp/MatchDeleteErr.jsp");
	        e.printStackTrace();
	        return ResponseEntity.ok().body("flase");
	    }
	}
	@GetMapping("/GetAllMatch")
	public ModelAndView processActionGetAllMatch() {
		ModelAndView modelAndView = new ModelAndView();

		List<MatchBean> match = mService.getAll();

		modelAndView.addObject("match", match);
		modelAndView.setViewName("forward:/WEB-INF/jsp/MatchGetAll.jsp");
		return modelAndView;
	}

    @PostMapping("/MatchInsert")
    public ModelAndView processActionMatchInsert(@RequestParam("name") String name,
                                                  @RequestParam("email") String email,
                                                  @RequestParam("password") String password,
                                                  @RequestParam("gender") String gender,
                                                  @RequestParam("birthday") String birthday,
                                                  @RequestParam("location") String location,
                                                  @RequestParam("bio") String bio,
                                                  @RequestParam("profile_picture") MultipartFile profilepicture,
                                                  @RequestParam("age") String age) {
        ModelAndView modelAndView = new ModelAndView();
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        MatchBean match = new MatchBean();
        match.setName(name);
        match.setEmail(email);
        match.setPassword(password);
        match.setGender(gender);

        if (birthday != null && !birthday.isEmpty()) {
            LocalDate localDate = LocalDate.parse(birthday, dateFormatter);
            match.setBirthday(localDate);
        } else {
            LocalDate defaultDate = LocalDate.of(1911, 1, 1);
            match.setBirthday(defaultDate);
        }

        match.setLocation(location);
        match.setBio(bio);

        try {
            if (!profilepicture.isEmpty()) {
                String fileName = profilepicture.getOriginalFilename();
                String fileDir = "D:\\team3\\workspace\\demoSpringBoot-1\\src\\main\\resources\\static\\MatchProfilepicture";

                File fileDirPath = new File(fileDir);
                if (!fileDirPath.exists()) {
                    fileDirPath.mkdirs();
                }

                String newFileName = email + fileName.substring(fileName.lastIndexOf('.'));
                File uploadedFile = new File(fileDirPath, newFileName);

                profilepicture.transferTo(uploadedFile);
                match.setProfilePicture("/MatchProfilepicture/" + newFileName);
            }
        } catch (IllegalStateException | IOException e) {
            e.printStackTrace();
        }

        match.setAge(Integer.parseInt(age));
       mService.intsert(match);
        
        modelAndView.setViewName("forward:/WEB-INF/jsp/MatchInsert.jsp");
        return modelAndView;
    }


	@GetMapping("/GetById")
	public ModelAndView processActionGetById(@RequestParam("id") Integer id) {
		ModelAndView modelAndView = new ModelAndView();

		MatchBean match = mService.findMatchById(id);
		System.out.println(match);
		modelAndView.addObject("match", match);
		modelAndView.setViewName("forward:/WEB-INF/jsp/MatchSerch.jsp");
		return modelAndView;

	}

	@PostMapping("/MatchUpdate")
	public ModelAndView processActionUpdate(@RequestParam("id") Integer id,
	        @RequestParam("name") String name, @RequestParam("email") String email,
	        @RequestParam("password") String password, @RequestParam("gender") String gender,
	        @RequestParam("birthday") String birthday, @RequestParam("location") String location,
	        @RequestParam("bio") String bio, @RequestParam("profile_picture") String profilepicture,
	        @RequestParam("age") String age) {
		
			ModelAndView modelAndView = new ModelAndView();
			DateTimeFormatter date = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//		DateTimeFormatter date = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	   
	    	System.out.println(profilepicture);
	        MatchBean match = new MatchBean();
	        match.setId(id);
	        match.setName(name);
	        match.setEmail(email);
	        match.setPassword(password);
	        match.setGender(gender);
	        if(birthday != null) {
				String dateUser =birthday;
				LocalDate localDate = LocalDate.parse(dateUser,date);
				match.setBirthday(localDate);			
			}else {
				String dateUser ="1911-01-01";
				LocalDate localDate = LocalDate.parse(dateUser,date);
				match.setBirthday(localDate);
			}
	        match.setLocation(location);
	        match.setBio(bio);
//	        if (!profilepicture.isEmpty()) {
//	            String fileName = profilepicture.getOriginalFilename();
//	            String fileDir = "C:\\Users\\User\\Downloads\\demoSpringBoot-1\\demoSpringBoot-1\\src\\main\\resources\\static\\MatchProfilepicture";
//	            File fileDirPath = new File(fileDir);
//	            if (!fileDirPath.exists()) {
//	                fileDirPath.mkdirs();
//	            }
//	            String newFileName = email + fileName.substring(fileName.lastIndexOf('.'));
//	            File uploadedFile = new File(fileDirPath, newFileName);
//	            profilepicture.transferTo(uploadedFile);
//	            match.setProfilePicture("MatchProfilepicture/" + newFileName);
//	        }
	        match.setAge(Integer.parseInt(age));
	        match.setProfilePicture(profilepicture);
	        mService.update(match);
	        modelAndView.setViewName("forward:/WEB-INF/jsp/MatchUpdata.jsp");
	        return modelAndView;
	}

	@GetMapping("/login")
	public String login(@RequestParam("email") String email, @RequestParam("password") String password,
			HttpServletRequest request) {
		if (mService.findUserByEmailPassword(email, password)) {
			System.out.println("正確");

			MatchBean match = mService.findMatchByEmail(email);
			HttpSession session = request.getSession();
			session.setAttribute("Match", match);

			return "forward:/WEB-INF/jsp/loginSuccess.jsp";
		} else {
			System.out.println("信箱或者密碼錯誤");
			return "/jsp/loginFailed.jsp";
		}
	}
	@PutMapping("/UpdateMatch")
	public ModelAndView processActionMatchUpdate(@RequestParam("id") Integer id) {
		
		ModelAndView modelAndView = new ModelAndView();
		MatchBean match = mService.findMatchById(id);
		System.out.println(match);
		
		
		modelAndView.addObject("match", match);
		modelAndView.setViewName("forward:/WEB-INF/jsp/MatchUpdataData.jsp");
		return modelAndView;
	}
}


