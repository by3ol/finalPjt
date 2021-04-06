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

	public int idCheck(SqlSessionTemplate sqlSession, String memberId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.idCheck", memberId);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.updateMember", m);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, String memberId) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.deleteMember", memberId);
	}

	public int memberChangePwd(SqlSessionTemplate sqlSession, Member loginUser) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.memberChangePwd", loginUser);
	}

}
