//package com.mmmooonnn.controller;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import com.mmmooonnn.model.MatchUserDetailsDTO;
//
//import com.mmmooonnn.service.MatchesService;
//
//
//@Controller
//@RequestMapping("/api/matches")
//public class MatchesController {
//
//    @Autowired
//    private MatchesService matchesService;
//
//    @GetMapping("/matchUserDetails")
//    public List<MatchUserDetailsDTO> getMatchUserDetails() {
//        return matchesService.getMatchUserDetails();
//    }
//
//    // 已成功配對
//    @GetMapping("/matchUserDetails/success")
//    public List<MatchUserDetailsDTO> getSuccessfulMatches() {
//        return matchesService.getSuccessfulMatches();
//    }
//
//    // 尚未確認
//    @GetMapping("/matchUserDetails/pending")
//    public List<MatchUserDetailsDTO> getPendingMatches() {
//        return matchesService.getPendingMatches();
//    }
//
//    // 被拒絕
//    @GetMapping("/matchUserDetails/rejected")
//    public List<MatchUserDetailsDTO> getRejectedMatches() {
//        return matchesService.getRejectedMatches();
//    }
//}