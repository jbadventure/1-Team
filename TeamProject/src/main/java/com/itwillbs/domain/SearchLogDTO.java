package com.itwillbs.domain;

import java.sql.Timestamp;

public class SearchLogDTO {

	private int searchNum; // 검색 번호
	private String searchId; // 검색한 회원 아이디
	private String searchContent; // 검색 내용
	private Timestamp searchDate; // 검색 일시
	
	public int getSearchNum() {
		return searchNum;
	}
	public void setSearchNum(int searchNum) {
		this.searchNum = searchNum;
	}
	public String getSearchId() {
		return searchId;
	}
	public void setSearchId(String searchId) {
		this.searchId = searchId;
	}
	public String getSearchContent() {
		return searchContent;
	}
	public void setSearchContent(String searchContent) {
		this.searchContent = searchContent;
	}
	public Timestamp getSearchDate() {
		return searchDate;
	}
	public void setSearchDate(Timestamp searchDate) {
		this.searchDate = searchDate;
	}
	
	
}
