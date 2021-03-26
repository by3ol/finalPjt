package com.kh.drommetur.travel.model.service;

import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.drommetur.common.Criteria;
import com.kh.drommetur.travel.mapper.TravelMapper;
import com.kh.drommetur.travel.model.vo.SimplePlace;
import com.kh.drommetur.travel.model.vo.Travel;
import com.kh.drommetur.travel.model.vo.TravelDetail;

import lombok.Setter;

@Service
public class TravelServiceImpl implements TravelService {

	
	
	@Setter(onMethod_=@Autowired)
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

	@Override
	public List<Travel> selectList(Criteria cri,int memberNo) {
		
		
		return travelMapper.selectList(cri,memberNo);
	}

	@Override
	public int selectListCount(int memberNo) {
		// TODO Auto-generated method stub
		return travelMapper.selectListCount(memberNo);
	}

	@Override
	public Travel selectTravel(int travelNo) {
		// TODO Auto-generated method stub
		
		Travel travel=travelMapper.selectTravel(travelNo);
		
		List<TravelDetail> travelDetailList=travelMapper.selectTravelDetailList(travelNo); 
		
		for(TravelDetail travelDetail : travelDetailList) {
			
			List<Integer> placeNoList=travelMapper.selectPlaceNoList(travelDetail.getDetailNo());
			
			List<SimplePlace> travelPlaces=new LinkedList<SimplePlace>();
			
			for(int placeNo : placeNoList) {
				
				String placeName=travelMapper.selectPlaceName(placeNo);
				
				travelPlaces.add(new SimplePlace(placeNo,placeName));
				
			}
			
			travelDetail.setTravelPlaces(travelPlaces);
			
		}
		
		travel.setTravelDetailList(travelDetailList);
		
		
		return travel ;
	}

	@Override
	public int deleteTravel(int travelNo) {
		
		return travelMapper.deleteTravel(travelNo);
	}

	@Override
	public int modifyTravel(Travel travel, int memberNo) {
		
		
		int result=travelMapper.modifyDeleteTravel(travel);
		
		result*=travelMapper.modifyInsertTravel(travel,memberNo);
		
		for(TravelDetail travelDetail : travel.getTravelDetailList()) {
			
			result*=travelMapper.modifyInsertTravelDetail(travelDetail,travel.getTravelNo());
			
			for(SimplePlace simplePlace:travelDetail.getTravelPlaces()) {
				
				result*=travelMapper.insertTravelPlace(simplePlace);
			}
			
		
		}
		
		return result;
	}

}
