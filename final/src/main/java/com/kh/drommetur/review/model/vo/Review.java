package com.kh.drommetur.review.model.vo;

import java.util.Date;

import com.kh.drommetur.member.model.vo.Member;
import com.kh.drommetur.place.model.vo.Place;

import lombok.Data;

@Data
public class Review {
	
	private int reviewNo;
	private int memNo;
	private int placeNo;
	private String reviewTitle;
	private String reviewContent;
	private Date reviewRegDate;
	private int visitCount;
	private int attachCount;
	
	
	private Member member;
	private Place place;
	private Region regionObj;

}
