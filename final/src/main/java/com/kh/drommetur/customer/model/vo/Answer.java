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
public class Answer {
	private int answero;
	private String answerTitle;
	private String answerContent;
	private Date datetime;
	private String status;
}
