package com.mmmooonnn.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mmmooonnn.model.MatchUserDetailsDTO;
import com.mmmooonnn.service.MatchesService;

@Controller
@RequestMapping("/api/matches")
public class MatchesController {

    @Autowired
    private MatchesService matchesService;

    
  

    
    @GetMapping("/matchUserDetails/byStatus")
    public List<MatchUserDetailsDTO> getMatchesByStatus(@RequestParam("status") String status) {
    
    	return matchesService.getMatchesByStatus(status);    
    }
}
