package com.kh.drommetur.customer.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.drommetur.customer.model.dao.CustomerDao;
import com.kh.drommetur.customer.model.vo.Question;

@Service("customerService")
public class CustomerServiceImpl implements CustomerService{

	@Autowired
	private SqlSessionTemplate slqSession;

	@Autowired
	private CustomerDao customerDao;
	
	
	@Override
	public int insertQuestion(Question q) {
		// TODO Auto-generated method stub
		return customerDao.insertQuestion(slqSession, q);
	}
	
	
	
}
