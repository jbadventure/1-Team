package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.itwillbs.dao.NoticeBoardDAO;
import com.itwillbs.domain.NoticeBoardDTO;

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

	public List<NoticeBoardDTO> getBoardList() {
		List<NoticeBoardDTO> boardList = null;
		try {
			boardDAO = new NoticeBoardDAO();
			boardList = boardDAO.getBoardList();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boardList;
	}

}
