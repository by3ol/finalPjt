package com.kh.drommetur.customer.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Question {

	private int questionNo;
	private String category;
	private String questionTitle;
	private String questionContent;
	private Date datetime;
	private String status;
	private String writer;

	
	
}
