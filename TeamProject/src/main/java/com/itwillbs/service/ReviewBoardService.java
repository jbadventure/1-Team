package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.itwillbs.dao.ClassBoardDAO;
import com.itwillbs.dao.ReviewBoardDAO;

import com.itwillbs.domain.ReviewBoardDTO;


public class ReviewBoardService {
	
	ReviewBoardDAO boardDAO = null;

	public List<ReviewBoardDTO> getBoardList() {
		System.out.println("ReviewBoardService getBoardList()");
		List<ReviewBoardDTO> boardList = null;
		try {
			boardDAO = new ReviewBoardDAO();
			boardList = boardDAO.getBoardList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boardList;
	} // getBoardList

	public void insertBoard(HttpServletRequest request) {
		try {
			String uploadPath = request.getRealPath("/upload");
			// request 한글처리 
			request.setCharacterEncoding("utf-8");
			// request 파라미터값 가져오기 
			String reviewID = request.getParameter("reviewID");
			String reviewContent = request.getParameter("reviewContent");
			String reviewFile = request.getParameter("reviewFile");
			int reviewNum = 0;
			int classNum = 0;
			Timestamp reviewDate = new Timestamp(System.currentTimeMillis());
			// BoardDAO 객체생성
			boardDAO = new ReviewBoardDAO();
			// DTO 객체생성
			ReviewBoardDTO boardDTO = new ReviewBoardDTO();
			HttpSession session = request.getSession();
			// set 메서드 값 저장
			boardDTO.setReviewId(reviewID);
			boardDTO.setReviewContent(reviewContent);
			boardDTO.setReviewFile(reviewFile);
			boardDTO.setReviewNum(reviewNum);
			boardDTO.setClassNum(classNum);
			boardDTO.setReviewDate(reviewDate);
			// insertBoard(baordDTO) 메서드 호출
			boardDAO.insertBoard(boardDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}// insertBoard

	public ReviewBoardDTO getBoard(HttpServletRequest request) {
		ReviewBoardDTO boardDTO = null;
		try {
			// request 한글처리
			request.setCharacterEncoding("utf-8");
			// request 파라미터 가져오기 => int reviewNum 저장
			int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
			// BoardDAO 객체생성
			boardDAO = new ReviewBoardDAO();
			// boardDTO = getBoard(num) 메서드 호출
			boardDTO = boardDAO.getBoard(reviewNum);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boardDTO;
	} // getBoard

	public void updateBoard(HttpServletRequest request) {
		System.out.println("BoardService updateBoard");
		try {
			// 한글처리
			request.setCharacterEncoding("utf-8");
			// num name subject content 파라미터 값 가져오기
			int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
			int classNum = Integer.parseInt(request.getParameter("classNum"));
			String reviewId = request.getParameter("reviewId");
			String reviewContent = request.getParameter("reviewContent");
			String reviewFile = request.getParameter("reviewFile");
			// BoardDTO 객체생성
			ReviewBoardDTO boardDTO = new ReviewBoardDTO();
			// set메서드 호출 파라미터값 저장
			boardDTO.setReviewNum(reviewNum);
			boardDTO.setReviewId(reviewId);
			boardDTO.setClassNum(classNum);
			boardDTO.setReviewContent(reviewContent);
			boardDTO.setReviewFile(reviewFile);
			// BoardDAO 객체생성
			boardDAO = new ReviewBoardDAO();
			// updateBoard(boardDTO) 메서드호출
			boardDAO.updateBoard(boardDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	} // updateBoard

	public void deleteBoard(HttpServletRequest request) {
	try {
		// request 한글처리
		request.setCharacterEncoding("utf-8");
		// request 파라미터값 가져오기
		int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
		// => BoardDAO 객체생성 deleteBoard(classNum) 호출
		boardDAO = new ReviewBoardDAO();
		boardDAO.deleteBoard(reviewNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	

}
