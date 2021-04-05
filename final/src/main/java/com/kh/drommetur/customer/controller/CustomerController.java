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
		return "redirect:questionlist.cu";
	}

	@RequestMapping("customernotice.cu")
	public String customernotice() {
		return "redirect:noticelist.cu";
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

	@RequestMapping("insertquestion.cu")

	public String insertQuestion(Question question, HttpSession session) throws Exception {

		int result = customerservice.insertQuestion(question);

		if (result > 0) {
			return "redirect:questionlist.cu";
		} else {
			throw new Exception("문의글 등록에 실패하였습니다.");
		}
	}

	@RequestMapping("questionlist.cu")
	public String selectQuestionList(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, Model model)
			throws Exception {

		
		
		int listCount = customerservice.selectQuestionListCount();

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);

		ArrayList<Question> list = customerservice.selectQuestionList(pi);

		model.addAttribute("pi", pi);
		if (list != null) {
			model.addAttribute("list", list);

		} else {
			throw new Exception("불러오기 실패");
		}

		return "customer/customersaylist";

	}                  

	@RequestMapping("detailquestion.cu")
	public ModelAndView selectQuestion(int questionNo, ModelAndView mv) throws Exception {

		Question q = customerservice.selectQuestion(questionNo);

		mv.addObject("q", q).setViewName("customer/customersaydatail");

		return mv;
	}

	@RequestMapping("deletequestion.cu")
	public String deleteBoard(int questionNo) throws Exception {

		int result = customerservice.deleteQuestion(questionNo);

		if (result > 0) {

			return "redirect:questionlist.cu";
		} else {
			throw new Exception("게시물 삭제에 실패 하였습니다.");

		}
	}

	/////////////////////////////// 공지

	@RequestMapping("noticeEnroll.cu")
	public String enrollForm() {
		return "customer/customernoticeEnroll";
	}

	@RequestMapping("insertNotice.cu")
	public String insertNotice(Notice notice, Model model) throws Exception {

		int result = customerservice.insertNotice(notice);
		model.addAttribute("n", notice);
		if (result > 0) {
			return "redirect:noticelist.cu";
		} else {
			throw new Exception("공지글 작성에 실패했습니다.");
		}

	}

	@RequestMapping("noticelist.cu")
	public String selectNoticeList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			Model model) {

		int listCount = customerservice.selectNoticeListCount();

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);

		ArrayList<Notice> list = customerservice.selectNoticeList(pi);

		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "customer/customernotice";
	}

	@RequestMapping("detailNotice.cu")
	public ModelAndView selectNotice(int noticeNo, ModelAndView mv) throws Exception {

		Notice n = customerservice.selectNotice(noticeNo);
		mv.addObject("n", n).setViewName("customer/customernoticedetail");

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
	public ModelAndView updateNotice(Notice notice, ModelAndView mv, HttpServletRequest request) throws Exception {

		int result = customerservice.updateNotice(notice);

		if (result > 0) {
			mv.addObject("noticeNo", notice.getNoticeNo()).setViewName("redirect:detailNotice.cu");

		} else {
			throw new Exception("게시물 상세조회에 실패 하였습니다.");

		}

		return mv;

	}
}
