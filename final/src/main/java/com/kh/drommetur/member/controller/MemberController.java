package com.kh.drommetur.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.drommetur.common.CommonException;
import com.kh.drommetur.member.model.service.MemberService;
import com.kh.drommetur.member.model.vo.Member;

@SessionAttributes("loginUser")

@Controller
public class MemberController {
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Autowired // 빈 스캐닝을 통해 인터페이스를 구현한 클래스 중에 Service로 등록되어있는 빈을 찾아서 자동으로 생성 후 주입
	private MemberService memberService;
		
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
	
	@RequestMapping("pwdUpdate.mem")
	public String pwdChange() {
		return "member/memberPwdChange";
	}
	
	@RequestMapping("deleteForm.mem")
	public String memberDelete() {
		return "member/memberDelete";
	}
	
	@ResponseBody
	@RequestMapping("idCheck.me")
	public String idCheck(String memberId) throws Exception {
		int count = memberService.idCheck(memberId);
		
		return String.valueOf(count);
	}
	
	@RequestMapping("insert.mem")
	public String insertMember(@ModelAttribute Member m, @RequestParam("post") String post,
			@RequestParam("address1") String address1, @RequestParam("address2") String address2, HttpSession session)
			throws Exception {

		m.setAddress(post + "/" + address1 + "/" + address2);

		String encPwd = bCryptPasswordEncoder.encode(m.getMemberPwd());
		
		m.setMemberPwd(encPwd);
		
		int result = memberService.insertMember(m);

		if (result > 0) {
			session.setAttribute("msg", "회원가입성공!!");
			return "redirect:/";
		} else {
			return "common/errorPage";
		}
	}
	
	@RequestMapping(value = "login.mem", method = RequestMethod.POST)
	public String loginMember(Member m, Model model) {
		Member loginUser;
		
		try {
			loginUser = memberService.loginMember(bCryptPasswordEncoder, m);

			model.addAttribute("loginUser", loginUser);
			return "redirect:/";

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			model.addAttribute("msg", "로그인을 실패하였습니다.");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("logout.mem")
	public String logout(SessionStatus status) {

		status.setComplete();// 상태관리
		return "redirect:/";
	}

	

	@RequestMapping("myPage.mem")
	public String myPageHome() {
		return "member/myPageHome";
	}
	
	@RequestMapping("travel.mem")
	public String myPageTravel() {
		return "member/myPageTravel";
	}
	
	@RequestMapping("taste.mem")
	public String myPageTaste() {
		return "member/myPageTaste";
	}
	
	@RequestMapping("accommodation.mem")
	public String myPageaccommodation() {
		return "member/myPageAccommodation";
	}
	
	@RequestMapping("activity.mem")
	public String myPageActivity() {
		return "member/myPageActivity";
	}
	
	@RequestMapping("reply.mem")
	public String myPageReply() {
		return "member/myPageReply";
	}
	
	@RequestMapping("info.mem")
	public String myPageInfo() {
		return "member/myPageProfile";
	}
	
	@RequestMapping("infoUpdate.mem")
	public String myPageInfoUpdate() {
		return "member/profileUpdate";
	}
	
	@RequestMapping("profileUpdate.me")
	public String updateMember(@ModelAttribute Member m, @RequestParam("post") String post,
			@RequestParam("address1") String address1, @RequestParam("address2") String address2, Model model)
			throws Exception {

		m.setAddress(post + "/" + address1 + "/" + address2);
		int result = memberService.updateMember(m);

		if (result > 0) {
			model.addAttribute("loginUser", m);
			return "member/myPageHome";
		} else {
			throw new CommonException("회원정보 수정에 실패하였습니다.");
		}
	}
	
}
