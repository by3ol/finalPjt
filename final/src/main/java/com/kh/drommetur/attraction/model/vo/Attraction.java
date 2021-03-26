package com.kh.drommetur.attraction.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Data
public class Attraction {

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
	private int placeTotalScore;
	private int placeScoreCount;
	
	private int regionNo; //지역번호 
	
}