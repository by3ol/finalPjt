package com.kh.drommetur.travel.model.vo;

import lombok.Data;

@Data
public class SimplePlace {

	private int placeNo;
	private String placeName;
	
	
	public SimplePlace(int placeNo,String placeName) {
		
		this.placeNo=placeNo;
		this.placeName=placeName;
	}
	
}
