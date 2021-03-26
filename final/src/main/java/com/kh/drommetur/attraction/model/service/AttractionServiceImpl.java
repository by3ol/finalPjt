package com.kh.drommetur.attraction.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.drommetur.attraction.model.dao.AttractionDao;
import com.kh.drommetur.attraction.model.vo.Attraction;
import com.kh.drommetur.attraction.model.vo.PageInfo;
import com.kh.drommetur.place.model.vo.Search;

@Service("attractionService")
public class AttractionServiceImpl implements AttractionService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AttractionDao attractionDao;
	@Override
	public int updateIncreaseCount(int placeNo) {
		// TODO Auto-generated method stub
		return attractionDao.updateIncreaseCount(sqlSession, placeNo);
	}
	@Override
	public Attraction selectBoard(int placeNo) {
		// TODO Auto-generated method stub
		return attractionDao.selectBoard(sqlSession, placeNo);
	}
	@Override
	public int selectListCount() {
		return attractionDao.selectListCount(sqlSession);
		
	}
	@Override
	public ArrayList<Attraction> selectList(PageInfo pi) {
		return attractionDao.selectList(sqlSession, pi);
	}
	@Override
	public int selectListCountca(Attraction at) {
		return attractionDao.selectListCountca(sqlSession,at);
		
	}
	@Override
	public ArrayList<Attraction> selectListca(PageInfo pi,Attraction at) {
		// TODO Auto-generated method stub
		
		return attractionDao.selectListca(sqlSession, pi,at);
	}
	@Override
	public ArrayList<Attraction> selectListre(PageInfo pi, String placeCategory) {
		// TODO Auto-generated method stub
		return attractionDao.selectListre(sqlSession, pi, placeCategory);
	}
	@Override
	public ArrayList<Attraction> selectListSearch(PageInfo pi, Search search) {
		// TODO Auto-generated method stub
		return attractionDao.selectListSearch(sqlSession,pi,search);
	}
	@Override
	public ArrayList<Attraction> selectListAll(PageInfo pi, Attraction at) {
		// TODO Auto-generated method stub
		return attractionDao.selectListAll(sqlSession, pi, at);
	}
	@Override
	public int updateIncreaseScoreCount(int placeNo) {
		// TODO Auto-generated method stub
		return attractionDao.updateIncreaseScoreCount(sqlSession, placeNo);
	}
	@Override
	public int updateTotalScore(Attraction at) {
		// TODO Auto-generated method stub
		return attractionDao.updateTotalScore(sqlSession, at);
	}
	@Override
	public int updateScore(int placeNo) {
		// TODO Auto-generated method stub
		return attractionDao.updateScore(sqlSession, placeNo);
	}
	
}



