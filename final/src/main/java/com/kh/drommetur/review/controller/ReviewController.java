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
		
		cri.setFrom(1);
		
		int listCount=reviewService.selectReviewListCount(cri);
		
		
		
		ArrayList<Review> list=reviewService.selectReviewList(cri);
		
		
		
		model.addAttribute("list", list);
		model.addAttribute("page",new PageDTO(listCount,cri));
		
		
		
		return "review/reviewList";
		
	}
	
	@GetMapping("mylist.re")
	public String selectMyReviewList(Criteria cri,HttpSession session,Model model) {
		
		cri.setFrom(2);
		
		Member loginUser=(Member)session.getAttribute("loginUser");
		
		int listCount=reviewService.selectMyReviewListCount(cri,loginUser.getMemberNo());
		
		ArrayList<Review> list=reviewService.selectMyReviewList(cri,loginUser.getMemberNo());
		
		model.addAttribute("list", list);
		model.addAttribute("page",new PageDTO(listCount,cri));
		
		
		return "member/myPageReview";
		
	}
	
	@GetMapping("enrollForm.re")
	public String showEnrollForm(@ModelAttribute("cri") Criteria cri) {
	
		return "review/reviewEnrollForm";
		
	}
	
	@GetMapping("enrollFormWithPlace.re")
	public String showEnrollFormWithPlace(@ModelAttribute("placeNo") int placeNo, @ModelAttribute("placeName")String placeName) {
	
		return "review/reviewEnrollFormWithPlace";
		
	}
	
	@GetMapping("modifyForm.re")
	public String showModifyForm(@ModelAttribute("cri") Criteria cri,int reviewNo,Model model) throws CommonException {
	
		
		Review review=reviewService.selectReview(reviewNo);
		List<Attach> attachList=reviewService.selectReviewAttachList(reviewNo);
		
		
		if(review!=null && attachList!=null) {
			
			model.addAttribute("review", review);
			model.addAttribute("attachList", attachList);
			
			return "review/reviewModifyForm";
			
			
		}else {
			
			throw new CommonException("리뷰 조회에 실패하였습니다.");
		}
		
		
		
	}
	
	@GetMapping("select.re")
	public String selectReview(@ModelAttribute("cri") Criteria cri,int reviewNo,Model model) throws CommonException {
		
		Review review=reviewService.selectReview(reviewNo);
		List<Attach> attachList=reviewService.selectReviewAttachList(reviewNo);
		
		
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
		
		
		
		if(!uploadPath.exists()) {
			
			uploadPath.mkdirs();
		}
		
		
		for(MultipartFile uploadFile : uploadFiles) {
			
			if(!uploadFile.getOriginalFilename().equals("")) {
				Attach attach =new Attach();
				UUID uuid=UUID.randomUUID();
				
				String origin=uploadFile.getOriginalFilename();
				String end=uploadFile.getOriginalFilename().substring(uploadFile.getOriginalFilename().lastIndexOf("."));
				
				String change=uuid+end;
				File saveFile=new File(uploadPath,change);
				
				attach.setAttachOrigin(origin);
				attach.setAttachChange(change);
				attach.setAttachPath(folder+"/");
				
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
	
	@PostMapping("insertwithPlace.re")
	public String insertReviewWithPlace(  Review review,@RequestParam(name="uploadFiles",required=false ) MultipartFile[] uploadFiles, HttpSession session,HttpServletRequest request) throws CommonException, IllegalStateException, IOException {
		
		List<Attach> list=new ArrayList<Attach>();
		
		String path=session.getServletContext().getRealPath("resources/uploadFiles/");
		String folder=getFolder();
		
		File uploadPath=new File(path,folder);
		int count=0;
		
		
		
		if(!uploadPath.exists()) {
			
			uploadPath.mkdirs();
		}
		
		
		
		
		for(MultipartFile uploadFile : uploadFiles) {
			
			if(!uploadFile.getOriginalFilename().equals("")) {
				Attach attach =new Attach();
				UUID uuid=UUID.randomUUID();
				
				String origin=uploadFile.getOriginalFilename();
				String end=uploadFile.getOriginalFilename().substring(uploadFile.getOriginalFilename().lastIndexOf("."));
				
				String change=uuid+end;
				File saveFile=new File(uploadPath,change);
				
				attach.setAttachOrigin(origin);
				attach.setAttachChange(change);
				attach.setAttachPath(folder+"/");
				
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
			
			
			
			
			return "redirect:/list.re";
			
		}else {
			
			throw new CommonException("리뷰 등록에 실패하였습니다.");
			
		}
	}
	
	
	
	
	@PostMapping("update.re")
	public String updateReview(Criteria cri, Review review,@RequestParam(name="uploadFiles",required=false ) MultipartFile[] uploadFiles,@RequestParam(name="deleteFiles",required=false ) int[] deleteFiles,HttpSession session) throws IllegalStateException, IOException, CommonException {
		

		List<Attach> list=new ArrayList<Attach>();
		
		String path=session.getServletContext().getRealPath("resources/uploadFiles/");
		String folder=getFolder();
		
		File uploadPath=new File(path,folder);
		int count=0;
		
		
		
		if(!uploadPath.exists()) {
			
			uploadPath.mkdirs();
		}
		
		for(MultipartFile uploadFile : uploadFiles) {
			
			if(!uploadFile.getOriginalFilename().equals("")) {
				Attach attach =new Attach();
				UUID uuid=UUID.randomUUID();
				
				String origin=uploadFile.getOriginalFilename();
				String end=uploadFile.getOriginalFilename().substring(uploadFile.getOriginalFilename().lastIndexOf("."));

				String change=uuid+end;
				File saveFile=new File(uploadPath,change);
				
				attach.setAttachOrigin(origin);
				attach.setAttachChange(change);
				attach.setAttachPath(folder+"/");
				
				System.out.println(attach);
				list.add(attach);
				
				uploadFile.transferTo(saveFile);
				count++;
			}
			
			
		}
		
		int modifyAttachCount=(deleteFiles == null )?(review.getAttachCount()+count) : (review.getAttachCount()+count-deleteFiles.length);
		
		review.setAttachCount(modifyAttachCount);
		
		System.out.println(review);
		
		if(deleteFiles!=null) {
			List<Attach> attachDeleteList=reviewService.selectDeleteAttach(deleteFiles);
			
			int result=reviewService.updateReview(review,list,deleteFiles);
			
			if(result>0) {
				
				for(Attach attach : attachDeleteList) {
					File deleteFile=new File(path,attach.getAttachPath()+attach.getAttachChange());
					
					deleteFile.delete();
				
				
				
				}
				
				session.setAttribute("msg", "리뷰가 수정되었습니다.");
				
				if(cri.getFrom()==1) {
					return "redirect:/list.re"+cri.getListLink();
				}
					
					return "redirect:/mylist.re"+cri.getListLink();
				
				
				
				
			}else {
				
				throw new CommonException("리뷰 수정에 실패하였습니다.");
				
			}
			
			
			
			
		}
		
		int result=reviewService.updateReview(review,list,deleteFiles);
		
		if(result>0) {
			session.setAttribute("msg", "리뷰가 수정되었습니다.");
			
			if(cri.getFrom()==1) {
				return "redirect:/list.re"+cri.getListLink();
			}
				
				return "redirect:/mylist.re"+cri.getListLink();
			
		}else {
			throw new CommonException("리뷰 수정에 실패하였습니다.");
			
		}
		
		
	}
	
	@PostMapping("delete.re")
	public String deleteReview(int reviewNo, Criteria cri,HttpSession session) throws CommonException {
		
		
		String path=session.getServletContext().getRealPath("resources/uploadFiles/");

		List<Attach> attachList=reviewService.selectReviewAttachList(reviewNo);
		
		int result=reviewService.deleteReview(reviewNo);
		
		if(result>0) {
			
			for(Attach attach : attachList) {
				
				File deleteFile=new File(path,attach.getAttachPath()+attach.getAttachChange());
				
				deleteFile.delete();
			
			
			 
			}
			
			session.setAttribute("msg", "리뷰가 삭제되었습니다.");
			
			if(cri.getFrom()==1) {
				
				return "redirect:/list.re"+cri.getListLink();
			}
				
				return "redirect:/mylist.re"+cri.getListLink();
		
			
		}else {
			throw new CommonException("리뷰 삭제에 실패하였습니다.");
			
		}
		
		
		
		
	}
	
	
	public String getFolder() {
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		
		Date date =new Date();
		
		String str=sdf.format(date);
		
		return str.replace("-",File.separator);
		
		
	}
	
	
	
	
}
