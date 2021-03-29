package com.kh.drommetur.review.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class ReviewController {

	@GetMapping("list.re")
	public String selectReviewList() {
		
		
		
		return "review/reviewList";
		
	}
	
	@GetMapping("mylist.re")
	public String selectMyReviewList() {
		
		
		
		return "member/myPageReview";
		
	}
	
}
