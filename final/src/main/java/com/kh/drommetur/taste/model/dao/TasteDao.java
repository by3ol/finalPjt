package com.kh.drommetur.taste.model.dao;




import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;



import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.drommetur.taste.model.vo.PageInfo;
import com.kh.drommetur.taste.model.vo.Taste;
@Repository
public class TasteDao {

	public int updateIncreaseCount(SqlSessionTemplate sqlSession, int placeNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("tasteMapper.updateIncreaseCount",placeNo);
	}

	public Taste selectBoard(SqlSessionTemplate sqlSession, int placeNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("tasteMapper.selectBoard",placeNo);
	}

	public int selectListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("tasteMapper.selectListCount");
	}

	public ArrayList<Taste> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		// TODO Auto-generated method stub
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("tasteMapper.selectList",null,rowBounds);
	}
}
