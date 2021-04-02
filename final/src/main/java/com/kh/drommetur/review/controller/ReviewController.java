package com.kh.drommetur.review.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.drommetur.common.CommonException;
import com.kh.drommetur.common.Criteria;
import com.kh.drommetur.common.PageDTO;
import com.kh.drommetur.member.model.vo.Member;
import com.kh.drommetur.review.model.service.ReviewService;
import com.kh.drommetur.review.model.vo.Attach;
import com.kh.drommetur.review.model.vo.Review;
@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;

	@GetMapping("list.re")
	public String selectReviewList(Criteria cri,Model model) {
		
		System.out.println(cri);
		
		int listCount=reviewService.selectReviewListCount(cri);
		
		
		
		ArrayList<Review> list=reviewService.selectReviewList(cri);
		
		
		
		model.addAttribute("list", list);
		model.addAttribute("page",new PageDTO(listCount,cri));
		
		
		
		return "review/reviewList";
		
	}
	
	@GetMapping("mylist.re")
	public String selectMyReviewList(Criteria cri) {
		
		
		
		return "member/myPageReview";
		
	}
	
	@GetMapping("enrollForm.re")
	public String showEnrollForm(@ModelAttribute("cri") Criteria cri) {
		System.out.println(cri);
		return "review/reviewEnrollForm";
		
	}
	
	@GetMapping("select.re")
	public String selectReview(@ModelAttribute("cri") Criteria cri,int reviewNo,Model model) throws CommonException {
		
		Review review=reviewService.selectReview(reviewNo);
		List<Attach> attachList=reviewService.selectReviewAttachList(reviewNo);
		System.out.println(review);
		System.out.println(attachList);
		
		if(review!=null && attachList!=null) {
			
			model.addAttribute("review", review);
			model.addAttribute("attachList", attachList);
			
			return "review/reviewDetail";
			
			
		}else {
			
			throw new CommonException("리뷰 조회에 실패하였습니다.");
		}
		
	}
	
	@PostMapping("insert.re")
	public String insertReview( Criteria cri ,Review review,@RequestParam(name="uploadFiles",required=false ) MultipartFile[] uploadFiles, HttpSession session,HttpServletRequest request) throws CommonException, IllegalStateException, IOException {
		
		List<Attach> list=new ArrayList<Attach>();
		
		String path=session.getServletContext().getRealPath("resources/uploadFiles/");
		String folder=getFolder();
		
		File uploadPath=new File(path,folder);
		int count=0;
		
		System.out.println(uploadPath.getPath());
		
		if(!uploadPath.exists()) {
			
			uploadPath.mkdirs();
		}
		
		
		System.out.println(uploadFiles.length);
		
		for(MultipartFile uploadFile : uploadFiles) {
			
			if(!uploadFile.getOriginalFilename().equals("")) {
				Attach attach =new Attach();
				UUID uuid=UUID.randomUUID();
				
				String origin=uploadFile.getOriginalFilename();
				String change=uuid+"_"+uploadFile.getOriginalFilename();
				File saveFile=new File(uploadPath,change);
				
				attach.setAttachOrigin(origin);
				attach.setAttachChange(change);
				attach.setAttachPath("resources/uploadFiles/"+folder);
				
				System.out.println(attach);
				list.add(attach);
				
				uploadFile.transferTo(saveFile);
				count++;
			}
			
			
		}
		
		
		
		Member loginUser=(Member)session.getAttribute("loginUser");
		
		review.setMemNo(loginUser.getMemberNo());
		
		review.setAttachCount(count);
		
		
		int result=reviewService.insertReview(review,list);
		
		if(result>0) {	
			
			session.setAttribute("msg", "리뷰가 등록되었습니다.");
			
			
			
			
			return "redirect:/list.re"+cri.getListLink();
			
		}else {
			
			throw new CommonException("리뷰 등록에 실패하였습니다.");
			
		}
	}
	
	public String getFolder() {
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		
		Date date =new Date();
		
		String str=sdf.format(date);
		
		return str.replace("-",File.separator);
		
		
	}
	
	
	
	
}
