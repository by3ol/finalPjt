package com.kh.drommetur.travel.model.vo;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class Travel {

	private int travelNo;
	private String travelName;
	private String travelMemo;
	private Date travelRegDate;
	
	private List<TravelDetail> travelDetailList;
}
