package com.itwillbs.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.itwillbs.dao.ClassBoardDAO;
import com.itwillbs.domain.ClassBoardDTO;
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
	

}// 클래스



