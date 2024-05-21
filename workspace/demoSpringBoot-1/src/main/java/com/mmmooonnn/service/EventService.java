package com.mmmooonnn.service;


import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.mmmooonnn.model.Event;
import com.mmmooonnn.model.EventRepository;

import jakarta.transaction.Transactional;


@Service
@Transactional
public class EventService {

	
	public EventService() {
		
	}
	
	
	
	@Autowired
    private JavaMailSender mailSender;
    
    public void sendPlainText(String receivers, String subject, String content,String From ) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(receivers);
        message.setSubject(subject);
        message.setText(content);
        message.setFrom(From);

        mailSender.send(message);
    }
    
    
    
    

	public EventService(EventRepository eRepos) {
		this.eRepos = eRepos;
	}


	@Autowired
	private EventRepository eRepos;
	
	public List<Event> findAll(){
		return eRepos.findAll();
	}
	
	
	
	public List<Event> findEventsByStartTime(Date startTime,Date endTime) {
//	  Date startDate = parseStartTime(startTime);
		
		

//        return eRepos.findEventsByStartTime(startTime, endTime);
	        
	        
		List<Event> resultList = eRepos.findAll();
		
		if(!resultList.isEmpty()) {
			return eRepos.findByStartTime(startTime, endTime);
		}		
		return resultList;
        
	}

	
	//按照活動日期進行升序排序
	public List<Event> findAllByOrderByStartTimeAsc() {
		return eRepos.findAllByOrderByEventStartTimeAsc();
       
	    }
	
	public Event findEventById(Integer id) {
		Optional<Event> result = eRepos.findById(id);
		
		if(result.isPresent()) {
			return result.get();
		}
		
		return null;
	}

	// insert
//	沒有id就新增+有id就update
	public void saveEvent(Event evBean) {
		 eRepos.save(evBean);
	}
	
	public Event updateEvent(Event evBean) {
		return eRepos.save(evBean);
	}
	
	public void deleteById(Integer id) {
		eRepos.deleteById(id);
	}
	
}
