package com.itwillbs.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.itwillbs.dao.ClassBoardDAO;
import com.itwillbs.dao.NoticeBoardDAO;
import com.itwillbs.domain.ClassBoardDTO;

public class ClassBoardService {
	
	ClassBoardDAO boardDAO = null; 

	public List<ClassBoardDTO> getBoardList() {
		System.out.println("ClassBoardService getBoardList()");
		List<ClassBoardDTO>boardList = null;
		try {
			boardDAO = new ClassBoardDAO();
			boardList = boardDAO.getBoardList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boardList;
	}


}
