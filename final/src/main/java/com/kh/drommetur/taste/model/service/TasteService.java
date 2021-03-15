package com.kh.drommetur.taste.model.service;


import java.util.ArrayList;

import com.kh.drommetur.taste.model.vo.PageInfo;
import com.kh.drommetur.taste.model.vo.Taste;


public interface TasteService {

	int updateIncreaseCount(int placeNo);

	Taste selectBoard(int placeNo);

	int selectListCount();

	ArrayList<Taste> selectList(PageInfo pi);
}
