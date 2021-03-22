package com.kh.drommetur.customer.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.drommetur.customer.model.dao.CustomerDao;
import com.kh.drommetur.customer.model.vo.Notice;
import com.kh.drommetur.customer.model.vo.Question;
import com.kh.drommetur.taste.model.vo.PageInfo;

@Service("customerService")
public class CustomerServiceImpl implements CustomerService{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private CustomerDao customerDao;
	
	
	@Override
	public int insertQuestion(Question q) {
		return customerDao.insertQuestion(sqlSession, q);
	}


	@Override
	public int selectQuestion(int questionNo) {
		return customerDao.selectQuestion(sqlSession, questionNo);
	}


	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return customerDao.selectListCount(sqlSession);
	}


	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		// TODO Auto-generated method stub
		return customerDao.selectList(sqlSession, pi);
	}


	@Override
	public int insertNotice(Notice n) {
		// TODO Auto-generated method stub
		return customerDao.insertNotice(sqlSession, n);
	}
	
	
	
}
