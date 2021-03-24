package com.kh.drommetur.travel.model.service;

import java.util.List;

import com.kh.drommetur.common.Criteria;
import com.kh.drommetur.travel.model.vo.Travel;

public interface TravelService {

	int insertTravel(Travel travel, int memberNo);

	

	int selectListCount();

	Travel selectTravel(int travelNo);

	List<Travel> selectList(Criteria cri, int memberNo);

}
