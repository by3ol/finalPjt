package com.kh.drommetur.travel.model.vo;

import java.sql.Date;
import java.util.List;

import lombok.Data;
@Data
public class TravelDetail {

	private Date travelDate;
	private List<SimplePlace> travelPlaces;
	
}
