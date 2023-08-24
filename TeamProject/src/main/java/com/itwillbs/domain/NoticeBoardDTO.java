package com.itwillbs.domain;

import java.sql.Timestamp;

public class NoticeBoardDTO {

	private int noticeNum; // 공지 번호
	private String noticeSubject; // 공지 제목
	private String noticeContent; // 공지 내용
	private Timestamp noticeIssueDate; // 공지 작성일시
	private int noticeReadcount; // 조회수
	
	@Override
	public String toString() {
		return "NoticeBoardDTO [noticeNum=" + noticeNum + ", noticeSubject=" + noticeSubject + ", noticeContent="
				+ noticeContent + ", noticeIssueDate=" + noticeIssueDate + ", noticeReadcount=" + noticeReadcount + "]";
	}
	public int getNoticeNum() {
		return noticeNum;
	}
	public void setNoticeNum(int noticeNum) {
		this.noticeNum = noticeNum;
	}
	public String getNoticeSubject() {
		return noticeSubject;
	}
	public void setNoticeSubject(String noticeSubject) {
		this.noticeSubject = noticeSubject;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public Timestamp getNoticeIssueDate() {
		return noticeIssueDate;
	}
	public void setNoticeIssueDate(Timestamp noticeIssueDate) {
		this.noticeIssueDate = noticeIssueDate;
	}
	public int getNoticeReadcount() {
		return noticeReadcount;
	}
	public void setNoticeReadcount(int noticeReadcount) {
		this.noticeReadcount = noticeReadcount;
	}
	
	
	
}
