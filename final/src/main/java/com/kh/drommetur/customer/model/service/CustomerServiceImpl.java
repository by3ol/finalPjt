package com.kh.drommetur.customer.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.drommetur.customer.model.dao.CustomerDao;
import com.kh.drommetur.customer.model.vo.Question;

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
	
	
	
}
