package com.kh.drommetur.review.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.drommetur.common.Criteria;
import com.kh.drommetur.review.mapper.ReviewMapper;
import com.kh.drommetur.review.model.vo.Attach;
import com.kh.drommetur.review.model.vo.Review;

import lombok.Setter;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Setter(onMethod_=@Autowired)
	private ReviewMapper reviewMapper;
	
	@Override
	public int selectReviewListCount(Criteria cri) {
		
		return reviewMapper.selectReviewListCount(cri);
	}

	@Override
	public ArrayList<Review> selectReviewList(Criteria cri) {
		
		return reviewMapper.selectReviewList(cri);
	}

	@Override
	public int insertReview(Review review, List<Attach> list) {
		
		
		int result=reviewMapper.insertReview(review);
		
		for(Attach attach : list) {
			
			result*=reviewMapper.insertAttach(attach);
		}
		
		
		return result;
	}

	@Override
	public Review selectReview(int reviewNo) {
		
		int result=reviewMapper.updateReviewVisitCount(reviewNo);
		
		if(result>0) {
			return reviewMapper.selectReview(reviewNo);
		}
		
		return null;
	}

	@Override
	public List<Attach> selectReviewAttachList(int reviewNo) {
		// TODO Auto-generated method stub
		return reviewMapper.selectReviewAttachList(reviewNo);
	}

	@Override
	public int updateReview(Review review, List<Attach> list, int[] deleteFiles) {
		
		int result=0;
		
		if(deleteFiles!=null) {
			
			
			 result=reviewMapper.deleteAttach(deleteFiles);
			 
			 result*=reviewMapper.updateReview(review);
			 
			 for(Attach attach : list) {
				 
				 result*=reviewMapper.insertAttachWithReviewNo(attach,review.getReviewNo());
			 }
			 
			 return result;
	
		}
		
		result=reviewMapper.updateReview(review);
		
		 for(Attach attach : list) {
			 
			 result*=reviewMapper.insertAttachWithReviewNo(attach,review.getReviewNo());
		 }
		
		
		return result;
	}

	@Override
	public List<Attach> selectDeleteAttach(int[] deleteFiles) {
		
		return reviewMapper.selectDeleteAttach(deleteFiles);
	}

	@Override
	public int deleteReview(int reviewNo) {
		
		return reviewMapper.deleteReview(reviewNo);
	}

	@Override
	public int selectMyReviewListCount(Criteria cri, int memberNo) {
		
		
		
		return reviewMapper.selectMyReviewListCount(cri,memberNo);
	}

	@Override
	public ArrayList<Review> selectMyReviewList(Criteria cri, int memberNo) {
		
		return reviewMapper.selectMyReviewList(cri,memberNo);
	}



}
