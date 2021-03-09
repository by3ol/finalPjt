package com.kh.drommetur.place.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Place {

	private int placeNo;
	private String placeAddr;
	private String placeName;
	private String placePhone;
	private String placeGroup;
	private Double placeLon;
	private Double placeLat;
	private String placeCategory;
	private Date placeDate;
	private String placeStatus;
	private String placeUrl;
	private int placeCount;
	private double placeScore;
	
	
	private int regionNo; //지역번호 

	

	
	
}
