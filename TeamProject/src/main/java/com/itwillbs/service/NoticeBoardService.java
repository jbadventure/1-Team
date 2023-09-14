package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.itwillbs.dao.NoticeBoardDAO;
import com.itwillbs.dao.QuestionBoardDAO;
import com.itwillbs.domain.NoticeBoardDTO;
import com.itwillbs.domain.PageDTO;

public class NoticeBoardService {
	
	NoticeBoardDAO boardDAO = null;

	public void insertBoard(HttpServletRequest request) {
		try {
			String noticeSubject = request.getParameter("noticeSubject");
			String noticeContent = request.getParameter("noticeContent");
			int noticeReadcount = 0;
			Timestamp noticeIssueDate = new Timestamp(System.currentTimeMillis());
			int noticeNum = 1;
			boardDAO = new NoticeBoardDAO();
			noticeNum = boardDAO.getMaxNum() + 1 ;
			NoticeBoardDTO boardDTO = new NoticeBoardDTO();
			boardDTO.setNoticeNum(noticeNum);
			boardDTO.setNoticeSubject(noticeSubject);
			boardDTO.setNoticeContent(noticeContent);
			boardDTO.setNoticeIssueDate(noticeIssueDate);
			boardDTO.setNoticeReadcount(noticeReadcount);
			System.out.println(boardDTO);
			
			boardDAO.insertBoard(boardDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	} // insertBoard

	public List<NoticeBoardDTO> getBoardList(PageDTO pageDTO) {
		List<NoticeBoardDTO> boardList = null;
		try {
			// int startRow = 계산식; 
			int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
			// int endRow = 계산식;      
			int endRow = startRow+pageDTO.getPageSize()-1;
			//pageDTO 저장 <- startRow, endRow
			pageDTO.setStartRow(startRow);
			pageDTO.setEndRow(endRow);
			
			boardDAO = new NoticeBoardDAO();
			boardList = boardDAO.getBoardList(pageDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boardList;
	} // getBoardList
	
	public NoticeBoardDTO getBoard(HttpServletRequest request) {
		System.out.println("NoticeBoardService getBoard()");
		NoticeBoardDTO boardDTO = null;
		try {
			// request 한글처리 
			request.setCharacterEncoding("utf-8");
			System.out.println(request.getParameter("noticeNum"));
			int noticeNum = Integer.parseInt(request.getParameter("noticeNum"));
			System.out.println(noticeNum);
			boardDAO = new NoticeBoardDAO();
			boardDTO = boardDAO.getBoard(noticeNum);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boardDTO;
	} // getBoard


	public void updateReadcount(HttpServletRequest request) {
		try {
			int noticeNum = Integer.parseInt(request.getParameter("noticeNum"));
			boardDAO = new NoticeBoardDAO();
			boardDAO.updateReadcount(noticeNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // updateReadcount

	public void updateBoard(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
			int noticeNum = Integer.parseInt(request.getParameter("noticeNum"));
			String noticeSubject = request.getParameter("noticeSubject");
			String noticeContent = request.getParameter("noticeContent");
			
			NoticeBoardDTO boardDTO = new NoticeBoardDTO();
			boardDTO.setNoticeNum(noticeNum);
			boardDTO.setNoticeSubject(noticeSubject);
			boardDTO.setNoticeContent(noticeContent);
			
			boardDAO = new NoticeBoardDAO();
			boardDAO.updateBoard(boardDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	} // updateBoard

	public void deleteBoard(HttpServletRequest request) {
		try {
			int noticeNum = Integer.parseInt(request.getParameter("noticeNum"));
			boardDAO = new NoticeBoardDAO();
			boardDAO.deleteBoard(noticeNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public int getBoardCount() {
		System.out.println("NoticeBoardService getBoardCount()");
		int count=0;
		try {
			boardDAO = new NoticeBoardDAO();
			// count = getBoardCount() 호출
			count = boardDAO.getBoardCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}


}
