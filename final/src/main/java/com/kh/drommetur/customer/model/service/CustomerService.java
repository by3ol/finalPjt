package com.kh.drommetur.customer.model.service;

import java.util.ArrayList;

import com.kh.drommetur.customer.model.vo.Notice;
import com.kh.drommetur.customer.model.vo.Question;
import com.kh.drommetur.taste.model.vo.PageInfo;

public interface CustomerService {

	int insertQuestion(Question q);

	int selectQuestion(int questionNo);

	int selectListCount();

	ArrayList<Notice> selectList(PageInfo pi);

	int insertNotice(Notice n);

	int updateIncreaseCount(int noticeNo);

	Notice selectNotice(int noticeNo);

	int deleteNotice(int noticeNo);

	int updateNotice(Notice n);

	


	/*
	 * Question selectQuestion(int questionNo);
	 * 
	 * int updateQuestion(int questionNo);
	 */

}
