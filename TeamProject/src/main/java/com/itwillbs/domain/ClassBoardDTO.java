package com.itwillbs.domain;

import java.sql.Timestamp;

public class ClassBoardDTO {

	private int classNum; // 클래스 번호
	private String classSubject; // 클래스 제목
	private String hostId; // 클래스 호스트 번호 -> 호스트 테이블 참조
	private Timestamp classIssueDate; // 클래스 작성일시
	private String classLocation; // 클래스 개최 지역
	private String classCategory; // 해당 클래스 카테고리
	private String classContent; // 클래스 내용
    private int classPrice; //클래스 금액 
    private String classFile; // 클래스 첨부파일
    
	public int getClassNum() {
		return classNum;
	}
	public void setClassNum(int classNum) {
		this.classNum = classNum;
	}
	public String getClassSubject() {
		return classSubject;
	}
	public void setClassSubject(String classSubject) {
		this.classSubject = classSubject;
	}
	public String getHostId() {
		return hostId;
	}
	public void setHostId(String hostId) {
		this.hostId = hostId;
	}
	public Timestamp getClassIssueDate() {
		return classIssueDate;
	}
	public void setClassIssueDate(Timestamp classIssueDate) {
		this.classIssueDate = classIssueDate;
	}
	public String getClassLocation() {
		return classLocation;
	}
	public void setClassLocation(String classLocation) {
		this.classLocation = classLocation;
	}
	public String getClassCategory() {
		return classCategory;
	}
	public void setClassCategory(String classCategory) {
		this.classCategory = classCategory;
	}
	public String getClassContent() {
		return classContent;
	}
	public void setClassContent(String classContent) {
		this.classContent = classContent;
	}
	public int getClassPrice() {
		return classPrice;
	}
	public void setClassPrice(int classPrice) {
		this.classPrice = classPrice;
	}
	public String getClassFile() {
		return classFile;
	}
	public void setClassFile(String classFile) {
		this.classFile = classFile;
	}
    
    
	

}
