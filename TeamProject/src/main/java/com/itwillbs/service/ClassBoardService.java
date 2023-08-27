package com.itwillbs.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.itwillbs.dao.ClassBoardDAO;
import com.itwillbs.dao.NoticeBoardDAO;
import com.itwillbs.domain.ClassBoardDTO;
import com.itwillbs.domain.NoticeBoardDTO;
import com.itwillbs.domain.PageDTO;

public class ClassBoardService {
	
	ClassBoardDAO boardDAO = null; 

	public List<ClassBoardDTO> getBoardList(PageDTO pageDTO) {
		System.out.println("ClassBoardService getBoardList()");
		List<ClassBoardDTO>boardList = null;
		try {
			// int startRow = 계산식; 
			int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
			// 시작하는 행	부터 끝나는 행까지 뽑아오기 

			// int endRow = 계산식;      
			int endRow = startRow+pageDTO.getPageSize()-1;
			//pageDTO 저장 <- startRow, endRow
			pageDTO.setStartRow(startRow);
			pageDTO.setEndRow(endRow);
					
			boardDAO = new ClassBoardDAO();
			boardList = boardDAO.getBoardList(pageDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boardList;
	}// getBoardList

	public int getBoardCount() {
		System.out.println("BoardService getBoardCount()");
		int count=0; 
		try {
			// BoardDAO 객체생성 
			boardDAO = new ClassBoardDAO();
			// count = getBoardCount() 호출
			count = boardDAO.getBoardCount();
		} catch (Exception e) {
			e.printStackTrace();
			}
		return count;
	}//getBoardCount

	public void insertBoard(HttpServletRequest request) {
		System.out.println("BoardService insertBoard()");
		try {
			// request 한글처리 
			request.setCharacterEncoding("utf-8");
			// request 파라미터값 가져오기 
			String classSubject = request.getParameter("classSubject");
			int classPrice = Integer.parseInt(request.getParameter("classPrice"));
			String classCategory = request.getParameter("classCategory");
			String classLocation = request.getParameter("classLocation");
			String classContent = request.getParameter("classContent");
			// BoardDAO 객체생성 
			boardDAO = new ClassBoardDAO();
			// BoardDTO 객체생성  
			ClassBoardDTO boardDTO = new ClassBoardDTO();
			// set메서드 호출 파라미터값 저장 
			boardDTO.setClassSubject(classSubject);
			boardDTO.setClassPrice(classPrice);
			boardDTO.setClassCategory(classCategory);
			boardDTO.setClassLocation(classLocation);
			boardDTO.setClassContent(classContent);
			System.out.println(boardDTO.getClassLocation());
			// 리턴할형없음 insertBoard(boardDTO) 호출 
			boardDAO.insertBoard(boardDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//insertBoard()

	public ClassBoardDTO getBoard(HttpServletRequest request) {
		System.out.println("ClassBoardService getBoard()");
		ClassBoardDTO boardDTO = null;
		try {
			// request 한글처리 
			request.setCharacterEncoding("utf-8");
			int classNum = Integer.parseInt(request.getParameter("classNum"));
			System.out.println(classNum);
			boardDAO = new ClassBoardDAO();
			boardDTO = boardDAO.getBoard(classNum);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boardDTO;
	} // getBoard
	

}// 클래스



