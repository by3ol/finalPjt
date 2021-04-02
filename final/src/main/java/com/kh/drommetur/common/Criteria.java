package com.kh.drommetur.common;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {

	private int amount;
	private int pageNo;
		
	private String type; //대분류 N에 쓰이는 검색 타입과 키워드 
	private String keyword;
	
	private int region; //대분류 R 지역검색에 쓰이는 지역번호 
	private String group; //대분류 G에 쓰이는 그룹명 

	
	
	private int from; //1: 리뷰리스트에서 온것 2: 마이페이지 리뷰리스트 
	
	 

	
	
	public Criteria() {
		
		this.amount=10;
		this.pageNo=1;
	}
	
	public Criteria(int pageNo,int amount) {
		
		this.amount=amount;
		this.pageNo=pageNo;
		
	}
	
	public String[] getTypeArr() {
		
		return type==null? new String[]{}: type.split("");
	}
	
	public String getListLink() {
		
		UriComponentsBuilder builder=UriComponentsBuilder.fromPath("")
				.queryParam("pageNo", this.pageNo)
				.queryParam("amount", this.amount)
				.queryParam("type", this.type)
				.queryParam("keyword", this.keyword)
				.queryParam("region", this.region)
				.queryParam("group", this.group)
				.queryParam("from", this.from);
		
		return builder.toUriString();
		
	}
	

}
