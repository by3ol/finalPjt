package com.kh.drommetur.attraction.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.drommetur.attraction.model.vo.Attraction;
import com.kh.drommetur.attraction.model.vo.PageInfo;
import com.kh.drommetur.place.model.vo.Search;

@Repository
public class AttractionDao {

	public int updateIncreaseCount(SqlSessionTemplate sqlSession, int placeNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("attractionMapper.updateIncreaseCount",placeNo);
	}

	public Attraction selectBoard(SqlSessionTemplate sqlSession, int placeNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("attractionMapper.selectBoard",placeNo);
	}

	public int selectListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("attractionMapper.selectListCount");
	}

	public ArrayList<Attraction> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		// TODO Auto-generated method stub
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("attractionMapper.selectList",null,rowBounds);
	}

	public int selectListCountca(SqlSessionTemplate sqlSession,Attraction at) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("attractionMapper.selectListCountca",at);
	}

	
	public ArrayList<Attraction> selectListca(SqlSessionTemplate sqlSession, PageInfo pi,Attraction at) {
		// TODO Auto-generated method stub
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("attractionMapper.selectListca",at,rowBounds);
	}

	public ArrayList<Attraction> selectListre(SqlSessionTemplate sqlSession, PageInfo pi, String placeCategory) {
		// TODO Auto-generated method stub
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("attractionMapper.selectListre",placeCategory ,rowBounds);
	}

	public ArrayList<Attraction> selectListSearch(SqlSessionTemplate sqlSession, PageInfo pi, Search search) {
		// TODO Auto-generated method stub
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("attractionMapper.selectListSearch",search, rowBounds);
	}

	public ArrayList<Attraction> selectListAll(SqlSessionTemplate sqlSession, PageInfo pi, Attraction at) {
		// TODO Auto-generated method stub
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("attractionMapper.selectListAll", at, rowBounds);
	}

	public int updateIncreaseScoreCount(SqlSessionTemplate sqlSession, int placeNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("attractionMapper.updateIncreaseScoreCount", placeNo);
	}

	public int updateTotalScore(SqlSessionTemplate sqlSession, Attraction at) {
		// TODO Auto-generated method stub
		return sqlSession.update("attractionMapper.updateTotalScore", at);
	}

	public int updateScore(SqlSessionTemplate sqlSession, int placeNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("attractionMapper.updateScore", placeNo);
	}

	
}
