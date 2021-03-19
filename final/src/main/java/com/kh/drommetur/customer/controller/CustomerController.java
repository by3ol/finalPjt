package com.kh.drommetur.customer.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.drommetur.customer.model.service.CustomerService;
import com.kh.drommetur.customer.model.vo.Question;

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

	@RequestMapping("customerdetail.cu")
	public String customerdetail() {
		return "customer/customerdetail1";
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

	@RequestMapping("detail.cu")
	public ModelAndView selectquestion(int questionNo, ModelAndView mv) throws Exception {

		int result = customerservice.updateQuestion(questionNo);

		if (result > 0) {
			Question q = customerservice.selectQuestion(questionNo);
			mv.addObject("q", q).setViewName("board/customersaydetail");
		} else {
			throw new Exception("문의 상세조회에 실패 하였습니다.");
		}
		return mv;
	}

}
