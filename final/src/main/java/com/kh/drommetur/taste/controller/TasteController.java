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
	public ModelAndView selectBoard(String placeNo, ModelAndView mv) {
		placeNo="2";
		int a = Integer.parseInt(placeNo);
		
		int result = tasteService.updateIncreaseCount(a);

		
		if(result>0) {

			Taste t = tasteService.selectBoard(a);

			mv.addObject("t",t).setViewName("taste/tasteDetail");
		}else {
			
		}
		return mv;
	}
	@RequestMapping("list.ta")
	public String selectList(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, Model model) {
		
		int listCount = tasteService.selectListCount();
		System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 9);
		
		ArrayList<Taste> list = tasteService.selectList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "taste/tasteList";
	}
}


	
	


	
	

