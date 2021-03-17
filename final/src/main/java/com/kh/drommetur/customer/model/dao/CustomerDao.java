package com.kh.drommetur.customer.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.drommetur.customer.model.vo.Question;

@Repository("boardDao")
public class CustomerDao {

	public int insertQuestion(SqlSessionTemplate sqlSession, Question q) {
		// TODO Auto-generated method stub
		return sqlSession.insert("customerMapper.insertQuestion", q);
	}

	public int selectQuestion(SqlSessionTemplate sqlSession, int questionNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("customerMapper.selectBoard", questionNo);
	}

}
