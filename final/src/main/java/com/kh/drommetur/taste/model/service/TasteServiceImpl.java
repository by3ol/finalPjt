package com.kh.drommetur.taste.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.drommetur.taste.model.dao.TasteDao;

import com.kh.drommetur.taste.model.vo.Taste;

@Service("tasteService")
public class TasteServiceImpl implements TasteService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private TasteDao tasteDao;
	@Override
	public int updateIncreaseCount(int placeNo) {
		// TODO Auto-generated method stub
		return tasteDao.updateIncreaseCount(sqlSession, placeNo);
	}
	@Override
	public Taste selectBoard(int placeNo) {
		// TODO Auto-generated method stub
		return tasteDao.selectBoard(sqlSession, placeNo);
	}
	
}



