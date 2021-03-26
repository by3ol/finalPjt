package com.kh.drommetur.accommodations.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.drommetur.accommodations.model.vo.Accommodations;
import com.kh.drommetur.accommodations.model.vo.PageInfo;
import com.kh.drommetur.place.model.vo.Search;

@Repository
public class AccomDao {

	public int updateIncreaseCount(SqlSessionTemplate sqlSession, int placeNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("accomMapper.updateIncreaseCount",placeNo);
	}

	public Accommodations selectBoard(SqlSessionTemplate sqlSession, int placeNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("accomMapper.selectBoard",placeNo);
	}

	public int selectListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("accomMapper.selectListCount");
	}

	public ArrayList<Accommodations> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		// TODO Auto-generated method stub
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("accomMapper.selectList",null,rowBounds);
	}

	public int selectListCountca(SqlSessionTemplate sqlSession,Accommodations ac) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("accomMapper.selectListCountca",ac);
	}

	
	public ArrayList<Accommodations> selectListca(SqlSessionTemplate sqlSession, PageInfo pi,Accommodations ac) {
		// TODO Auto-generated method stub
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("accomMapper.selectListca",ac,rowBounds);
	}

	public ArrayList<Accommodations> selectListre(SqlSessionTemplate sqlSession, PageInfo pi, String placeCategory) {
		// TODO Auto-generated method stub
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("accomMapper.selectListre",placeCategory ,rowBounds);
	}

	public ArrayList<Accommodations> selectListSearch(SqlSessionTemplate sqlSession, PageInfo pi, Search search) {
		// TODO Auto-generated method stub
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("accomMapper.selectListSearch",search, rowBounds);
	}

	public ArrayList<Accommodations> selectListAll(SqlSessionTemplate sqlSession, PageInfo pi, Accommodations ac) {
		// TODO Auto-generated method stub
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("accomMapper.selectListAll", ac, rowBounds);
	}

	public int updateIncreaseScoreCount(SqlSessionTemplate sqlSession, int placeNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("accomMapper.updateIncreaseScoreCount", placeNo);
	}

	public int updateTotalScore(SqlSessionTemplate sqlSession, Accommodations ac) {
		// TODO Auto-generated method stub
		return sqlSession.update("accomMapper.updateTotalScore", ac);
	}

	public int updateScore(SqlSessionTemplate sqlSession, int placeNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("accomMapper.updateScore", placeNo);
	}

	
}
