package com.kh.drommetur.travel.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kh.drommetur.common.Criteria;
import com.kh.drommetur.travel.model.vo.SimplePlace;
import com.kh.drommetur.travel.model.vo.Travel;
import com.kh.drommetur.travel.model.vo.TravelDetail;

public interface TravelMapper {

	int insertTravel(@Param("travel")Travel travel, @Param("memberNo") int memberNo);

	int insertTravelDetail(TravelDetail travelDetail);

	int insertTravelPlace(SimplePlace simplePlace);

	List<Travel> selectList(@Param("cri")Criteria cri,@Param("memberNo") int memberNo);

	int selectListCount();

	Travel selectTravel(int travelNo);

	List<TravelDetail> selectTravelDetailList(int travelNo);

	List<Integer> selectPlaceNoList(int detailNo);

	String selectPlaceName(int placeNo);
	
	

}
