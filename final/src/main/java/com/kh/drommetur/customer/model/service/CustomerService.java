package com.kh.drommetur.customer.model.service;


import java.util.ArrayList;

import com.kh.drommetur.customer.model.vo.Notice;
import com.kh.drommetur.customer.model.vo.Question;
import com.kh.drommetur.taste.model.vo.PageInfo;

public interface CustomerService {
	
	//질문
	int insertQuestion(Question question, int memberNo);

	ArrayList<Question> selectquestionList();
	
	/*
	 * Question selectQuestion(int questionNo);
	 * 
	 * int updateQuestion(int questionNo);
	 */
	
	
	
	
	
	//공지
	int selectListCount();

	ArrayList<Notice> selectList(PageInfo pi);

	int insertNotice(Notice n);

	int updateIncreaseCount(int noticeNo);

	Notice selectNotice(int noticeNo);

	int deleteNotice(int noticeNo);

	int updateNotice(Notice n);

	int selectQuestion(int questionNo);




}
