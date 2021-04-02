package com.kh.drommetur.customer.model.dao;


import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.drommetur.customer.model.vo.Notice;
import com.kh.drommetur.customer.model.vo.Question;
import com.kh.drommetur.taste.model.vo.PageInfo;

@Repository("customerDao")
public class CustomerDao {

	// 문의글
	public int insertQuestion(SqlSessionTemplate sqlSession, Question question) {
		// TODO Auto-generated method stub
		return sqlSession.insert("customerMapper.insertQuestion", question);
	}

	public ArrayList<Question> selectQuestionList(SqlSessionTemplate sqlSession, PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() -1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("customerMapper.selectquestionList", null, rowBounds);
	}

	public int selectQuestionListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("customerMapper.selectQuestionListCount");
	}

	public Question selectQuestion(SqlSessionTemplate sqlSession, int questionNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("customerMapper.selectQuestion", questionNo);
	}

	public int deleteQuestion(SqlSessionTemplate sqlSession, int questionNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("customerMapper.deleteQuestion", questionNo);
	}

	

	
	//답변글
	
	
	//공지글
	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		// TODO Auto-generated method stub
		return sqlSession.insert("customerMapper.insertNotice", n);
	}

	public ArrayList<Notice> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() -1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("customerMapper.selectNoticeList", null, rowBounds);
	}

	public Notice selectNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		// TODO Auto-generated method stub
		return null;
	}

	public int deleteNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateNotice(SqlSessionTemplate sqlSession, Notice notice) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int selectNoticeListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return 0;
	}
}
