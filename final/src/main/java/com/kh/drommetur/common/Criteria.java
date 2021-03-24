package com.kh.drommetur.common;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {

	private int amount;
	private int pageNo;
	
	public Criteria() {
		
		this.amount=10;
		this.pageNo=1;
	}
	
	public Criteria(int pageNo,int amount) {
		
		this.amount=amount;
		this.pageNo=pageNo;
		
	}
}
