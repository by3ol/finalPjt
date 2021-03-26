package com.kh.drommetur.accommodations.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.drommetur.accommodations.Pagination;
import com.kh.drommetur.accommodations.model.service.AccomService;
import com.kh.drommetur.accommodations.model.vo.Accommodations;
import com.kh.drommetur.accommodations.model.vo.PageInfo;
import com.kh.drommetur.place.model.vo.Search;

@Controller
public class AccomController {

		
	@Autowired
	private AccomService accomService;
	@RequestMapping("detail.ac")
	public ModelAndView selectBoard(int placeNo, ModelAndView mv) {
		
		
		
		int result = accomService.updateIncreaseCount(placeNo);

		
		if(result>0) {

			Accommodations ac = accomService.selectBoard(placeNo);

			mv.addObject("ac",ac).setViewName("accommodations/accomDetail");
		}else {
			
		}
		return mv;
	}
	
	@RequestMapping("score.ac")
	public String updateScore(@RequestParam("placeNo") int placeNo,  HttpSession session, @RequestParam(value="placeTotalScore", required=false, defaultValue="0") int placeTotalScore, Model model) {
		System.out.println("placeNo : " + placeNo);
		System.out.println("placeTotalScore : " + placeTotalScore);
		Accommodations ac = new Accommodations();
		ac.setPlaceNo(placeNo);
		ac.setPlaceTotalScore(placeTotalScore);
		int result = accomService.updateIncreaseScoreCount(placeNo);
		int result1 = accomService.updateTotalScore(ac);
		int result3 = accomService.updateScore(placeNo);
		
		if(result>0&&result1>0&&result3>0) {
			
		
			session.setAttribute("msg","평점주기완료!!");
		return "redirect:/detail.ac?placeNo="+placeNo;
		}else {
		session.setAttribute("msg","평점주기실패!!");
		return "redirect:/";
		}
	}

	@RequestMapping("list.ac")
	public String selectList(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, Model model
							, @RequestParam(value="placeCategory",required=false,defaultValue="전체") String placeCategory
								, @RequestParam(value="regionNo", required=false, defaultValue="99") int regionNo) {
	
		
		PageInfo pi=null;
		ArrayList<Accommodations> list = null;
		Accommodations ac = new Accommodations();
		ac.setPlaceCategory(placeCategory);
		ac.setRegionNo(regionNo);
		if(regionNo==99) {
			if(placeCategory.equals("전체")) {
				int listCount = accomService.selectListCount();
				
				pi= Pagination.getPageInfo(listCount, currentPage, 10, 12);
				list = accomService.selectList(pi);
			}else {
			
			int listCount = accomService.selectListCount();
			
			pi= Pagination.getPageInfo(listCount, currentPage, 10, 12);
			list = accomService.selectListre(pi, placeCategory);
			}
		}else {
		if(placeCategory.equals("전체")) {
		int listCount = accomService.selectListCount();
		
		pi= Pagination.getPageInfo(listCount, currentPage, 10, 12);
		list = accomService.selectListAll(pi,ac);
		}else{
			int listCount = accomService.selectListCountca(ac);
			
			pi= Pagination.getPageInfo(listCount, currentPage, 10, 12);
			list = accomService.selectListca(pi,ac);
		}}
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("ac",ac);
		return "accommodations/accomList";
		
	}
	
	@RequestMapping("search.ac")
	public String searchList(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, Model model
											,@RequestParam("searchPlace") String searchPlace) {
		Search search = new Search();
		search.setSearchName(searchPlace);
		int listCount = accomService.selectListCount();
		PageInfo pi=null;
		ArrayList<Accommodations> list = null;
		pi= Pagination.getPageInfo(listCount, currentPage, 10, 12);
		list = accomService.selectListSearch(pi, search);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("searchPlace",searchPlace);
		
		return "accommodations/accomList";
	}

}

   
   


   
   
