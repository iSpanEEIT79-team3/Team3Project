package com.mmmooonnn.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mmmooonnn.model.Event;
import com.mmmooonnn.model.UsersBeanNew;
import com.mmmooonnn.service.EventService;

import jakarta.servlet.http.HttpSession;


@Controller
@SessionAttributes(names = { "eventBeans" })
public class EventController {

	@Autowired
	EventService eService;

	 @PostMapping("/purchase")
	    public ResponseEntity<?> purchaseProduct(@RequestParam("productId") Long productId,
	                                             @RequestParam("contactId") Long userId ,HttpSession session) {
	        // 检查用户登录状态
//	        if (!userService.isUserLoggedIn(userId)) {
//	            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("用户未登录");
//	        }

	        // 检查库存
//	        Product product = productService.getProductById(productId);
//	        if (product == null || product.getStock() <= 0) {
//	            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("商品库存不足");
//	        }

	        // 扣除用户账户金额（示例中省略）

	        // 插入购买记录到数据库中
	        Event purchase = new Event();
//	        purchase.setUserId(userId);
//	        purchase.setProductId(productId);
//	        purchase.setPurchaseTime(new Date());
//	        eService.addPurchase(purchase);

	        // 返回购买成功的响应
	        return ResponseEntity.ok("购买成功");
	    }
//前台
	// ajax查單筆用
	@GetMapping("/ajaxFindEvenDataByID/{evenID}")
	@ResponseBody
	public Event ajaxFindEvenDataByID(@PathVariable("evenID") Integer evenId,HttpSession session) {
		UsersBeanNew user = (UsersBeanNew)session.getAttribute("usersBean");
		System.out.println(user.getUserId());
//		m.addAttribute("userId",user.getUserId());
		Integer userId=user.getUserId();
		Event eventBean = eService.findEventById(evenId);
		eventBean.setUserId(userId);
	System.out.println(eventBean);
		return eventBean;
	}
	
//	@GetMapping("/ajaxFindEvenDataByID/{evenID}")
//	@ResponseBody
//	public Event BuyAction(@PathVariable("evenID") Integer evenId,HttpSession session) {
//		UsersBeanNew user = (UsersBeanNew)session.getAttribute("usersBean");
////		m.addAttribute("userId",user.getUserId());
//		
//		Event eventBean = eService.findEventById(evenId);
//		return eventBean;
//	}
	
	//前台
	// ajax查全部
	@GetMapping("/ajaxFindAll")
	@ResponseBody
	public List<Event> ajaxFindAll() {
		List<Event> eventBeans = eService.findAllByOrderByStartTimeAsc();
		System.out.println(eventBeans);
		return eventBeans;
	}
	//前台	
	//收藏活動寄email
	  @PostMapping("/eventCollection")
		@ResponseBody
	    public ResponseEntity EventCollection(
	    		@RequestParam("EVENT_STARTIME") String eventDate ,   
	    		@RequestParam("EVENT_NAME") String eventName) 
	         {
		 
		  System.out.println("6666666666" + eventName);
		  
	            String receivers = "emil62y7@gmail.com";
	            String subject ="活動收藏成功";
	            String content = "親愛的先生/小姐，您好！您已收藏活動，活動時間為：" + eventDate +"活動名稱為："+ eventName + "\n期待您的蒞臨！";
	            String From = "JFSwing搖擺舞教室<emil62y7@gmail.com>";
	            
	            System.out.println(content);
	            eService.sendPlainText(receivers, subject, content,From);
//	           return "successCollection.html";
	            return ResponseEntity.ok().body("good");
	        }
	

	@GetMapping("/WSall")
	public ModelAndView processFindASllAction() {
		ModelAndView modelAndView = new ModelAndView();

		List<Event> eventBeans = eService.findAllByOrderByStartTimeAsc();
		System.out.println(eventBeans);
		modelAndView.addObject("eventBeans", eventBeans);
		modelAndView.setViewName("forward:/WEB-INF/jsp/WSGetAllEmps.jsp");
		return modelAndView;
	}

//	@PostMapping("/WSinsert")
//	@ResponseBody
//	public ModelAndView processInsertAction2(@RequestBody Event saveBean) {
//		System.out.println(saveBean.toString());
//		ModelAndView modelAndView = new ModelAndView();
//			eService.insert(saveBean);
//		 List<Event> eventBeans = eService.findAll();
//
//		 modelAndView.addObject("eventBeans", eventBeans);
//		 modelAndView.setViewName("forward:/jsp/back.jsp?includeWSGetAllEmps=true");
//			return modelAndView;      
//	}

