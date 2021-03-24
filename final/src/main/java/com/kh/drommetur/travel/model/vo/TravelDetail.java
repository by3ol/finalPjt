package com.kh.drommetur.travel.model.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;
@Data
public class TravelDetail {

	private int detailNo;
	private Date travelDate;
	private List<SimplePlace> travelPlaces;
	
}
