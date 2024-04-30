//package com.mmmooonnn.service;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import com.mmmooonnn.model.MatchUserDetailsDTO;
//import com.mmmooonnn.model.MatchesRepository;
//
//@Service
//public class MatchesService {
//
//    @Autowired
//    private MatchesRepository matchesRepository;
//
//    public List<MatchUserDetailsDTO> getMatchUserDetails() {
//        return matchesRepository.getMatchUserDetails();
//    }
//
//    public List<MatchUserDetailsDTO> getSuccessfulMatches() {
//        return matchesRepository.findSuccessfulMatches();
//    }
//
//    public List<MatchUserDetailsDTO> getPendingMatches() {
//        return matchesRepository.findPendingMatches();
//    }
//
//    public List<MatchUserDetailsDTO> getRejectedMatches() {
//        return matchesRepository.findRejectedMatches();
//    }
//}
