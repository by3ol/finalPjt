package com.kh.drommetur.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.drommetur.member.model.vo.Member;

@Repository("memberDao")
public class MemberDao {

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public Member loginUser(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		Member loginUser = sqlSession.selectOne("memberMapper.loginMember", m);
		System.out.println(loginUser);
		return loginUser;
	}

}
