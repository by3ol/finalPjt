package com.kh.drommetur.travel.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.drommetur.travel.model.dao.TravelDao;
import com.kh.drommetur.travel.model.vo.Travel;

public class TravelServiceImpl implements TravelService {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private TravelDao travelDao;

	@Override
	public int insertTravel(Travel travel, int memberNo) {
		
		//int result1=travelDao.insertTravel(travel,memberNo,sqlSession);
		
		
		return 0;
	}

}
