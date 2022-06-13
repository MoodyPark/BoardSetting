package me.light.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PageMaker {
	Criteria criteria; 
	int startPage;
	int endPage;
	int tempEndPage;
	int totalCount;
	
	boolean prev;
	boolean next;
	
	int displayPageNum = 10;
	
	public PageMaker(Criteria criteria, int totalCount) {
		this.criteria = criteria;
		this.totalCount = totalCount;
		endPage = (int) Math.ceil(criteria.getPage()/ (double)displayPageNum) * displayPageNum;
		startPage = endPage - displayPageNum + 1 ;
		tempEndPage = (int) Math.ceil(totalCount/ (double) criteria.getPerPageNum());
		if(endPage>tempEndPage) endPage = tempEndPage;
		
		prev = startPage != 1;
		next = endPage < tempEndPage;
	}

	
}