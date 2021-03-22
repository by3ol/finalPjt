package com.kh.drommetur.travel.mapper;

import org.apache.ibatis.annotations.Param;

import com.kh.drommetur.travel.model.vo.SimplePlace;
import com.kh.drommetur.travel.model.vo.Travel;
import com.kh.drommetur.travel.model.vo.TravelDetail;

public interface TravelMapper {

	int insertTravel(@Param("travel")Travel travel, @Param("memberNo") int memberNo);

	int insertTravelDetail(TravelDetail travelDetail);

	int insertTravelPlace(SimplePlace simplePlace);
	
	

}
