package com.kh.drommetur.travel.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.drommetur.common.CommonException;
import com.kh.drommetur.common.Criteria;
import com.kh.drommetur.common.PageDTO;
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
		int result=travelService.insertTravel(travel,loginUser.getMemberNo());
			
		return result>0 ? new ResponseEntity<>(HttpStatus.OK):new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
		
	}
	@GetMapping("selectList.tr")
	public String selectTravelList(Criteria cri,Model model,HttpSession session) throws CommonException  {
		
		
		
		Member loginUser=(Member)session.getAttribute("loginUser");
		List<Travel> travelList=travelService.selectList(cri,loginUser.getMemberNo());
		int listCount=travelService.selectListCount();
		
		
		
		if(travelList!=null) {
			
			model.addAttribute("travelList",travelList);
			model.addAttribute("pageDTO", new PageDTO(listCount,cri));
			
			return "member/myPageTravel";
			
		}else {
			

			throw new CommonException("여행목록 불러오기 실패");
			
		}
		
		
	}
	

	@GetMapping("select.tr")
	public String selectTravel( Criteria cri,int travelNo ,Model model) throws CommonException {
		
		Travel travel=travelService.selectTravel(travelNo);
		
		System.out.println(cri);
		
		if(travel!=null) {
			
			model.addAttribute("travel", travel);
			model.addAttribute("cri", cri);
			
			return "member/selectTravel";
			
		}else {
			

			throw new CommonException("여행목록 불러오기 실패");
			
		}
		
		
		
		
	}
	
}
