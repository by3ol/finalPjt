package com.kh.drommetur.taste.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.drommetur.taste.model.service.TasteService;
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
}


	
	


	
	

