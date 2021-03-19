package com.kh.drommetur.customer.model.service;

import com.kh.drommetur.customer.model.vo.Question;

public interface CustomerService {

	int insertQuestion(Question q);

	Question selectQuestion(int questionNo);

	int updateQuestion(int questionNo);

}
