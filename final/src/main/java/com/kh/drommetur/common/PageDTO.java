package com.kh.drommetur.common;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageDTO {

	
	private int startPage;
	private int endPage;
	
	private boolean next;
	private boolean prev;
	
	private int realEnd;
	
	private Criteria cri;
	
	public PageDTO(int listCount,Criteria cri) {
		
		
		this.cri=cri;
		this.endPage=(int)(Math.ceil(cri.getPageNo()/10.0))*10;
		this.startPage=endPage-9;
		
		
		this.realEnd=(int)Math.ceil(listCount*1.0/cri.getAmount());
		

		
		if(this.endPage>this.realEnd) {
			this.endPage=this.realEnd;
		}
		
		if(this.startPage>1) {
			this.prev=true;
		}
		
		if(this.endPage<realEnd) {
			this.next=true;
		}
		
		
		
		
	}
	

	
	
}
