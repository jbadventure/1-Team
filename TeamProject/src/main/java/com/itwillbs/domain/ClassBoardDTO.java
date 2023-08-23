package com.itwillbs.domain;

import java.sql.Timestamp;

public class ClassBoardDTO {

	private int classNum; // 클래스 번호
	private int hostNum; // 클래스 호스트 번호 -> 호스트 테이블 참조
	private String classSubject; // 클래스 제목
	private String classContent; // 클래스 내용
	private Timestamp classIssueDate; // 클래스 작성일시
	private String classCategory; // 해당 클래스 카테고리
	private String classLocation; // 클래스 개최 지역
	
	public int getClassNum() {
		return classNum;
	}
	public void setClassNum(int classNum) {
		this.classNum = classNum;
	}
	public int getHostNum() {
		return hostNum;
	}
	public void setHostNum(int hostNum) {
		this.hostNum = hostNum;
	}
	public String getClassSubject() {
		return classSubject;
	}
	public void setClassSubject(String classSubject) {
		this.classSubject = classSubject;
	}
	public String getClassContent() {
		return classContent;
	}
	public void setClassContent(String classContent) {
		this.classContent = classContent;
	}
	public Timestamp getClassIssueDate() {
		return classIssueDate;
	}
	public void setClassIssueDate(Timestamp classIssueDate) {
		this.classIssueDate = classIssueDate;
	}
	public String getClassCategory() {
		return classCategory;
	}
	public void setClassCategory(String classCategory) {
		this.classCategory = classCategory;
	}
	public String getClassLocation() {
		return classLocation;
	}
	public void setClassLocation(String classLocation) {
		this.classLocation = classLocation;
	}
	
	
	
}
