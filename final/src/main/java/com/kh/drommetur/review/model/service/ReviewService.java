package com.kh.drommetur.review.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.drommetur.common.Criteria;
import com.kh.drommetur.review.model.vo.Attach;
import com.kh.drommetur.review.model.vo.Review;

public interface ReviewService {

	int selectReviewListCount(Criteria cri);

	ArrayList<Review> selectReviewList(Criteria cri);

	int insertReview(Review review, List<Attach> list);

	Review selectReview(int reviewNo);

	List<Attach> selectReviewAttachList(int reviewNo);

}
