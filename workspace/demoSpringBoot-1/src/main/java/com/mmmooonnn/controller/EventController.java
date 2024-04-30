package com.mmmooonnn.controller;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.mmmooonnn.model.Event;
import com.mmmooonnn.service.EventService;





@Controller
@SessionAttributes(names = {"eventBeans"})
public class EventController{
	
	@Autowired
	EventService eService;
	
	 @InitBinder
	    public void initBinder(WebDataBinder binder) {
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	        dateFormat.setLenient(false);
	        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	    }
	 
//	 在Controller中加入自訂的參數轉換器
//	 透過使用@InitBinder註解和WebDataBinder類別來實現參數轉換
//	 
	
	//ajax查單筆用
	 	@GetMapping("/ajaxFindEvenDataByID/{evenID}")
	 	@ResponseBody
	    public Event ajaxFindEvenDataByID(@PathVariable("evenID") Integer evenId) {
	 		Event eventBean = eService.findEventById(evenId);
	        return eventBean;
	    }
	 	
	 	//ajax查全部
	 	@GetMapping("/ajaxFindAll")
	 	@ResponseBody
	    public List<Event> ajaxFindAll() {
	 		List<Event> eventBeans = eService.findAll();
	        return eventBeans;
	    }
	 	
	


	 	
	@GetMapping("/WSall")
	public ModelAndView processFindASllAction() {
		ModelAndView modelAndView = new ModelAndView();
		
		List<Event> eventBeans = eService.findAll();
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
    public ModelAndView WSinsert( @RequestParam("EVENT_STARTIME") String startTime,
                              @RequestParam("EVENT_ENDTIME") String endTime,
                              @RequestParam("SIGNUP_STARTIME") String signup,
                              @RequestParam("SIGNUP_ENDTIME") String deadline,
                              @RequestParam("EVENT_NAME") String eventName,
                              @RequestParam("EVENT_DETAIL") String eventDetail,
                              @RequestParam("EVENT_CATEGORY") String eventCategory,
                              @RequestParam("EVENT_PRICE") int eventPrice,
                              @RequestParam("EVENT_ADDRES") String eventLocation,
                              @RequestParam("ORGANIZER") String organizer,
                              @RequestParam("PICTURE") MultipartFile[] pictures) {
		
		ModelAndView modelAndView = new ModelAndView();
		Event eventBean = new Event();
        DateTimeFormatter date = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        LocalDate startDate = LocalDate.parse(startTime, date);
        eventBean.setStartTime(java.sql.Date.valueOf(startDate));

        LocalDate endDate = LocalDate.parse(endTime, date);
        eventBean.setEndTime(java.sql.Date.valueOf(endDate));

        LocalDate signTime = LocalDate.parse(signup, date);
        eventBean.setSignupStartime(java.sql.Date.valueOf(signTime));

        LocalDate endsign = LocalDate.parse(deadline, date);
        eventBean.setSignupEndtime(java.sql.Date.valueOf(endsign));

        eventBean.setEventName(eventName);
        eventBean.setEventDetail(eventDetail);
        eventBean.setEventCategory(eventCategory);
        eventBean.setEventPrice(eventPrice);
        eventBean.setEventLocation(eventLocation);
        eventBean.setOrganizer(organizer);     
        
      //圖片
      		try {
      			
      			 for (MultipartFile picture : pictures) {

      			if(!picture.isEmpty()) {
      				String fileName = picture.getOriginalFilename();
      				
      				String fileDir = "D:\\team3\\workspace\\demoSpringBoot-1\\src\\main\\resources\\static\\images";
      				
      				File fileDirPath = new File(fileDir);
      				if (!fileDirPath.exists()) {
      			           fileDirPath.mkdirs();
      			    }
      				File uploadedFile = new File(fileDirPath, fileName);
      		        // 將檔案寫入本機
      		        picture.transferTo(uploadedFile);      			 
      			    eventBean.setPicture("/images/"+fileName);
      			}}
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
	
	@PutMapping("/WSupdate")
	public ModelAndView UpdateAction(@RequestParam("PRODUCTID") int EventId,
			@RequestParam("EVENT_STARTIME") String startTime, @RequestParam("EVENT_ENDTIME") String endTime,
			@RequestParam("SIGNUP_STARTIME") String signup, @RequestParam("SIGNUP_ENDTIME") String deadline,
			@RequestParam("EVENT_NAME") String eventName, @RequestParam("EVENT_DETAIL") String eventDetail,
			@RequestParam("EVENT_CATEGORY") String eventCategory, @RequestParam("EVENT_PRICE") int eventPrice,
			@RequestParam("EVENT_ADDRES") String eventLocation, @RequestParam("ORGANIZER") String organizer,
			@RequestParam("PICTURE") MultipartFile picture,@RequestParam("oldPICTUREpath") String oldPicturePath)throws IllegalStateException,IOException {
		Event eventBean = new Event();
		ModelAndView modelAndView = new ModelAndView();
		
		eventBean.setEventId(EventId);
		DateTimeFormatter date = DateTimeFormatter.ofPattern("yyyy-MM-dd");

      LocalDate startDate = LocalDate.parse(startTime, date);
      eventBean.setStartTime(java.sql.Date.valueOf(startDate));

      LocalDate endDate = LocalDate.parse(endTime, date);
      eventBean.setEndTime(java.sql.Date.valueOf(endDate));

      LocalDate signTime = LocalDate.parse(signup, date);
      eventBean.setSignupStartime(java.sql.Date.valueOf(signTime));

      LocalDate endsign = LocalDate.parse(deadline, date);
      eventBean.setSignupEndtime(java.sql.Date.valueOf(endsign));

      eventBean.setEventName(eventName);
      eventBean.setEventDetail(eventDetail);
      eventBean.setEventCategory(eventCategory);
      eventBean.setEventPrice(eventPrice);
      eventBean.setEventLocation(eventLocation);
      eventBean.setOrganizer(organizer);
    //圖片
		try {
			if(!picture.isEmpty()) {
				String fileName = picture.getOriginalFilename();
				
				String fileDir = "D:\\team3\\workspace\\demoSpringBoot-1\\src\\main\\resources\\static\\images";
				
				File fileDirPath = new File(fileDir);
				if (!fileDirPath.exists()) {
			           fileDirPath.mkdirs();
			    }
				File uploadedFile = new File(fileDirPath, fileName);
		        // 將檔案寫入本機
		        picture.transferTo(uploadedFile);      			 
			    eventBean.setPicture("/images/"+fileName);
			}
			else {
				eventBean.setPicture(oldPicturePath);
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
      
		eService.updateEvent(eventBean);
		
		List<Event> eventBeans = eService.findAll();
    
        modelAndView.addObject("eventBeans", eventBeans);
		modelAndView.setViewName("forward:/WEB-INF/jsp/WSGetAllEmps.jsp");
		return modelAndView;      
	}

	
	@DeleteMapping("/Event")
	public ModelAndView processDeleteAction(@RequestParam("PRODUCTID")Integer eventId) {
		ModelAndView modelAndView = new ModelAndView();
		eService.deleteById(eventId);
		
		List<Event> eventBeans = eService.findAll();
		modelAndView.addObject("eventBeans", eventBeans);
		modelAndView.setViewName("forward:/WEB-INF/jsp/WSGetAllEmps.jsp");
			return modelAndView;    
	}
	
	@GetMapping("/WSSearchByDate")
	public ModelAndView WSSearchByDate(@RequestParam("startTime") Date startTime) {
		ModelAndView modelAndView = new ModelAndView();
		List<Event> eventBeans =eService.findEventsByStartTime(startTime);
		
		modelAndView.addObject("eventBeans", eventBeans);
		modelAndView.setViewName("forward:/WEB-INF/jsp/WSGetAllEmps.jsp");
			return modelAndView;    
	}
	

}