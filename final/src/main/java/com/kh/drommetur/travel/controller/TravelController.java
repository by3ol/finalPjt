package com.kh.drommetur.travel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TravelController {

	@GetMapping("/view.tr")
	public String showView(){
		
		
		return "travel/travelMain";
	}
}
