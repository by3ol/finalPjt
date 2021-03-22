package com.kh.drommetur.travel.model.vo;

import java.util.List;

import lombok.Data;

@Data
public class Travel {

	private String travelName;
	private String travelMemo;
	
	private List<TravelDetail> travelDetailList;
}
