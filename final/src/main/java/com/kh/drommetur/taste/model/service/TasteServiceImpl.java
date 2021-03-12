package com.kh.drommetur.taste.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.drommetur.taste.model.dao.TasteDao;



@Service("boardService")
public class TasteServiceImpl implements TasteService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private	TasteDao tasteDao;
}