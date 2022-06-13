package me.light.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class Criteria {
	
	private int page; 
	private int perPageNum;
	private int pageStart;
	
	private String type;
	private String keyword;
	
	public Criteria() {
		this.page = 1; 
		this.perPageNum = 10; 
	}

	public void setPage(int page) {
		if(page<=0) this.page=1;
		else this.page = page;
	}
	
	public int getPageStart() {
		return (this.page-1)*perPageNum; 
	}
	
	public String[] getTypeCollection() {
		return this.type != null ? type.split("") : new String[] {};
	}
}