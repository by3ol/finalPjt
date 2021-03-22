package com.kh.drommetur.taste.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.drommetur.place.model.vo.Search;
import com.kh.drommetur.taste.Pagination;
import com.kh.drommetur.taste.model.service.TasteService;
import com.kh.drommetur.taste.model.vo.PageInfo;
import com.kh.drommetur.taste.model.vo.Taste;


@Controller
public class TasteController {

		
	@Autowired
	private TasteService tasteService;
	@RequestMapping("detail.ta")
	public ModelAndView selectBoard(int placeNo, ModelAndView mv) {
		
		
		
		int result = tasteService.updateIncreaseCount(placeNo);

		
		if(result>0) {

			Taste t = tasteService.selectBoard(placeNo);

			mv.addObject("t",t).setViewName("taste/tasteDetail");
		}else {
			
		}
		return mv;
	}
	
	@RequestMapping("score.ta")
	public String updateScore(@RequestParam("placeNo") int placeNo,  HttpSession session, @RequestParam(value="placeTotalScore", required=false, defaultValue="0") int placeTotalScore, Model model) {
		System.out.println("placeNo : " + placeNo);
		System.out.println("placeTotalScore : " + placeTotalScore);
		Taste t = new Taste();
		t.setPlaceNo(placeNo);
		t.setPlaceTotalScore(placeTotalScore);
		int result = tasteService.updateIncreaseScoreCount(placeNo);
		int result1 = tasteService.updateTotalScore(t);
		int result3 = tasteService.updateScore(placeNo);
		
		if(result>0&&result1>0&&result3>0) {
			
		
			session.setAttribute("msg","평점주기완료!!");
		return "redirect:/detail.ta?placeNo="+placeNo;
		}else {
		session.setAttribute("msg","평점주기실패!!");
		return "redirect:/";
		}
	}
	@RequestMapping("list.ta")
	public String selectList(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, Model model
							, @RequestParam(value="placeCategory",required=false,defaultValue="전체") String placeCategory
								, @RequestParam(value="regionNo", required=false, defaultValue="99") int regionNo) {
	
		PageInfo pi=null;
		ArrayList<Taste> list = null;
		Taste t = new Taste();
		t.setPlaceCategory(placeCategory);
		t.setRegionNo(regionNo);
		if(regionNo==99) {
			if(placeCategory.equals("전체")) {
				int listCount = tasteService.selectListCount();
				
				pi= Pagination.getPageInfo(listCount, currentPage, 10, 12);
				list = tasteService.selectList(pi);
			}else {
			
			int listCount = tasteService.selectListCount();
			
			pi= Pagination.getPageInfo(listCount, currentPage, 10, 12);
			list = tasteService.selectListre(pi, placeCategory);
			}
		}else {
		if(placeCategory.equals("전체")) {
		int listCount = tasteService.selectListCount();
		
		pi= Pagination.getPageInfo(listCount, currentPage, 10, 12);
		list = tasteService.selectListAll(pi,t);
		}else{
			int listCount = tasteService.selectListCountca(t);
			
			pi= Pagination.getPageInfo(listCount, currentPage, 10, 12);
			list = tasteService.selectListca(pi,t);
		}}
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("t",t);
		return "taste/tasteList";
		  
	}
	
	@RequestMapping("search.ta")
	public String searchList(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, Model model
											,@RequestParam("searchPlace") String searchPlace) {
		Search search = new Search();
		search.setSearchName(searchPlace);
		int listCount = tasteService.selectListCount();
		PageInfo pi=null;
		ArrayList<Taste> list = null;
		pi= Pagination.getPageInfo(listCount, currentPage, 10, 12);
		list = tasteService.selectListSearch(pi, search);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("searchPlace",searchPlace);
		
		return "taste/tasteList";
	}

}

   
   


   
   
