package com.mmmooonnn.controller;

import java.io.File;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

import org.apache.commons.codec.digest.DigestUtils;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
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
import com.mmmooonnn.model.UserTokenBean;
import com.mmmooonnn.model.UsersBeanNew;
import com.mmmooonnn.service.MailService;
import com.mmmooonnn.service.UserTokenService;
import com.mmmooonnn.service.UsersService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	@Autowired
	private UsersService uService2;

	@Autowired
	private ResourceLoader resourceLoader;

	@Autowired
	private MailService mailService;

	@Autowired
	private UserTokenService userTokenService;

	@Autowired
	private HttpServletRequest request;

	// 會員登出
	@GetMapping("/loginOutUser")
	public String processActionLogOut(HttpSession session) {
		session.setAttribute("usersBean", null);
		System.out.println("登出");
		return "redirect:/html/frontPage.html";
	}

	// 查詢會員登入狀態
	@GetMapping("/checkUserLogin")
	public ResponseEntity<Map<String, String>> processActionCheckLogin(HttpSession session) {
		Map<String, String> response = new HashMap<String, String>();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		Object result = session.getAttribute("usersBean");
		if (result != null) {
			System.out.println("會員登入中");
			response.put("status", "登入成功");
			response.put("username", ((UsersBeanNew) result).getUserContact().getName());
			response.put("picture", ((UsersBeanNew) result).getPicture());
			response.put("nickname", ((UsersBeanNew) result).getNickName());
			response.put("gender", ((UsersBeanNew) result).getGender());
			response.put("danceCharacter", ((UsersBeanNew) result).getDanceCharacter());
			response.put("danceAge", ((UsersBeanNew) result).getDanceAge());
			response.put("email", ((UsersBeanNew) result).getUserContact().getEmail());
			response.put("phone", ((UsersBeanNew) result).getUserContact().getPhone());
			response.put("address", ((UsersBeanNew) result).getUserContact().getAddress());

			if (((UsersBeanNew) result).getBirthday() != null) {
				LocalDate birthday = ((UsersBeanNew) result).getBirthday();
				String birthdayString = birthday.format(formatter);
				response.put("birthday", birthdayString);
			} else {
				response.put("birthday", "無");
			}

			return ResponseEntity.ok().body(response);
		} else {
			System.out.println("未登入");
			response.put("status", "未登入");
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
		}
	}

	// 忘記密碼
	@PostMapping("/forgetMail")
	public ResponseEntity<String> processActionMail(@RequestParam("email") String email) {

		UsersBeanNew user;
		try {
			user = uService2.findByEmail(email);
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("信箱錯誤");
		}
		try {
			String secretKey = UUID.randomUUID().toString(); // 密鑰
			Timestamp outDate = new Timestamp(System.currentTimeMillis() + (30 * 60 * 1000)); // 30分鐘後過期
			long date = outDate.getTime() / 1000 * 1000; // 忽略毫秒數

			UserTokenBean userToken = new UserTokenBean();
			userToken.setUserid(user.getUserId());
			userToken.setToken(secretKey);
			userToken.setOutTime(outDate);

			try {
				userTokenService.insert(userToken);
			} catch (Exception e) {
				Optional<UserTokenBean> result = userTokenService.findByUserid(user.getUserId());
				System.out.println(result.get());
				UserTokenBean userTokenBean = result.get();
				userTokenBean.setOutTime(outDate);
				userTokenBean.setToken(secretKey);
				userTokenService.insert(userTokenBean);
			}

			String key = user.getUserContact().getName() + "$" + date + "$" + secretKey; // 數字簽名
			String digitalSignature = DigestUtils.md5Hex(key);

			String basePath = request.getRequestURL().toString().replace(request.getRequestURI(),
					request.getContextPath()) + "/";
			String resetPassHref = basePath + "resetpassword?sid=" + digitalSignature + "&userEmail=" + email;
			String emailContent = "請勿回覆此郵件。點擊下面的連結來重設密碼：<br/><a href=" + resetPassHref + " target='_BLANK'>點擊我重設密碼</a>"
					+ "<br/>提示：此郵件的連結將在30分鐘後失效，若需要重新申請找回密碼，請重新操作。";
			System.out.println(resetPassHref);

			mailService.sendHtmlMail("重置密碼", emailContent, "mhou6vm0@gmail.com");

		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("信箱錯誤");
		}

		return ResponseEntity.ok().body("登入成功");

	}

	// 修改密碼畫面
	@GetMapping("/resetpassword")
	public ModelAndView checkResetLink(String sid, String userEmail) {
		ModelAndView model = new ModelAndView("error");
		String msg = "";
		if (sid.equals("") || userEmail.equals("")) {
			msg = "連結不完整，請重新生成";
			model.addObject("msg", msg);
			System.out.println(msg);
			return model;
		}

		UsersBeanNew user = uService2.findByEmail(userEmail);
		System.out.println(user);
		System.out.println(userTokenService.findByUserid(user.getUserId()).get().getOutTime());
		Timestamp outDate = userTokenService.findByUserid(user.getUserId()).get().getOutTime();

		if (outDate.getTime() <= System.currentTimeMillis()) { // 表示過期
			msg = "連結已經過期，請重新申請找回密碼";
			model.addObject("msg", msg);
			System.out.println("連結已經過期，請重新申請找回密碼");
			return model;
		}

		String key = user.getUserContact().getName() + "$" + outDate.getTime() / 1000 * 1000 + "$"
				+ userTokenService.findByUserid(user.getUserId()).get().getToken();
		String digitalSignature = DigestUtils.md5Hex(key);

		if (!digitalSignature.equals(sid)) {
			msg = "連結不正確，是否已經過期? 請重新申請";
			model.addObject("msg", msg);
			System.out.println("連結不正確，是否已經過期? 請重新申請");
			return model;
		}

		model.setViewName("forward:/front/user/ResetPassword.html");
		model.addObject("userEmail", userEmail);
		System.out.println("成功");
		return model;

	}

	// google login
	@PostMapping("/googleLogin1")
	public ModelAndView googleLogin(@RequestParam("credential") String credential, HttpSession session) {
		GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(new NetHttpTransport(), new GsonFactory())
				.setAudience(Collections
						.singletonList("324169347825-ejtqu1ldjjpi666j7dgroniv0r2vg2ok.apps.googleusercontent.com"))
				.build();
		ModelAndView modelAndView = new ModelAndView();
		// 驗證 credential 的完整性
		try {
			GoogleIdToken idToken = verifier.verify(credential);
			if (idToken != null) {
				Payload payload = idToken.getPayload();

//				String userId = payload.getSubject();
//				System.out.println("User ID=" + userId);
				// 判定是否新增會員
				String email = payload.getEmail();
				if (!uService2.isEmailExist(email)) {
					UserContactNew user = new UserContactNew();
					UsersBeanNew usersBean = new UsersBeanNew();

					user.setName((String) payload.get("name"));
					user.setEmail(email);
					usersBean.setPicture((String) payload.get("picture"));
					usersBean.setUserContact(user);
					usersBean.setPermission(0);
					usersBean.setThirdPartyLogin(1);
					modelAndView.setViewName("redirect:/html/frontPage.html");
					uService2.insert(usersBean);
					session.setAttribute("usersBean", usersBean);
					return modelAndView;
				} else {
					UsersBeanNew usersBean = uService2.findByEmail(email);
					session.setAttribute("usersBean", usersBean);
					modelAndView.setViewName("redirect:/html/frontPage.html");
					return modelAndView;
				}

			} else {
				System.out.println("Invalid ID token");

				modelAndView.setViewName("redirect:/html/UserLoginTest.html");
				return modelAndView;
			}
		} catch (GeneralSecurityException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		modelAndView.setViewName("redirect:/html/UserLoginTest.html");
		return modelAndView;
	}

	// 管理者登入
	@PostMapping("/backstage")
	public ResponseEntity<String> backstage(@RequestParam("email") String email,
			@RequestParam("password") String password, HttpSession session) {
		System.out.println("進入backstageLogin");
		boolean result = uService2.isEmailExist(email);
		if (result) {

			UsersBeanNew usersBean = uService2.findByEmail(email);
			boolean flag = BCrypt.checkpw(password, usersBean.getPassword());
			if (flag && usersBean.getPermission() == 1) {
				session.setAttribute("email", email);
				return ResponseEntity.ok().body("登入成功");
			}
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("信箱或者密碼錯誤");

		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("信箱或者密碼錯誤");
	}

	// 搜尋全部
	@GetMapping("/GetAllUser")
	@ResponseBody
	public List<UsersBeanNew> processActionGetAllUser() {
//		ModelAndView modelAndView = new ModelAndView();

		List<UsersBeanNew> users = uService2.getAll();
//		modelAndView.addObject(users);		
		return users;
	}

	// 會員登入
	@PostMapping("/UsersLogin")
	public ResponseEntity<String> usersLogin(@RequestParam("email") String email,
			@RequestParam("password") String password, HttpSession session) {
		System.out.println("進入UserLogin");
		boolean result = uService2.isEmailExist(email);
		System.out.println(result);
		if (result) {

			UsersBeanNew usersBean = uService2.findByEmail(email);
			boolean flag = BCrypt.checkpw(password, usersBean.getPassword());
			if (flag) {
				session.setAttribute("usersBean", usersBean);
				System.out.println("登入成功");
				return ResponseEntity.ok().body("登入成功");

			}
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("信箱或者密碼錯誤");

		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("信箱或者密碼錯誤");
	}

	// 刪除單筆
	@DeleteMapping("/DeleteUser")
	public ModelAndView processActionDeleteUser(@RequestParam("idUser") Integer id) {
		ModelAndView modelAndView = new ModelAndView();

		uService2.deleteById(id);

		List<UsersBeanNew> users = uService2.getAll();

		modelAndView.addObject("users", users);

		modelAndView.setViewName("redirect:/html/allUsers.html");
		return modelAndView;
	}

	// 註冊會員
	@PostMapping("/Register")
	public ModelAndView processActionRegister(@RequestParam("userName") String name,
			@RequestParam("nickName") String nickName, @RequestParam("gender") String gender,
			@RequestParam("email") String email, @RequestParam("password") String password,
			@RequestParam("birthday") String birthday, @RequestParam("phone") String phone,
			@RequestParam("address") String address, @RequestParam("danceCharacter") String danceCharacter,
			@RequestParam("danceAge") String danceAge, @RequestParam("picture") MultipartFile picture) {

		ModelAndView modelAndView = new ModelAndView();
		DateTimeFormatter date = DateTimeFormatter.ofPattern("yyyy-MM-dd");

		UserContactNew user = new UserContactNew();
		UsersBeanNew usersBean = new UsersBeanNew();
		user.setName(name);
		usersBean.setNickName(nickName);
		usersBean.setGender(gender);
		user.setEmail(email);

		// 密碼加密 bcrypt
		// 加密
		String encondPassword = BCrypt.hashpw(password, BCrypt.gensalt());
		usersBean.setPassword(encondPassword);

		if (birthday != null) {
			String dateUser = birthday;
			LocalDate localDate = LocalDate.parse(dateUser, date);
			usersBean.setBirthday(localDate);
		} else {
			String dateUser = "1911-01-01";
			LocalDate localDate = LocalDate.parse(dateUser, date);
			usersBean.setBirthday(localDate);
		}

		user.setPhone(phone);
		user.setAddress(address);
		usersBean.setDanceCharacter(danceCharacter);
		usersBean.setDanceAge(danceAge);

		// 圖片
		try {
			if (!picture.isEmpty()) {
				String fileName = picture.getOriginalFilename();

				String fileDir = resourceLoader.getResource("classpath:/static/userPicture").getFile()
						.getAbsolutePath();

				File fileDirPath = new File(fileDir);
				if (!fileDirPath.exists()) {
					fileDirPath.mkdirs();
				}

				// 改檔名
				String newFileName = user.getEmail() + fileName.substring(fileName.lastIndexOf('.'));

				File uploadedFile = new File(fileDirPath, newFileName);
				// 将檔案寫入本機
				picture.transferTo(uploadedFile);
				usersBean.setPicture("/userPicture/" + newFileName);
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
		if (uService2.isEmailExist(user.getEmail())) {
			System.out.println("比對信箱");
			modelAndView.addObject("emailExists", true);
			modelAndView.setViewName("/confirmRegister");
			return modelAndView;
		} else {
			if (user.getEmail() != "") {
				uService2.insert(usersBean);
				modelAndView.addObject("emailExists", false);
				modelAndView.setViewName("/confirmRegister");
				return modelAndView;
			} else {
				System.out.println("信箱為空");
				modelAndView.addObject("emailExists", true);
				modelAndView.setViewName("/confirmRegister");
				return modelAndView;
			}
		}
	}

	@PutMapping("/Update")
	public ModelAndView processActionUpdateUser(@RequestParam("userName") String name,
			@RequestParam("nickName") String nickName, @RequestParam("gender") String gender,
			@RequestParam("birthday") String birthday, @RequestParam("phone") String phone,
			@RequestParam("address") String address, @RequestParam("danceCharacter") String danceCharacter,
			@RequestParam("danceAge") String danceAge, @RequestParam("picture") MultipartFile picture,
			HttpSession session) {

		ModelAndView modelAndView = new ModelAndView();
		DateTimeFormatter date = DateTimeFormatter.ofPattern("yyyy-MM-dd");

		UserContactNew user = new UserContactNew();
		UsersBeanNew usersBean = new UsersBeanNew();
		UsersBeanNew users = (UsersBeanNew) session.getAttribute("usersBean");

		usersBean.setUserId(users.getUserId());
		user.setName(name);
		usersBean.setNickName(nickName);
		usersBean.setGender(gender);
		user.setEmail(users.getUserContact().getEmail());
		usersBean.setPassword(users.getPassword());
		System.out.println(birthday + "生日");
		if (birthday == null || birthday.trim().isEmpty()) {

		} else {
			String dateUser = birthday;
			LocalDate localDate = LocalDate.parse(dateUser, date);
			usersBean.setBirthday(localDate);
		}

		user.setPhone(phone);
		user.setAddress(address);
		usersBean.setDanceCharacter(danceCharacter);
		usersBean.setDanceAge(danceAge);

		// 圖片
		try {
			if (!picture.isEmpty()) {
				String fileName = picture.getOriginalFilename();

				String fileDir = resourceLoader.getResource("classpath:/static/userPicture").getFile()
						.getAbsolutePath();

				File fileDirPath = new File(fileDir);
				if (!fileDirPath.exists()) {
					fileDirPath.mkdirs();
				}

				// 改檔名
				String newFileName = user.getEmail() + fileName.substring(fileName.lastIndexOf('.'));

				File uploadedFile = new File(fileDirPath, newFileName);
				// 将檔案寫入本機
				picture.transferTo(uploadedFile);
				usersBean.setPicture("/userPicture/" + newFileName);
			} else {
				usersBean.setPicture(users.getPicture());
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		user.setContactId(users.getUserId());

		usersBean.setUserContact(user);
		usersBean.setThirdPartyLogin(0);
		usersBean.setPermission(0);

		uService2.insert(usersBean);
		session.setAttribute("usersBean", usersBean);
		modelAndView.setViewName("redirect:/UpdateUser");
		return modelAndView;

	}

	// 修改密碼
	@PutMapping("/UpdatePassword")
	public ModelAndView processActionUpdateUserPassword(@RequestParam("newpassword") String password,
			HttpSession session) {

		ModelAndView modelAndView = new ModelAndView();

		UserContactNew user = new UserContactNew();
		UsersBeanNew usersBean = new UsersBeanNew();
		UsersBeanNew users = (UsersBeanNew) session.getAttribute("usersBean");

		usersBean.setUserId(users.getUserId());
		user.setName(users.getUserContact().getName());
		usersBean.setNickName(users.getNickName());
		usersBean.setGender(users.getGender());
		user.setEmail(users.getUserContact().getEmail());
		usersBean.setBirthday(users.getBirthday());
		user.setPhone(users.getUserContact().getPhone());
		user.setAddress(users.getUserContact().getAddress());
		usersBean.setDanceCharacter(users.getDanceCharacter());
		usersBean.setDanceAge(users.getDanceAge());
		usersBean.setPicture(users.getPicture());
		user.setContactId(users.getUserId());
		// 密碼
		String encondPassword = BCrypt.hashpw(password, BCrypt.gensalt());
		usersBean.setPassword(encondPassword);

		usersBean.setUserContact(user);
		usersBean.setThirdPartyLogin(0);
		usersBean.setPermission(0);

		uService2.insert(usersBean);
		session.setAttribute("usersBean", usersBean);
		modelAndView.setViewName("redirect:/UpdateUser");
		return modelAndView;

	}

	// 驗證密碼
	@PostMapping("/validatePassword")
	public ResponseEntity<String> validatePassword(@RequestParam("password") String password, HttpSession session) {

		UsersBeanNew usersBean = (UsersBeanNew) session.getAttribute("usersBean");

		boolean flag = BCrypt.checkpw(password, usersBean.getPassword());
		if (flag) {
			return ResponseEntity.ok().body("密碼正確");
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("密碼錯誤");
	}

	// 判定資料庫有無此信箱
	@PostMapping("/validateEmail")
	public ResponseEntity<String> validateEmail(@RequestParam("email") String email) {

		if (uService2.isEmailExist(email)) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("信箱錯誤");
		}
		if ("".equals(email)) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("信箱錯誤");
		}
		return ResponseEntity.ok().body("未註冊");

	}

}
