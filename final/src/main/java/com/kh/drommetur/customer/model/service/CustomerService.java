package com.kh.drommetur.customer.model.service;


import java.util.ArrayList;

import com.kh.drommetur.customer.model.vo.Notice;
import com.kh.drommetur.customer.model.vo.Question;
import com.kh.drommetur.taste.model.vo.PageInfo;

public interface CustomerService {
	
	//질문
	int insertQuestion(Question question);

	ArrayList<Question> selectQuestionList(PageInfo pi);
	
	Question selectQuestion(int questionNo);

	int deleteQuestion(int questionNo);
	

	int selectQuestionListCount();

	
	
	
	//공지
	int selectNoticeListCount();

	ArrayList<Notice> selectNoticeList(PageInfo pi);

	int insertNotice(Notice notice);


	Notice selectNotice(int noticeNo);

	int deleteNotice(int noticeNo);

	int updateNotice(Notice notice);

	


	




}
