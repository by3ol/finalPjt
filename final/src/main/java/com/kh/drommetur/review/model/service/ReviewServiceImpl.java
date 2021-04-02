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
		
		
		return reviewMapper.selectReview(reviewNo);
	}

	@Override
	public List<Attach> selectReviewAttachList(int reviewNo) {
		// TODO Auto-generated method stub
		return reviewMapper.selectReviewAttachList(reviewNo);
	}

}
