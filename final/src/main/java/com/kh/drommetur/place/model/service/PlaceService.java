package com.kh.drommetur.place.model.service;

import java.util.ArrayList;

import com.kh.drommetur.place.model.vo.Place;


public interface PlaceService {

	
	int insertPlaceList(ArrayList<Place> list);

	ArrayList<Place> selectPlaceList(Place place);
}
