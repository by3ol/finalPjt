package com.kh.drommetur.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.drommetur.member.model.dao.MemberDao;
import com.kh.drommetur.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private MemberDao memberDao;
	
	@Override
	public int insertMember(Member m) throws Exception {
		// TODO Auto-generated method stub
		int result = memberDao.insertMember(sqlSession, m);
		return result;
	}

	@Override
	public Member loginMember(BCryptPasswordEncoder bCryptPasswordEncoder, Member m) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(m);
		
		Member loginUser = memberDao.loginUser(sqlSession, m);
		if(loginUser == null) {
			throw new Exception("loginUser 확인하세요");
		}
		
		if(!bCryptPasswordEncoder.matches(m.getMemberPwd(), loginUser.getMemberPwd())) {
			throw new Exception("비밀번호가 다릅니다!");
		}
		
		return loginUser;
	}

	@Override
	public Member loginMember(Member m) throws Exception {
		// TODO Auto-generated method stub
		Member loginUser = memberDao.loginUser(sqlSession, m);

		return loginUser;
	}

	@Override
	public int idCheck(String memberId) throws Exception {
		// TODO Auto-generated method stub
		return memberDao.idCheck(sqlSession, memberId);
	}


	@Override
	public int updateMember(Member m) throws Exception {
		// TODO Auto-generated method stub
		return memberDao.updateMember(sqlSession, m);
	}

	@Override
	public int deleteMember(String memberId) throws Exception {
		// TODO Auto-generated method stub
		return memberDao.deleteMember(sqlSession, memberId);
	}

	@Override
	public int memberChangePwd(Member loginUser) throws Exception {
		// TODO Auto-generated method stub
		return memberDao.memberChangePwd(sqlSession, loginUser);
	}
	
	
}
