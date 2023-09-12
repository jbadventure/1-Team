package com.itwillbs.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.itwillbs.dao.QuestionBoardDAO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.QuestionBoardDTO;


public class QuestionBoardService {
	
	QuestionBoardDAO boardDAO = null;

	public List<QuestionBoardDTO> getBoardList(PageDTO pageDTO) {
		System.out.println("QuestionBoardService getBoardList()");
		List<QuestionBoardDTO> boardList = null;
		try {
			// int startRow = 계산식; 
			int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
			// int endRow = 계산식;      
			int endRow = startRow+pageDTO.getPageSize()-1;
			//pageDTO 저장 <- startRow, endRow
			pageDTO.setStartRow(startRow);
			pageDTO.setEndRow(endRow);
					
			boardDAO = new QuestionBoardDAO();
			boardList = boardDAO.getBoardList(pageDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boardList;
	} // getBoardList

	public int getBoardCount() {
		System.out.println("QuestionBoardService getBoardCount()");
		int count=0;
		try {
			boardDAO = new QuestionBoardDAO();
			// count = getBoardCount() 호출
			count = boardDAO.getBoardCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public void insertBoard(HttpServletRequest request) {
		try {
			// request 한글처리
			request.setCharacterEncoding("utf-8");
			// request 변수 저장
		    int questionNum =1;
		    String questionQuestion = request.getParameter("questionQuestion");
		    String questionAnswer = request.getParameter("questionAnswer");
		    String questionCategory = request.getParameter("questionCategory");
		    // BoardDAO 객체생성
		    boardDAO = new QuestionBoardDAO();
		    // getMaxNum
		    questionNum = boardDAO.getMaxNum() + 1;
		    // BoardDTO 객체생성
		    QuestionBoardDTO boardDTO = new QuestionBoardDTO();
		    // set값
		    boardDTO.setQuestionAnswer(questionAnswer);
		    boardDTO.setQuestionCategory(questionCategory);
		    boardDTO.setQuestionNum(questionNum);
		    boardDTO.setQuestionQuestion(questionQuestion);
		    System.out.println(boardDTO);
		    
		    boardDAO.insertBoard(boardDTO);
		    
		    
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public QuestionBoardDTO getBoard(HttpServletRequest request) {
		QuestionBoardDTO boardDTO = null;
		try {
			// request 한글처리
			request.setCharacterEncoding("utf-8");
			// request에 questionNum 파라미터 값
			int questionNum = Integer.parseInt(request.getParameter("questionNum"));
			// boardDAO 객체생성
			boardDAO = new QuestionBoardDAO();
			// boardDTO = getBoard(questionNum)
			boardDTO = boardDAO.getBoard(questionNum);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boardDTO;
	}

	public void updateBoard(HttpServletRequest request) {
		try {
			// request 한글처리
			request.setCharacterEncoding("utf-8");
			// request 값 가져오기
			int questionNum = Integer.parseInt(request.getParameter("questionNum"));
			String questionQuestion = request.getParameter("questionQuestion");
			String questionAnswer = request.getParameter("questionAnswer");
			String questionCategory = request.getParameter("questionCategory");
			
			// BoardDTO 값 저장
			QuestionBoardDTO boardDTO = new QuestionBoardDTO();
			boardDTO.setQuestionAnswer(questionAnswer);
			boardDTO.setQuestionCategory(questionCategory);
			boardDTO.setQuestionNum(questionNum);
			boardDTO.setQuestionQuestion(questionQuestion);
			
			// boardDAO 객체생성 updateBoard(boardDTO) 호출
			boardDAO = new QuestionBoardDAO();
			boardDAO.updateBoard(boardDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	} // updateBoard

	public void deleteBoard(HttpServletRequest request) {
		try {
			
			// request 파라미터값 가져오기
			int questionNum = Integer.parseInt(request.getParameter("questionNum"));
			// boardDAO 객체생성 deleteBoard 호출
			boardDAO = new QuestionBoardDAO();
			boardDAO.deleteBoard(questionNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	} // deleteBoard

}
