package com.kh.drommetur.taste.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.drommetur.taste.model.service.TasteService;
import com.kh.drommetur.taste.model.vo.Taste;

@Controller
public class TasteController {
		
	@Autowired
	private TasteService tasteservice;
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


	
	


	
	