	@PostMapping("/WSinsert")
	public ModelAndView WSinsert(@RequestParam("EVENT_STARTIME") String startTime,
			@RequestParam("EVENT_ENDTIME") String endTime, @RequestParam("SIGNUP_STARTIME") String signupTime,
			@RequestParam("SIGNUP_ENDTIME") String deadline, @RequestParam("EVENT_NAME") String eventName,
			@RequestParam("EVENT_DETAIL") String eventDetail, @RequestParam("EVENT_CATEGORY") String eventCategory,
			@RequestParam("EVENT_PRICE") int eventPrice, @RequestParam("EVENT_ADDRES") String eventLocation,
			@RequestParam("ORGANIZER") String organizer, @RequestParam("PICTURE") MultipartFile picture) throws ParseException {

		ModelAndView modelAndView = new ModelAndView();
		Event eventBean = new Event();
//        DateTimeFormatter date = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");
		
		System.out.println("startTime : " + startTime);
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");

//        LocalDate startDate = LocalDate.parse(startTime);
		Date startTime_time = (Date)dateFormat.parse(startTime);
		eventBean.setStartTime(startTime_time);

//        LocalDate endDate = LocalDate.parse(endTime);
		Date endTime_time = (Date)dateFormat.parse(endTime);
		eventBean.setEndTime(endTime_time);

//        LocalDate signTime = LocalDate.parse(signup);
		Date signupTime_time = (Date)dateFormat.parse(signupTime);
		eventBean.setSignupStartime(signupTime_time);

//        LocalDate endsign = LocalDate.parse(deadline);
		Date deadline_time = (Date)dateFormat.parse(deadline);
		eventBean.setSignupEndtime(deadline_time);

		eventBean.setEventName(eventName);
		eventBean.setEventDetail(eventDetail);
		eventBean.setEventCategory(eventCategory);
		eventBean.setEventPrice(eventPrice);
		eventBean.setEventLocation(eventLocation);
		eventBean.setOrganizer(organizer);

		// 圖片
		try {
			if (!picture.isEmpty()) {
				String fileName = picture.getOriginalFilename();

				String fileDir = "D:\\team3\\workspace\\demoSpringBoot-1\\src\\main\\resources\\static\\images";

				File fileDirPath = new File(fileDir);
				if (!fileDirPath.exists()) {
					fileDirPath.mkdirs();
				}
				File uploadedFile = new File(fileDirPath, fileName);
				// 將檔案寫入本機
				picture.transferTo(uploadedFile);
				eventBean.setPicture("/images/" + fileName);
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		eService.saveEvent(eventBean);
		System.out.println(eventBean);
		List<Event> eventBeans = eService.findAll();

		modelAndView.addObject("eventBeans", eventBeans);
		modelAndView.setViewName("forward:/WEB-INF/jsp/WSGetAllEmps.jsp");
		return modelAndView;
	}

	@PutMapping("/Getupdate/{EventId}")
	public ModelAndView showUpdateForm(@PathVariable("EventId") int EventId, Model model) {
		System.out.println(EventId);
		ModelAndView modelAndView = new ModelAndView();
		Event eventBean = eService.findEventById(EventId);
		modelAndView.addObject("eventBean", eventBean);
		modelAndView.setViewName("forward:/WEB-INF/jsp/WSupdateData.jsp");
		return modelAndView;
	}
	
	//前台的controller
//	@PostMapping
//	@ResponseBody
//	public Event buyAction(@RequestParam("PRODUCTID") int EventId,@RequestParam("EVENT_NAME") String eventName,@RequestParam("EVENT_PRICE") int eventPrice,@RequestParam("EVENT_PRICE") int eventPrice) {
//		Event eventBean = eService.findEventById(evenId);
//		
//		return eventBean;
//	}
//	
	
	

	@PutMapping("/WSupdate")
	public ModelAndView UpdateAction(@RequestParam("PRODUCTID") int EventId,
			@RequestParam("EVENT_STARTIME") String startTime, @RequestParam("EVENT_ENDTIME") String endTime,
			@RequestParam("SIGNUP_STARTIME") String signupTime, @RequestParam("SIGNUP_ENDTIME") String deadline,
			@RequestParam("EVENT_NAME") String eventName, @RequestParam("EVENT_DETAIL") String eventDetail,
			@RequestParam("EVENT_CATEGORY") String eventCategory, @RequestParam("EVENT_PRICE") int eventPrice,
			@RequestParam("EVENT_ADDRES") String eventLocation, @RequestParam("ORGANIZER") String organizer,
			@RequestParam("PICTURE") MultipartFile picture, @RequestParam("oldPICTUREpath") String oldPicturePath)
			throws IllegalStateException, IOException, ParseException {
		Event eventBean = new Event();
		ModelAndView modelAndView = new ModelAndView();

		eventBean.setEventId(EventId);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");

//      LocalDate startDate = LocalDate.parse(startTime);
		Date startTime_time = (Date)dateFormat.parse(startTime);
		eventBean.setStartTime(startTime_time);

//      LocalDate endDate = LocalDate.parse(endTime);
		Date endTime_time = (Date)dateFormat.parse(endTime);
		eventBean.setEndTime(endTime_time);

//      LocalDate signTime = LocalDate.parse(signup);
		Date signupTime_time = (Date)dateFormat.parse(signupTime);
		eventBean.setSignupStartime(signupTime_time);

//      LocalDate endsign = LocalDate.parse(deadline);
		Date deadline_time = (Date)dateFormat.parse(deadline);
		eventBean.setSignupEndtime(deadline_time);

		eventBean.setEventName(eventName);
		eventBean.setEventDetail(eventDetail);
		eventBean.setEventCategory(eventCategory);
		eventBean.setEventPrice(eventPrice);
		eventBean.setEventLocation(eventLocation);
		eventBean.setOrganizer(organizer);
		// 圖片
		try {
			if (!picture.isEmpty()) {
				String fileName = picture.getOriginalFilename();

				String fileDir = "D:\\team3\\workspace\\demoSpringBoot-1\\src\\main\\resources\\static\\images";

				File fileDirPath = new File(fileDir);
				if (!fileDirPath.exists()) {
					fileDirPath.mkdirs();
				}
				File uploadedFile = new File(fileDirPath, fileName);
				// 將檔案寫入本機
				picture.transferTo(uploadedFile);
				eventBean.setPicture("/images/" + fileName);
			} else {
				eventBean.setPicture(oldPicturePath);
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		eService.updateEvent(eventBean);

		List<Event> eventBeans = eService.findAllByOrderByStartTimeAsc();

		modelAndView.addObject("eventBeans", eventBeans);
		modelAndView.setViewName("forward:/WEB-INF/jsp/WSGetAllEmps.jsp");
		return modelAndView;
	}

	@DeleteMapping("/Event")
	public ModelAndView processDeleteAction(@RequestParam("PRODUCTID") Integer eventId) {
		ModelAndView modelAndView = new ModelAndView();
		eService.deleteById(eventId);

		List<Event> eventBeans = eService.findAllByOrderByStartTimeAsc();
		modelAndView.addObject("eventBeans", eventBeans);
		modelAndView.setViewName("forward:/WEB-INF/jsp/WSGetAllEmps.jsp");
		return modelAndView;
	}

	@GetMapping("/WSSearchByDate")
	public ModelAndView WSSearchByDate(@RequestParam("startTime") Date startTime) {
		ModelAndView modelAndView = new ModelAndView();
		List<Event> eventBeans = eService.findEventsByStartTime(startTime);

		modelAndView.addObject("eventBeans", eventBeans);
		modelAndView.setViewName("forward:/WEB-INF/jsp/WSGetAllEmps.jsp");
		return modelAndView;
	}

}