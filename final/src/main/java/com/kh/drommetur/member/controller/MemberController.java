package com.kh.drommetur.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.drommetur.member.model.service.MemberService;

@Controller
public class MemberController {
	
	
	@RequestMapping("loginFrom.mem")
	public String loginForm() {
		return "member/memberLoginForm";
	}
	
	@RequestMapping("joinChoose.mem")
	public String joinChoose() {
		return "member/memberJoinChoose";
	}
	
	@RequestMapping("signUpFrom.mem")
	public String signUpForm() {
		return "member/memberSignUpForm";
	}
}
