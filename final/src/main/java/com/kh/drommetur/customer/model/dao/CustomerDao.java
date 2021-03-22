package com.kh.drommetur.customer.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.drommetur.customer.model.vo.Notice;
import com.kh.drommetur.customer.model.vo.Question;
import com.kh.drommetur.taste.model.vo.PageInfo;

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

	public int selectListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne("customerMapper.selectListCount");

	}

	public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() -1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("customerMapper.selectList", null, rowBounds);
	}



	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		// TODO Auto-generated method stub
		return sqlSession.insert("boardMapper.insertNotice",n);
	}
}
