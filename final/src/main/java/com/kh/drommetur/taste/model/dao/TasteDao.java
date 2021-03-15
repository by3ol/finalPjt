package com.kh.drommetur.taste.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
}





