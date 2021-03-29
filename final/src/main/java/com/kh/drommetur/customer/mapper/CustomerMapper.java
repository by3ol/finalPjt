package com.kh.drommetur.customer.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.drommetur.customer.model.vo.Question;
import com.kh.drommetur.taste.model.vo.PageInfo;

public interface CustomerMapper {

	int insertQuestion(@Param("question") Question question, @Param("memberNo") int memberNo);

	ArrayList<Question> selectquestionList();

	int selectListCount(int memberNo);

	int selectquestion(int questionNo);
}
