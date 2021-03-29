package com.kh.drommetur.customer.model.service;


import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.drommetur.customer.mapper.CustomerMapper;
import com.kh.drommetur.customer.model.dao.CustomerDao;
import com.kh.drommetur.customer.model.vo.Notice;
import com.kh.drommetur.customer.model.vo.Question;
import com.kh.drommetur.taste.model.vo.PageInfo;
import com.kh.drommetur.travel.mapper.TravelMapper;

import lombok.Setter;

@Service("customerService")
public class CustomerServiceImpl implements CustomerService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Setter(onMethod_=@Autowired)
	private CustomerMapper customerMapper;
	
	
	//////////////////문의글
	@Override
	public int insertQuestion(Question question, int memberNo) {

		int result = customerMapper.insertQuestion(question, memberNo);
		return result;
	}



	@Override
	public ArrayList<Question> selectquestionList() {
		// TODO Auto-generated method stub
		return (ArrayList)customerMapper.selectquestionList();
	}



	@Override
	public int selectQuestion(int questionNo) {
		// TODO Auto-generated method stub
		return customerMapper.selectquestion(questionNo);
	}


	
	
	/////////////////////공지글
	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int insertNotice(Notice n) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int updateIncreaseCount(int noticeNo) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public Notice selectNotice(int noticeNo) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int deleteNotice(int noticeNo) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int updateNotice(Notice n) {
		// TODO Auto-generated method stub
		return 0;
	}



	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return 0;
	}



}
