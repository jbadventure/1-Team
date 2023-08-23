package com.itwillbs.domain;

public class QuestionBoardDTO {

	private int questionNum; // 자주 묻는 질문 번호
	private String questionQuestion; // 질문(제목)
	private String questionAnswer; // 답변(내용)
	private String questionCategory; // 질문 분류
	
	public int getQuestionNum() {
		return questionNum;
	}
	public void setQuestionNum(int questionNum) {
		this.questionNum = questionNum;
	}
	public String getQuestionQuestion() {
		return questionQuestion;
	}
	public void setQuestionQuestion(String questionQuestion) {
		this.questionQuestion = questionQuestion;
	}
	public String getQuestionAnswer() {
		return questionAnswer;
	}
	public void setQuestionAnswer(String questionAnswer) {
		this.questionAnswer = questionAnswer;
	}
	public String getQuestionCategory() {
		return questionCategory;
	}
	public void setQuestionCategory(String questionCategory) {
		this.questionCategory = questionCategory;
	}
	
	
}
