package com.kh.drommetur.travel.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.drommetur.member.model.vo.Member;
import com.kh.drommetur.travel.model.service.TravelService;
import com.kh.drommetur.travel.model.vo.Travel;

@Controller
public class TravelController {

	
	@Autowired
	private TravelService travelService;
	
	@GetMapping("view.tr")
	public String showView(){
		
		
		return "travel/travelMain";
	}
	
	
	@RequestMapping(value="insert.tr",method=RequestMethod.POST
			,consumes="application/json")
	@ResponseBody
	public ResponseEntity<String> insertTravel(@RequestBody Travel travel,HttpSession session) {
		
		
		System.out.println(travel);
		Member loginUser=(Member) session.getAttribute("loginUser");
		//int result=travelService.insertTravel(travel,loginUser.getMemberNo());
			
		//return result>1 ? new ResponseEntity<>(HttpStatus.OK):new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
}
