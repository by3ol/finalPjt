package com.kh.drommetur.travel.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.drommetur.travel.mapper.TravelMapper;
import com.kh.drommetur.travel.model.vo.SimplePlace;
import com.kh.drommetur.travel.model.vo.Travel;
import com.kh.drommetur.travel.model.vo.TravelDetail;

@Service
public class TravelServiceImpl implements TravelService {

	
	
	@Autowired
	private TravelMapper travelMapper;

	@Override
	public int insertTravel(Travel travel, int memberNo) {
		
		int result1=travelMapper.insertTravel(travel,memberNo);
		
		int result2=1;
		
		for(TravelDetail travelDetail : travel.getTravelDetailList()) {
			result2*=travelMapper.insertTravelDetail(travelDetail);
			
			for(SimplePlace simplePlace : travelDetail.getTravelPlaces()) {
				
				result2*=travelMapper.insertTravelPlace(simplePlace);
			}
			
			
		}
				
		return result1*result2;
	}

}
