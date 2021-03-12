package com.kh.drommetur.customer.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class Notice {
	int answerNo;
	String category;
	String answerTitle;
	String answerContent;
	int visit;
	Date datetime;
	String status;
}
