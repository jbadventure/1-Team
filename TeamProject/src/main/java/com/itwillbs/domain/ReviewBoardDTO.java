package com.itwillbs.domain;

import java.sql.Timestamp;

public class ReviewBoardDTO {
	private int classNum; // 해당 클래스 번호
	private int reviewNum; // 후기 번호
	private String reviewId; // 후기 작성자
	private Timestamp reviewIssueDate; // 후기 작성일시
	private String reviewContent; // 후기 내용
	private String reviewFile; // 후기 대표 이미지 경로
	
	public int getClassNum() {
		return classNum;
	}
	public void setClassNum(int classNum) {
		this.classNum = classNum;
	}
	public int getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}
	public String getReviewId() {
		return reviewId;
	}
	public void setReviewId(String reviewId) {
		this.reviewId = reviewId;
	}
	public Timestamp getReviewIssueDate() {
		return reviewIssueDate;
	}
	public void setReviewIssueDate(Timestamp reviewIssueDate) {
		this.reviewIssueDate = reviewIssueDate;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public String getReviewFile() {
		return reviewFile;
	}
	public void setReviewFile(String reviewFile) {
		this.reviewFile = reviewFile;
	}

	
	
}
