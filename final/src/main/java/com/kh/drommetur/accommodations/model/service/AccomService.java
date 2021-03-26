package com.kh.drommetur.accommodations.model.service;



import java.util.ArrayList;

import com.kh.drommetur.accommodations.model.vo.Accommodations;
import com.kh.drommetur.place.model.vo.Search;
import com.kh.drommetur.accommodations.model.vo.PageInfo;


public interface AccomService {

	int updateIncreaseCount(int placeNo);

	Accommodations selectBoard(int placeNo);

	int selectListCount();

	ArrayList<Accommodations> selectList(PageInfo pi);

	int selectListCountca(Accommodations ac);

	ArrayList<Accommodations> selectListca(PageInfo pi,Accommodations ac);

	

	ArrayList<Accommodations> selectListSearch(PageInfo pi, Search search);

	ArrayList<Accommodations> selectListAll(PageInfo pi, Accommodations ac);

	

	int updateIncreaseScoreCount(int placeNo);

	int updateTotalScore(Accommodations ac);

	int updateScore(int placeNo);

	ArrayList<Accommodations> selectListre(PageInfo pi, Accommodations ac);

	

	
}
