package com.kh.drommetur.customer.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
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
	int answerNo;
	String category;
	String questionTitle;
	String questionContent;
	String questionSecret;
	Date datetime;
	String status;
}
