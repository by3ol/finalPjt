package com.kh.drommetur.attraction.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.drommetur.attraction.Pagination;
import com.kh.drommetur.attraction.model.service.AttractionService;
import com.kh.drommetur.attraction.model.vo.Attraction;
import com.kh.drommetur.attraction.model.vo.PageInfo;
import com.kh.drommetur.place.model.vo.Search;

@Controller
public class AttractionController {

		
	@Autowired
	private AttractionService attractionService;
	@RequestMapping("detail.at")
	public ModelAndView selectBoard(int placeNo, ModelAndView mv) {
		
		
		
		int result = attractionService.updateIncreaseCount(placeNo);

		
		if(result>0) {

			Attraction at = attractionService.selectBoard(placeNo);

			mv.addObject("at",at).setViewName("attraction/attractionDetail");
		}else {
			
		}
		return mv;
	}
	
	@RequestMapping("score.at")
	public String updateScore(@RequestParam("placeNo") int placeNo,  HttpSession session, @RequestParam(value="placeTotalScore", required=false, defaultValue="0") int placeTotalScore, Model model) {
		System.out.println("placeNo : " + placeNo);
		System.out.println("placeTotalScore : " + placeTotalScore);
		Attraction at = new Attraction();
		at.setPlaceNo(placeNo);
		at.setPlaceTotalScore(placeTotalScore);
		int result = attractionService.updateIncreaseScoreCount(placeNo);
		int result1 = attractionService.updateTotalScore(at);
		int result3 = attractionService.updateScore(placeNo);
		
		if(result>0&&result1>0&&result3>0) {
			
		
			session.setAttribute("msg","평점주기완료!!");
		return "redirect:/detail.at?placeNo="+placeNo;
		}else {
		session.setAttribute("msg","평점주기실패!!");
		return "redirect:/";
		}
	}

	@RequestMapping("list.at")
	public String selectList(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, Model model
							, @RequestParam(value="placeCategory",required=false,defaultValue="전체") String placeCategory
								, @RequestParam(value="regionNo", required=false, defaultValue="99") int regionNo) {
	
		
		PageInfo pi=null;
		ArrayList<Attraction> list = null;
		Attraction at = new Attraction();
		at.setPlaceCategory(placeCategory);
		at.setRegionNo(regionNo);
		if(regionNo==99) {
			if(placeCategory.equals("전체")) {
				int listCount = attractionService.selectListCount();
				
				pi= Pagination.getPageInfo(listCount, currentPage, 10, 12);
				list = attractionService.selectList(pi);
			}else {
			
			int listCount = attractionService.selectListCount();
			
			pi= Pagination.getPageInfo(listCount, currentPage, 10, 12);
			list = attractionService.selectListre(pi, at);
			}
		}else {
		if(placeCategory.equals("전체")) {
		int listCount = attractionService.selectListCount();
		
		pi= Pagination.getPageInfo(listCount, currentPage, 10, 12);
		list = attractionService.selectListAll(pi,at);
		}else{
			int listCount = attractionService.selectListCountca(at);
			
			pi= Pagination.getPageInfo(listCount, currentPage, 10, 12);
			list = attractionService.selectListca(pi,at);
		}}
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("at",at);
		return "attraction/attractionList";
		
	}
	
	@RequestMapping("search.at")
	public String searchList(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, Model model
											,@RequestParam("searchPlace") String searchPlace) {
		Search search = new Search();
		search.setSearchName(searchPlace);
		int listCount = attractionService.selectListCount();
		PageInfo pi=null;
		ArrayList<Attraction> list = null;
		pi= Pagination.getPageInfo(listCount, currentPage, 10, 12);
		list = attractionService.selectListSearch(pi, search);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("searchPlace",searchPlace);
		
		return "attraction/attractionList";
	}

}

   
   


   
   
