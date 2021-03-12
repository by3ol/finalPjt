package com.kh.drommetur.place.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.drommetur.place.model.service.PlaceService;
import com.kh.drommetur.place.model.vo.Place;

@Controller
public class PlaceController {
	
	
	
	@Autowired
	PlaceService placeService;
	
	@GetMapping(value="placeList/{group}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String selectPlaceList(@PathVariable("group")String group) {
		
		ArrayList<Place> list=placeService.selectPlaceList(group);
		
		Gson gson=new GsonBuilder().create();
		
		return gson.toJson(list);
		
	}
	
}
