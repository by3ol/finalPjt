package com.kh.drommetur.review.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kh.drommetur.common.Criteria;
import com.kh.drommetur.review.model.vo.Attach;
import com.kh.drommetur.review.model.vo.Review;

public interface ReviewMapper {

	int selectReviewListCount(Criteria cri);

	ArrayList<Review> selectReviewList(Criteria cri);

	int insertReview(Review review);

	int insertAttach(Attach attach);

	Review selectReview(int reviewNo);

	List<Attach> selectReviewAttachList(int reviewNo);

	List<Attach> selectDeleteAttach(int[] deleteFiles);

	int deleteAttach(int[] deleteFiles);

	int updateReview(Review review);

	List<Attach> selectAttachList(int reviewNo);

	int deleteReview(int reviewNo);

	int updateReviewVisitCount(int reviewNo);

	int insertAttachWithReviewNo(@Param("attach") Attach attach,@Param("reviewNo") int reviewNo);

	int selectMyReviewListCount(@Param("cri")Criteria cri,@Param("memberNo") int memberNo);

	ArrayList<Review> selectMyReviewList(@Param("cri") Criteria cri,@Param("memberNo") int memberNo);

	
	
	
}
