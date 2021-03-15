package com.kh.drommetur.customer.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.drommetur.customer.model.vo.Question;

@Repository("boardDao")
public class CustomerDao {

	public int insertQuestion(SqlSessionTemplate slqSession, Question q) {
		// TODO Auto-generated method stub
		return slqSession.insert("customerMapper.insertQuestion", q);
	}

}
