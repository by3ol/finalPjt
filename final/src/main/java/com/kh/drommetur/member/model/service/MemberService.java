package com.kh.drommetur.member.model.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.kh.drommetur.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member m) throws Exception;

	Member loginMember(Member m) throws Exception;
	
	Member loginMember(BCryptPasswordEncoder bCryptPasswordEncoder, Member m) throws Exception;

	int idCheck(String memberId) throws Exception;

	int updateMember(Member m) throws Exception;

	int deleteMember(String memberId) throws Exception;

	int memberChangePwd(Member loginUser) throws Exception;

}
