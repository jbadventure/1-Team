package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.itwillbs.dao.ClassBoardDAO;
import com.itwillbs.dao.ReviewBoardDAO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReviewBoardDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class ReviewBoardService {
	
	ReviewBoardDAO boardDAO = null;

	public List<ReviewBoardDTO> getBoardList(PageDTO pageDTO) {
		System.out.println("ReviewBoardService getBoardList()");
		List<ReviewBoardDTO> boardList = null;
		try {
			// int startRow
			int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
			// int endROw 
			int endRow = startRow+pageDTO.getPageSize()-1;
			// pageDTO 저장
			pageDTO.setStartRow(startRow);
			pageDTO.setEndRow(endRow);
			
			boardDAO = new ReviewBoardDAO();
			boardList = boardDAO.getBoardList(pageDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boardList;
	} // getBoardList

	public void insertBoard(HttpServletRequest request) {
		System.out.println("ReviewBoardService insertBoard()");
		try {
			// request 한글처리 
			request.setCharacterEncoding("utf-8");
			// MultipartRequest 객체생성 사용
			String uploadPath = request.getRealPath("/upload");
			int maxSize = 10*1024*1024;
			MultipartRequest multi
			= new MultipartRequest(request, uploadPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
            // multi 파라미터 값 가져오기
//			int reviewNum = Integer.parseInt(multi.getParameter("reviewNum"));
			int classNum = Integer.parseInt(multi.getParameter("classNum"));
//			String reviewID = multi.getParameter("reviewID");
			String reviewContent = multi.getParameter("reviewContent");
			String reviewFile = multi.getFilesystemName("reviewFile");
			System.out.println(classNum);
			
			// BoardDAO 객체생성
			boardDAO = new ReviewBoardDAO();
			// DTO 객체생성
			ReviewBoardDTO boardDTO = new ReviewBoardDTO();
			HttpSession session = request.getSession();
			// set 메서드 값 저장
//			int classNum = Integer.parseInt(request.getParameter("classNum"));
//			boardDTO.setReviewNum(reviewNum);
			boardDTO.setClassNum(classNum);
			boardDTO.setReviewId(session.getAttribute("memberId").toString());
			boardDTO.setReviewContent(reviewContent);
			boardDTO.setReviewFile(reviewFile);
			// insertBoard(baordDTO) 메서드 호출
			boardDAO.insertBoard(boardDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}// insertBoard

	public ReviewBoardDTO getBoard(HttpServletRequest request) {
		System.out.println("ReviewBoardService getBoard()");
		ReviewBoardDTO boardDTO = null;
		try {
			// request 한글처리
			request.setCharacterEncoding("utf-8");
			// request 파라미터 가져오기 => int reviewNum 저장
			int classNum = Integer.parseInt(request.getParameter("classNum"));
			System.out.println(classNum);
			// BoardDAO 객체생성
			boardDAO = new ReviewBoardDAO();
			// boardDTO = getBoard(num) 메서드 호출
			boardDTO = boardDAO.getBoard(classNum);
			
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
		
	} // deleteBoard

	

}
