package com.kh.drommetur.taste.model.service;


import java.util.ArrayList;

import com.kh.drommetur.place.model.vo.Search;
import com.kh.drommetur.taste.model.vo.PageInfo;



import com.kh.drommetur.taste.model.vo.Taste;


public interface TasteService {

	int updateIncreaseCount(int placeNo);

	Taste selectBoard(int placeNo);

	int selectListCount();

	ArrayList<Taste> selectList(PageInfo pi);

	int selectListCountca(Taste t);

	ArrayList<Taste> selectListca(PageInfo pi,Taste t);

	ArrayList<Taste> selectListre(PageInfo pi, String placeCategory);

	ArrayList<Taste> selectListSearch(PageInfo pi, Search search);

	ArrayList<Taste> selectListAll(PageInfo pi, Taste t);

	

	int updateIncreaseScoreCount(int placeNo);

	int updateTotalScore(Taste t);

	int updateScore(int placeNo);

	

	
}
