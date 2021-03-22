package com.kh.drommetur.taste.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.drommetur.place.model.vo.Search;
import com.kh.drommetur.taste.model.dao.TasteDao;
import com.kh.drommetur.taste.model.vo.PageInfo;
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
	@Override
	public int selectListCount() {
		return tasteDao.selectListCount(sqlSession);
		
	}
	@Override
	public ArrayList<Taste> selectList(PageInfo pi) {
		return tasteDao.selectList(sqlSession, pi);
	}
	@Override
	public int selectListCountca(Taste t) {
		return tasteDao.selectListCountca(sqlSession,t);
		
	}
	@Override
	public ArrayList<Taste> selectListca(PageInfo pi,Taste t) {
		// TODO Auto-generated method stub
		
		return tasteDao.selectListca(sqlSession, pi,t);
	}
	@Override
	public ArrayList<Taste> selectListre(PageInfo pi, String placeCategory) {
		// TODO Auto-generated method stub
		return tasteDao.selectListre(sqlSession, pi, placeCategory);
	}
	@Override
	public ArrayList<Taste> selectListSearch(PageInfo pi, Search search) {
		// TODO Auto-generated method stub
		return tasteDao.selectListSearch(sqlSession,pi,search);
	}
	@Override
	public ArrayList<Taste> selectListAll(PageInfo pi, Taste t) {
		// TODO Auto-generated method stub
		return tasteDao.selectListAll(sqlSession, pi, t);
	}
	@Override
	public int updateIncreaseScoreCount(int placeNo) {
		// TODO Auto-generated method stub
		return tasteDao.updateIncreaseScoreCount(sqlSession, placeNo);
	}
	@Override
	public int updateTotalScore(Taste t) {
		// TODO Auto-generated method stub
		return tasteDao.updateTotalScore(sqlSession, t);
	}
	@Override
	public int updateScore(int placeNo) {
		// TODO Auto-generated method stub
		return tasteDao.updateScore(sqlSession, placeNo);
	}
	
}



