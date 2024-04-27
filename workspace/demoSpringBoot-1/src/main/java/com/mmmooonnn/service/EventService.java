package com.mmmooonnn.service;


import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mmmooonnn.model.Event;
import com.mmmooonnn.model.EventRepository;

import jakarta.transaction.Transactional;


@Service
@Transactional
public class EventService {

	
	public EventService() {
		
	}
	

	public EventService(EventRepository eRepos) {
		this.eRepos = eRepos;
	}


	@Autowired
	private EventRepository eRepos;
	
	public List<Event> findAll(){
		return eRepos.findAll();
	}
	
	
	
	public List<Event> findEventsByStartTime(Date startTime) {
//	  Date startDate = parseStartTime(startTime);
		List<Event> resultList = eRepos.findAll();
		
		if(!resultList.isEmpty()) {
			return eRepos.findByStartTime(startTime);
		}		
		return resultList;
        
    }
	
	public Event findEventById(Integer id) {
		Optional<Event> result = eRepos.findById(id);
		
		if(result.isPresent()) {
			return result.get();
		}
		
		return null;
	}
	
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
