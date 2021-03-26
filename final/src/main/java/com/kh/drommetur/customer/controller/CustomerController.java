package com.kh.drommetur.customer.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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

	@RequestMapping("insert.cu")
	public String insertQuestion(@Param("memberNo") Integer memberNo,Question q, Model model) throws Exception {

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
