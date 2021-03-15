package com.kh.drommetur.customer.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.drommetur.customer.model.service.CustomerService;
import com.kh.drommetur.customer.model.vo.Question;

@Controller
public class CustomerController {

	@Autowired
	private CustomerService customerservice;
	
	@RequestMapping("insert.cu")
	public String insertQuestion(Question q, HttpServletRequest request, Model model) throws Exception {
		
		int result = customerservice.insertQuestion(q);
		
		if(result >0) {
			return "customer";
		}else {
			throw new Exception("게시물 작성에 실패하였습니다.");
		}
	}
}
