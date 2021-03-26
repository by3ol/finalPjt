package com.kh.drommetur.travel.model.service;

import java.util.List;

import com.kh.drommetur.common.Criteria;
import com.kh.drommetur.travel.model.vo.Travel;

public interface TravelService {

	int insertTravel(Travel travel, int memberNo);

	

	int selectListCount(int memberNo);

	Travel selectTravel(int travelNo);

	List<Travel> selectList(Criteria cri, int memberNo);



	int deleteTravel(int travelNo);



	int modifyTravel(Travel travel, int memberNo);

}
