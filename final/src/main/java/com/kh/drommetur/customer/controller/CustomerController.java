package com.kh.drommetur.customer.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.drommetur.customer.model.service.CustomerService;
import com.kh.drommetur.customer.model.vo.Question;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.drommetur.common.CommonException;
import com.kh.drommetur.common.Criteria;
import com.kh.drommetur.common.PageDTO;
import com.kh.drommetur.customer.model.service.CustomerService;
import com.kh.drommetur.customer.model.vo.Notice;
import com.kh.drommetur.customer.model.vo.Question;
import com.kh.drommetur.member.model.vo.Member;
import com.kh.drommetur.taste.Pagination;
import com.kh.drommetur.taste.model.vo.PageInfo;
import com.kh.drommetur.travel.model.vo.Travel;




@Controller
public class CustomerController {

	@Autowired
	private CustomerService customerservice;

	@RequestMapping("customercenter.cu")
	public String customercenter() {
		return "customer/customercenter";
	}


	@RequestMapping("customersaylist.cu")
	public String customersaylist() {
		return "customer/customersaylist";
	}
	
	@RequestMapping("customernotice.cu")
	public String customernotice() {
		return "customer/customernotice";
	}
	
	@RequestMapping("customernoticedetail.cu")
	public String customernoticedetail() {
		return "customer/customernoticedetail";
	}
	
	@RequestMapping("customernoticeenroll.cu")
	public String customernoticeenroll() {
		return "customer/customernoticeenroll";
	}
	@RequestMapping("course")
	public String course() {
		return "course/course";
	}

	@RequestMapping(value="insert.cu", method=RequestMethod.POST, consumes="application/json")
	@ResponseBody
	public ResponseEntity<String> insertQuestion(@RequestBody Question question, HttpSession session) throws Exception {

		System.out.println(question);
		Member loginUser = (Member) session.getAttribute("loginUser");
		int result = customerservice.insertQuestion(question, loginUser.getMemberNo());
		
		return result>0 ? new ResponseEntity<>(HttpStatus.OK):new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	@RequestMapping("questionlist.cu")
	public String selectquestionList(Model model) {

		
		
	
		ArrayList<Question> list = customerservice.selectquestionList();

		model.addAttribute("list", list);
	
		return "customer/cusotmersaylist";
	}
	

	@RequestMapping("detail.cu")
	public ModelAndView selectQuestion(int questionNo, ModelAndView mv) throws Exception {

		int q = customerservice.selectQuestion(questionNo);

		if (q > 0) {
			
			mv.addObject("q", q).setViewName("customer/customersaydetail");
		} else {
			throw new Exception("게시물 상세조회에 실패 하였습니다.");
		}
		return mv;
	}
		
		
	
	
	///////////////////////////////공지

	@RequestMapping("noticelist.cu")
	public String selectList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			Model model) {

		int listCount = customerservice.selectListCount();

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);

		ArrayList<Notice> list = customerservice.selectList(pi);

		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "customer/customernotice";
	}

	@RequestMapping("noticeEnroll.cu")
	public String enrollForm() {
		return "customer/customernoticeEnroll";
	}

	@RequestMapping("insertNotice.cu")
	public String insertNotice(Notice n, Model model) throws Exception {

		int result = customerservice.insertNotice(n);
		model.addAttribute("n", n);
		if (result > 0) {
			return "customer/customernoticelist";
		} else {
			throw new Exception("공지글 작성에 실패했습니다.");
		}

	}

	@RequestMapping("detailNotice.cu")
	public ModelAndView selectNotice(int noticeNo, ModelAndView mv) throws Exception {

		int result = customerservice.updateIncreaseCount(noticeNo);

		if (result > 0) {
			Notice n = customerservice.selectNotice(noticeNo);
			mv.addObject("n", n).setViewName("customer/customerNoticeDetail");
		} else {
			throw new Exception("공지글 조회에 실패했습니다.");
		}
		return mv;
	}

	@RequestMapping("deleteNotice.cu")
	public String deleteNotice(int noticeNo, HttpServletRequest request, Model model) throws Exception {

		int result = customerservice.deleteNotice(noticeNo);

		if (result > 0) {
			return "redirect:noticelist.cu";
		} else {
			throw new Exception("공지글 삭제에 실패하였습니다.");
		}
	}

	@RequestMapping("updateForm.cu")
	public ModelAndView updateForm(int noticeNo, ModelAndView mv) {

		mv.addObject("n", customerservice.selectNotice(noticeNo)).setViewName("customer/customernoticeupdate");
		return mv;
	}

	@RequestMapping("updateNotice.cu")
	public ModelAndView updateNotice(Notice n, ModelAndView mv, HttpServletRequest request) throws Exception {

		int result = customerservice.updateNotice(n);

		if (result > 0) {
			mv.addObject("noticeNo", n.getNoticeNo()).setViewName("redirect:noticeDetail.cu");

		} else {
			throw new Exception("게시물 상세조회에 실패 하였습니다.");

		}

		return mv;



}
}
