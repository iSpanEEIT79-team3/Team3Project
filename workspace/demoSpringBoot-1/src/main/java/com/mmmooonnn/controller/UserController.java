package com.mmmooonnn.controller;

import java.io.File;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.gson.GsonFactory;
import com.mmmooonnn.model.UserContactNew;
import com.mmmooonnn.model.UsersBeanNew;
import com.mmmooonnn.service.UsersService;

import jakarta.servlet.http.HttpSession;



@Controller
public class UserController {
	
	
	
	@Autowired
	private UsersService uService2;
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	//google api
	@PostMapping("/googleLogin1")
	public ModelAndView googleLogin(@RequestParam("credential") String credential,
									HttpSession session) {
		GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(new NetHttpTransport(), new GsonFactory())
				.setAudience(Collections.singletonList("324169347825-ejtqu1ldjjpi666j7dgroniv0r2vg2ok.apps.googleusercontent.com"))
				.build();
		ModelAndView modelAndView = new ModelAndView();
		//驗證 credential 的完整性
		try {
			GoogleIdToken idToken = verifier.verify(credential);
			if(idToken != null) {
				Payload payload = idToken.getPayload();
				
//				String userId = payload.getSubject();
//				System.out.println("User ID=" + userId);
				//判定是否新增會員
				String email = payload.getEmail();
				if(!uService2.isEmailExist(email)) {
					UserContactNew user  = new UserContactNew();
					UsersBeanNew usersBean = new UsersBeanNew();
					
					user.setName((String) payload.get("name"));
					user.setEmail(email);
					usersBean.setPicture((String)payload.get("picture"));
					usersBean.setUserContact(user);
					usersBean.setPermission(0);
					usersBean.setThirdPartyLogin(1);
					modelAndView.setViewName("redirect:/html/OrdersForClient.html");
					uService2.insert(usersBean);
					return modelAndView;
				}else {
					UsersBeanNew usersBean = uService2.findByEmail(email);
					session.setAttribute("usersBean", usersBean);
					modelAndView.setViewName("redirect:/html/OrdersForClient.html");
					return modelAndView;
				}
					
			}else {
				System.out.println("Invalid ID token");
				
				modelAndView.setViewName("redirect:/index.html");
				return modelAndView;
			}
		} catch (GeneralSecurityException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		modelAndView.setViewName("redirect:/index.html");
		return modelAndView;
		
	}
	
	
	//搜尋全部
	@GetMapping("/GetAllUser")
	@ResponseBody
	public List<UsersBeanNew> processActionGetAllUser() {
//		ModelAndView modelAndView = new ModelAndView();
		
		List<UsersBeanNew> users = uService2.getAll();
//		modelAndView.addObject(users);		
		return users;
	}
	
	@GetMapping("/back")
	public String processActionGet() {
		return "/back";
	}
	
	@PostMapping("/userLogin")
	public ResponseEntity<String> processActionGetUser(@RequestParam("email") String email,
													@RequestParam("password") String password,
														HttpSession session){
		System.out.println("進入UserLogin");
		boolean result = uService2.isEmailExist(email);
		System.out.println(result);
		if(result) {
			UsersBeanNew usersBean = uService2.findByEmail(email);
			session.setAttribute("usersBean", usersBean);
			return ResponseEntity.ok().body("登入成功");
		}
		
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("信箱或者密碼錯誤");
	}
	//刪除單筆
	@DeleteMapping("/DeleteUser")
	public ModelAndView processActionDeleteUser(@RequestParam("idUser") Integer id) {
		ModelAndView modelAndView = new ModelAndView();
		
		uService2.deleteById(id);
		
		List<UsersBeanNew> users = uService2.getAll();
		
		modelAndView.addObject("users", users);
		
		modelAndView.setViewName("redirect:/html/allUsers.html");
		return modelAndView;
	}
	
	
	
	
	@PostMapping("/Register")
	public ModelAndView processActionRegister(@RequestParam("name") String name,
									@RequestParam("nickName") String nickName,
									@RequestParam("gender") String gender,
									@RequestParam("email") String email,
									@RequestParam("password") String password,
									@RequestParam("birthday") String birthday,
									@RequestParam("phone") String phone,
									@RequestParam("address") String address,
									@RequestParam("danceCharacter") String danceCharacter,
									@RequestParam("danceAge") String danceAge,
									@RequestParam("picture") MultipartFile picture) {
		
		ModelAndView modelAndView = new ModelAndView();
		DateTimeFormatter date = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
		UserContactNew user  = new UserContactNew();
		UsersBeanNew usersBean = new UsersBeanNew();
		user.setName(name);
		usersBean.setNickName(nickName);
		usersBean.setGender(gender);
		user.setEmail(email);
		usersBean.setPassword(password);
		
		if(birthday != null) {
			String dateUser =birthday;
			LocalDate localDate = LocalDate.parse(dateUser,date);
			usersBean.setBirthday(localDate);			
		}else {
			String dateUser ="1911-01-01";
			LocalDate localDate = LocalDate.parse(dateUser,date);
			usersBean.setBirthday(localDate);
		}
		
		user.setPhone(phone);
		user.setAddress(address);
		usersBean.setDanceCharacter(danceCharacter);
		usersBean.setDanceAge(danceAge);
		
		//圖片
		try {
			if(!picture.isEmpty() ) {
				String fileName = picture.getOriginalFilename();
				
				String fileDir = resourceLoader.getResource("classpath:/static/userPicture").getFile().getAbsolutePath();
				
				File fileDirPath = new File(fileDir);
				if (!fileDirPath.exists()) {
			           fileDirPath.mkdirs();
			    }
				
				//改檔名
				String newFileName = user.getEmail()+ fileName.substring(fileName.lastIndexOf('.'));
				
				File uploadedFile = new File(fileDirPath, newFileName);
			    // 将檔案寫入本機
			    picture.transferTo(uploadedFile); 
			    usersBean.setPicture("/userPicture/"+newFileName);
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		usersBean.setUserContact(user);
		usersBean.setThirdPartyLogin(0);
		usersBean.setPermission(0);
		System.out.println(usersBean);
		if(uService2.isEmailExist(user.getEmail())) {
			System.out.println("比對信箱");
			modelAndView.addObject("emailExists",true);
			modelAndView.setViewName("/confirmRegister");
			return modelAndView;
		}else {
			if(user.getEmail() != "") {
				uService2.insert(usersBean);
				modelAndView.addObject("emailExists",false);
				modelAndView.setViewName("/confirmRegister");
				return modelAndView;
			}else {
				System.out.println("信箱為空");
				modelAndView.addObject("emailExists",true);
				modelAndView.setViewName("/confirmRegister");
				return modelAndView;
			}
		}
	}
	
	@GetMapping("/UpdateUser/{idUser}")
	public ModelAndView processActionUpdate(@PathVariable Integer idUser ) {
		ModelAndView modelAndView = new ModelAndView();
		
		UsersBeanNew user = uService2.findUserById(idUser);
		System.out.println("查詢:"+user);
		
		
		
		modelAndView.addObject("user", user);
		modelAndView.setViewName("/updateUser");
		return modelAndView;
	}
	
	@PutMapping("/Update")
	public ModelAndView processActionUpdateUser(@RequestParam("name") String name,
												@RequestParam("nickName") String nickName,
												@RequestParam("gender") String gender,
												@RequestParam("userEmail") String email,
												@RequestParam("password") String password,
												@RequestParam("birthday") String birthday,
												@RequestParam("phone") String phone,
												@RequestParam("address") String address,
												@RequestParam("danceCharacter") String danceCharacter,
												@RequestParam("danceAge") String danceAge,
												@RequestParam("picture") MultipartFile picture,
												@RequestParam("idUser") Integer id) {
		
		ModelAndView modelAndView = new ModelAndView();
		DateTimeFormatter date = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
		UserContactNew user  = new UserContactNew();
		UsersBeanNew usersBean = new UsersBeanNew();
		usersBean.setUserId(id);
		user.setName(name);
		usersBean.setNickName(nickName);
		usersBean.setGender(gender);
		user.setEmail(email);
		usersBean.setPassword(password);
		
		if(birthday != null) {
			String dateUser =birthday;
			LocalDate localDate = LocalDate.parse(dateUser,date);
			usersBean.setBirthday(localDate);			
		}else {
			String dateUser ="1911-01-01";
			LocalDate localDate = LocalDate.parse(dateUser,date);
			usersBean.setBirthday(localDate);
		}
		
		user.setPhone(phone);
		user.setAddress(address);
		usersBean.setDanceCharacter(danceCharacter);
		usersBean.setDanceAge(danceAge);
		
		//圖片
		try {
			if(!picture.isEmpty()) {
				String fileName = picture.getOriginalFilename();
				
				String fileDir = resourceLoader.getResource("classpath:/static/userPicture").getFile().getAbsolutePath();
				
				File fileDirPath = new File(fileDir);
				if (!fileDirPath.exists()) {
			           fileDirPath.mkdirs();
			    }
				
				//改檔名
				String newFileName = user.getEmail()+ fileName.substring(fileName.lastIndexOf('.'));
				
				File uploadedFile = new File(fileDirPath, newFileName);

			    picture.transferTo(uploadedFile); 
			    usersBean.setPicture("/userPicture/"+newFileName);
			}else {
				UsersBeanNew old = uService2.findUserById(usersBean.getUserId());
				System.out.println("沒更新圖片");
				usersBean.setPicture(old.getPicture());
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		usersBean.setUserContact(user);
		usersBean.setThirdPartyLogin(0);
			System.out.println(user);
			if(user.getEmail() != "") {
				uService2.insert(usersBean);	
				modelAndView.addObject("emailExists",false);
				modelAndView.setViewName("/confirmUpdate");
				return modelAndView;
			}else {
				System.out.println("信箱為空");
				modelAndView.addObject("emailExists",true);
				modelAndView.setViewName("/confirmUpdate");
				return modelAndView;
			}
		
	}
}
