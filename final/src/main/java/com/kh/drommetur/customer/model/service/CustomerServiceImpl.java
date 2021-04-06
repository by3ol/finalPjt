package com.kh.drommetur.customer.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.drommetur.customer.model.dao.CustomerDao;
import com.kh.drommetur.customer.model.vo.Answer;
import com.kh.drommetur.customer.model.vo.Notice;
import com.kh.drommetur.customer.model.vo.Question;
import com.kh.drommetur.taste.model.vo.PageInfo;

@Service("customerService")
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private CustomerDao customerDao;

	////////////////// 문의글
	@Override
	public int insertQuestion(Question question) {
		// TODO Auto-generated method stub
		return customerDao.insertQuestion(sqlSession, question);
	}

	@Override
	public ArrayList<Question> selectQuestionList(PageInfo pi) {
		// TODO Auto-generated method stub
		return customerDao.selectQuestionList(sqlSession, pi);
	}

	@Override
	public int selectQuestionListCount() {
		// TODO Auto-generated method stub
		return customerDao.selectQuestionListCount(sqlSession);
	}

	@Override
	public Question selectQuestion(int questionNo) {
		return customerDao.selectQuestion(sqlSession, questionNo);
	}

	@Override
	public int deleteQuestion(int questionNo) {
		// TODO Auto-generated method stub
		return customerDao.deleteQuestion(sqlSession, questionNo);
	}


	///////////////////// 공지글
	@Override
	public int insertNotice(Notice notice) {
		// TODO Auto-generated method stub
		return customerDao.insertNotice(sqlSession, notice);
	}

	@Override
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		// TODO Auto-generated method stub
		return customerDao.selectNoticeList(sqlSession, pi);
	}

	
	@Override
	public Notice selectNotice(int noticeNo) {
		// TODO Auto-generated method stub
		return customerDao.selectNotice(sqlSession, noticeNo);
	}

	@Override
	public int deleteNotice(int noticeNo) {
		// TODO Auto-generated method stub
		return customerDao.deleteNotice(sqlSession, noticeNo);
	}

	@Override
	public int updateNotice(Notice notice) {
		// TODO Auto-generated method stub
		return customerDao.updateNotice(sqlSession, notice);
	}

	@Override
	public int selectNoticeListCount() {
		// TODO Auto-generated method stub
		return customerDao.selectNoticeListCount(sqlSession);
	}

	

}
