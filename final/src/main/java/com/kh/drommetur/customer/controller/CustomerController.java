package com.kh.drommetur.customer.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.drommetur.customer.model.service.CustomerService;
import com.kh.drommetur.customer.model.vo.Notice;

import com.kh.drommetur.customer.model.vo.Question;
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

	@RequestMapping("customerreport.cu")
	public String customerreport() {
		return "customer/customerreport";
	}

	@RequestMapping("customersaylist.cu")
	public String customersaylist() {
		return "customer/customersaylist";
	}

	@RequestMapping("customernoticedetail.cu")
	public String customerdetail() {
		return "customer/customernoticedetail";
	}

	@RequestMapping("insert.cu")
	public String insertQuestion(Question q, HttpServletRequest request, Model model) throws Exception {

		int result = customerservice.insertQuestion(q);

		if (result > 0) {
			return "redirect:customercenter";
		} else {
			throw new Exception("문의글 작성에 실패하였습니다.");
		}
	}

	/*
	 * @RequestMapping("detail.cu") public ModelAndView selectquestion(int
	 * questionNo, ModelAndView mv) throws Exception {
	 * 
	 * int result = customerservice.updateQuestion(questionNo);
	 * 
	 * if (result > 0) { Question q = customerservice.selectQuestion(questionNo);
	 * mv.addObject("q", q).setViewName("board/customersaydetail"); } else { throw
	 * new Exception("문의 상세조회에 실패 하였습니다."); } return mv; }
	 */
	
	@RequestMapping("noticelist.bo")
	public String selectList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			Model model) {

		
		int listCount = customerservice.selectListCount();

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);

		ArrayList<Notice> list = customerservice.selectList(pi);

		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "board/customernoticelist";
	}
}
