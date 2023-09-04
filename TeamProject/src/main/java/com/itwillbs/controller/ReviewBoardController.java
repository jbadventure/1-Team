package com.itwillbs.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.domain.ReviewBoardDTO;
import com.itwillbs.service.ReviewBoardService;

public class ReviewBoardController extends HttpServlet{
	
	RequestDispatcher dispatcher = null;
	ReviewBoardService boardService = null;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberController doGet()");
		doProcess(request, response);
	}//doGet()

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberController doPost()");
		doProcess(request, response);
	}//doPost()
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("MemberController doProcess()");
		String sPath = request.getServletPath();
		System.out.println("뽑은 가상주소 : " + sPath);
		
		if(sPath.equals("/reviewWrite.rbo")) {
			dispatcher = request.getRequestDispatcher("/board/review/list.jsp");
			dispatcher.forward(request, response);
		} // write
		
		if(sPath.equals("/reviewWritePro.rbo")) {
			request.setCharacterEncoding("utf-8");
			// boardService 객체 생성
			boardService = new ReviewBoardService();
			// 리턴할 형 insertBoard(request) 메서드 호출
			boardService.insertBoard(request);
			// reviewList.rbo 주소변경되면서 이동
			response.sendRedirect("reviewList.rbo");
		} // writePro
		
		if(sPath.equals("/reviewList.rbo")) {
			boardService = new ReviewBoardService();
			List<ReviewBoardDTO> boardList = boardService.getBoardList();
			request.setAttribute("boardList", boardList);
			dispatcher = request.getRequestDispatcher("/board/review/list.jsp");
//			dispatcher = request.getRequestDispatcher("/board/class/content.jsp");
			dispatcher.forward(request, response);
		} // list
		
		if(sPath.equals("/reviewContent.rbo")) {
			System.out.println("주소 : /reviewContent.rbo");
			// BoardService 객체 생성
			boardService = new ReviewBoardService();
			// BoardDTO boardDTO = getBoard(request) 메서드 호출
			ReviewBoardDTO boardDTO = boardService.getBoard(request);
			// request에 boardDTO 담기
			request.setAttribute("boardDTO", boardDTO);
			// content.jsp 주소변경 없이 이동
			dispatcher = request.getRequestDispatcher("/board/review/content.jsp");
			dispatcher.forward(request, response);
			
		} // reviewContent
		
		if(sPath.equals("/reviewUpdate.rbo")) {
			System.out.println("주소 : /reviewUpdate.rbo");
			// BoardService 객체생성
			boardService = new ReviewBoardService();
			// BoardDTO boardDTO = getBoard(request) 메서드 호출
			ReviewBoardDTO boardDTO = boardService.getBoard(request);
			// request에 "boardDTO",boardDTO 담아서
			request.setAttribute("boardDTO", boardDTO);
			// center/update.jsp 주소변경없이 이동
			dispatcher 
			= request.getRequestDispatcher("/board/review/update.jsp");
			dispatcher.forward(request, response);
		} // update
		
		if(sPath.equals("/reviewUpdatePro.rbo")) {
			System.out.println("주소 : /reviewUpdatePro.rbo");
			// BoardService 객체생성
			boardService = new ReviewBoardService();
			// updateBoard(request) 메서드 호출
			boardService.updateBoard(request);
			// 글목록 list.bo 주소 변경 되면서 이동
			response.sendRedirect("reviewList.rbo");
		} // updatePro
		
		if(sPath.equals("/reviewDelete.rbo")) {
			// BoardService 객체생성
			boardService = new ReviewBoardService();
			// deleteBoard(request) 메서드 호출
			boardService.deleteBoard(request);
			// 주소 변경되면서 list.rbo 이동
			response.sendRedirect("reviewList.rbo");
		 } // delete
		
	} // process
}
