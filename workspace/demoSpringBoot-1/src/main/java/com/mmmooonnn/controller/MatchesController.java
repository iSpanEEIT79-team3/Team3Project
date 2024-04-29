package com.mmmooonnn.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.mmmooonnn.service.MatchesService;
import com.mmmooonnn.service.UsersService;

@Controller
public class MatchesController {

	
	@Autowired
	private UsersService uService;
	
	@Autowired 
	private MatchesService mService;
}
