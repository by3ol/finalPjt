package com.kh.drommetur.attraction.model.service;

import java.util.ArrayList;

import com.kh.drommetur.attraction.model.vo.Attraction;
import com.kh.drommetur.attraction.model.vo.PageInfo;
import com.kh.drommetur.place.model.vo.Search;

public interface AttractionService {

	int updateIncreaseCount(int placeNo);

	Attraction selectBoard(int placeNo);

	int selectListCount();

	ArrayList<Attraction> selectList(PageInfo pi);

	int selectListCountca(Attraction ac);

	ArrayList<Attraction> selectListca(PageInfo pi,Attraction ac);

	

	ArrayList<Attraction> selectListSearch(PageInfo pi, Search search);

	ArrayList<Attraction> selectListAll(PageInfo pi, Attraction ac);

	

	int updateIncreaseScoreCount(int placeNo);

	int updateTotalScore(Attraction ac);

	int updateScore(int placeNo);

	ArrayList<Attraction> selectListre(PageInfo pi, Attraction at);

	

	
}
