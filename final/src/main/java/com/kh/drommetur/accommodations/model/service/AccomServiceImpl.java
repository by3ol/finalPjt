package com.kh.drommetur.accommodations.model.service;


import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.drommetur.accommodations.model.dao.AccomDao;
import com.kh.drommetur.accommodations.model.vo.Accommodations;
import com.kh.drommetur.accommodations.model.vo.PageInfo;
import com.kh.drommetur.place.model.vo.Search;



@Service("accomService")
public class AccomServiceImpl implements AccomService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AccomDao accomDao;
	@Override
	public int updateIncreaseCount(int placeNo) {
		// TODO Auto-generated method stub
		return accomDao.updateIncreaseCount(sqlSession, placeNo);
	}
	@Override
	public Accommodations selectBoard(int placeNo) {
		// TODO Auto-generated method stub
		return accomDao.selectBoard(sqlSession, placeNo);
	}
	@Override
	public int selectListCount() {
		return accomDao.selectListCount(sqlSession);
		
	}
	@Override
	public ArrayList<Accommodations> selectList(PageInfo pi) {
		return accomDao.selectList(sqlSession, pi);
	}
	@Override
	public int selectListCountca(Accommodations ac) {
		return accomDao.selectListCountca(sqlSession,ac);
		
	}
	@Override
	public ArrayList<Accommodations> selectListca(PageInfo pi,Accommodations ac) {
		// TODO Auto-generated method stub
		
		return accomDao.selectListca(sqlSession, pi,ac);
	}
	@Override
	public ArrayList<Accommodations> selectListre(PageInfo pi, Accommodations ac) {
		// TODO Auto-generated method stub
		return accomDao.selectListre(sqlSession, pi, ac);
	}
	@Override
	public ArrayList<Accommodations> selectListSearch(PageInfo pi, Search search) {
		// TODO Auto-generated method stub
		return accomDao.selectListSearch(sqlSession,pi,search);
	}
	@Override
	public ArrayList<Accommodations> selectListAll(PageInfo pi, Accommodations ac) {
		// TODO Auto-generated method stub
		return accomDao.selectListAll(sqlSession, pi, ac);
	}
	@Override
	public int updateIncreaseScoreCount(int placeNo) {
		// TODO Auto-generated method stub
		return accomDao.updateIncreaseScoreCount(sqlSession, placeNo);
	}
	@Override
	public int updateTotalScore(Accommodations ac) {
		// TODO Auto-generated method stub
		return accomDao.updateTotalScore(sqlSession, ac);
	}
	@Override
	public int updateScore(int placeNo) {
		// TODO Auto-generated method stub
		return accomDao.updateScore(sqlSession, placeNo);
	}
	
}



