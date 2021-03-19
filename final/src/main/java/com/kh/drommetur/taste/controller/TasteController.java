package com.kh.drommetur.taste.controller;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	@RequestMapping("list.ta")
	public String selectList(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, Model model, @RequestParam(value="placeCategory",required=false,defaultValue="전체") String placeCategory) {
	
		PageInfo pi=null;
		ArrayList<Taste> list = null;
		
		if(placeCategory.equals("전체")) {
		int listCount = tasteService.selectListCount();
		
		pi= Pagination.getPageInfo(listCount, currentPage, 10, 12);
		list = tasteService.selectList(pi);
		}else {
			int listCount = tasteService.selectListCountca(placeCategory);
			
			pi= Pagination.getPageInfo(listCount, currentPage, 10, 12);
			list = tasteService.selectListca(pi,placeCategory);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("placeCategory",placeCategory);
		return "taste/tasteList";
		
	}

}

   
   


   
   
