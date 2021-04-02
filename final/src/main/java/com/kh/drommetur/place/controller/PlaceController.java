package com.kh.drommetur.place.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.drommetur.place.model.service.PlaceService;
import com.kh.drommetur.place.model.vo.Place;

@Controller
public class PlaceController {
	
	
	
	@Autowired
	PlaceService placeService;
	
	@GetMapping(value="placeList/{group}/{region}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public ResponseEntity<ArrayList<Place>> selectPlaceList(@PathVariable("group")String group, @PathVariable("region")int region) {
		
		
		Place place=new Place();
		place.setPlaceGroup(group);
		place.setRegionNo(region);
		
		ArrayList<Place> list=placeService.selectPlaceList(place);
		
		
		
		return new ResponseEntity<>(list,HttpStatus.OK);
		
	}
	
	
	@GetMapping(value="placeList", produces="application/json;charset=UTF-8")
	@ResponseBody
	public ResponseEntity<ArrayList<Place>> searchPlaceList(String keyword) {
		
		

		
		ArrayList<Place> list=placeService.searchPlaceList(keyword);
		
		
		
		return new ResponseEntity<>(list,HttpStatus.OK);
		
	}
	
	
}
