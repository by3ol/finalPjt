package com.kh.drommetur.customer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.drommetur.customer.model.service.CustomerService;

@Controller
public class CustomerController {

	@Autowired
	private CustomerService customerservice;
	
	
	
}
