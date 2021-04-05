package com.kh.drommetur.travel.model.vo;

import java.util.Date;
import java.util.List;

import com.kh.drommetur.place.model.vo.Place;

import lombok.Data;
@Data
public class TravelDetail {

	private int detailNo;
	private Date travelDate;
	private List<Place> travelPlaces;
	
}
