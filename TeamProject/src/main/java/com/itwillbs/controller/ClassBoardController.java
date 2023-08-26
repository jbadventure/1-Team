package com.itwillbs.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.domain.ClassBoardDTO;
import com.itwillbs.service.ClassBoardService;
import com.itwillbs.service.NoticeBoardService;

public class ClassBoardController extends HttpServlet { 
	
	RequestDispatcher dispatcher =null;
	ClassBoardService boardService = null;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ClassBoardController doGet()");
		doProcess(request, response);
	}//doGet()

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ClassBoardController doPost()");
		doProcess(request, response);
	}//doPost() 
		
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ClassBoardController doProcess()");
		String sPath = request.getServletPath();
		System.out.println("뽑은 가상주소"+sPath);
		
		if (sPath.equals("/classList.cbo")) { // 메인에서 클래스테스트 누르면 클래스 리스트 보여줌 
			boardService = new ClassBoardService();
			List<ClassBoardDTO> boardList = boardService.getBoardList();
			request.setAttribute("boardList", boardList);
			System.out.println(boardList);
			dispatcher = request.getRequestDispatcher("board/class/list.jsp");
			dispatcher.forward(request, response);
			} // list 
		
		
	} // doProcess
}// class
