//package com.mmmooonnn.service;
//
//import java.util.List;
//import java.util.Optional;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import com.mmmooonnn.model.EventPictureRepository;
//import com.mmmooonnn.model.EventPictures;
//
//
//
//
//@Service
//public class EventPicturesService {
//	
//	
//	
//	@Autowired
//	private EventPictureRepository PicRepo;
//
////	insert-----------------------------------------------------------------------------
//	public List<EventPictures> insertPictures(List<EventPictures> eventPictures) {
//	    return PicRepo.saveAll(eventPictures);
//	}
//
////	select-----------------------------------------------------------------------------
//	public List<EventPictures> findAllPictures() {
//		return PicRepo.findAll();
//	}
//	
//	public Optional<EventPictures> findPicById(Integer EventId) {
//	    return PicRepo.findById(EventId);
//	}
//	
//	public Integer findByEventId(Integer EventId) {
//		return PicRepo.findFirstEventPictureIdByEventId(EventId);
//	}
//
////	delete-----------------------------------------------------------------------------
//	public void deletePicById(Integer eventPictures) {
//		PicRepo.deleteById(eventPictures);
//	}
//	
//	public void deleteByEventId(Integer EventId) {
//		PicRepo.deleteById(EventId);
//	}
//
//}
