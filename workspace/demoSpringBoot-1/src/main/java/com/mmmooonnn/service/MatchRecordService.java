//package com.mmmooonnn.service;
//
//import java.time.LocalDate;
//import java.util.List;
//import java.util.Random;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//
//import com.mmmooonnn.model.MatchBean;
//import com.mmmooonnn.model.MatchRecordBean;
//import com.mmmooonnn.model.MatchRecordRepository;
//
//@Service
//@Transactional
//public class MatchRecordService {
//	 @Autowired
//	    private MatchRecordRepository matchRepository;
//
//	    public void addRecord(MatchRecordBean record) {
//	        matchRepository.save(record);
//	    }
//
//	    public List<MatchRecordBean> getAllMatchRecord() {
//	        return matchRepository.findAll();
//	    }
//
//	    public void updateMatchRecord(MatchRecordBean record) {
//	        matchRepository.save(record);
//	    }
//
//	    public void deleteMatchRecord(int matchId) {
//	        matchRepository.deleteById(matchId);
//	    }
//
//	    public MatchRecordBean matchUsers(String genderPreference, int maxAge, int specifiedUserId) {
//	        List<MatchBean> userIds = (List<MatchBean>) matchRepository.findByGenderAndAgeLessThanAndIdNot(genderPreference, maxAge, specifiedUserId);
//	        
//	        MatchRecordBean matchRecord = null;
//
//	        if (userIds.size() >= 2) {
//	            Random random = new Random();
//	            int index1 = random.nextInt(userIds.size());
//	            int index2 = index1;
//	            while (index2 == index1) {
//	                index2 = random.nextInt(userIds.size());
//	            }
//
//	            MatchBean user1 = userIds.get(index1);
//	            MatchBean user2 = userIds.get(index2);
//
//	            matchRecord = new MatchRecordBean();
//	            matchRecord.setId1(specifiedUserId);
//	            matchRecord.setId2(user2.getId());
//	            matchRecord.setIsMatch("Yes");
//	            matchRecord.setMatchdate(LocalDate.now());
//	            matchRecord.setPicture(user2.getProfilePicture());
//
//	            matchRepository.save(matchRecord);
//	        }
//
//	        return matchRecord;
//	    }
//	}
