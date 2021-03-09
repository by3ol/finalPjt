package com.kh.drommetur.member.model.vo;

import lombok.Data;

@Data
public class Member {

	private int memberNo;
	private String memberId;
	private String email;
	private String memberPwd;
	private String memberName;
	private String phone;
	private	String address;
	private String gender;
	private String memberLevel;
	private String regDate;
	private String status;
	
}
