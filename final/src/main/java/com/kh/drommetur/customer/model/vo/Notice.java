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
public class Notice {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private int visit;
	private Date datetime;
	private String status;
}
