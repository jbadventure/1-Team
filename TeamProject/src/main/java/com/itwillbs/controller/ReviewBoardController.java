package com.itwillbs.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.domain.ClassBoardDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReviewBoardDTO;
import com.itwillbs.service.ClassBoardService;
import com.itwillbs.service.ReviewBoardService;

public class ReviewBoardController extends HttpServlet{
	
	RequestDispatcher dispatcher = null;
	ReviewBoardService boardService = null;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ReviewBoardController doGet()");
		doProcess(request, response);
	}//doGet()

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ReviewBoardController doPost()");
		doProcess(request, response);
	}//doPost()
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("ReviewBoardController doProcess()");
		String sPath = request.getServletPath();
		System.out.println("뽑은 가상주소 : " + sPath);
		
		if(sPath.equals("/reviewWrite.rbo")) {
			System.out.println("뽑은 가상주소 비교 : /reviewWrite.rbo");
			
			ClassBoardService boardService = new ClassBoardService();
			ClassBoardDTO boardDTO = boardService.getBoard(request);
			request.setAttribute("boardDTO", boardDTO);
			
			dispatcher = request.getRequestDispatcher("board/review/write.jsp");
			dispatcher.forward(request, response);
		} // write
		
		if(sPath.equals("/reviewWritePro.rbo")) {
			System.out.println("뽑은 가상주소 비교 : /reviewWritePro.rbo");
			request.setCharacterEncoding("utf-8");
			int classNum = Integer.parseInt(request.getParameter("classNum"));
			System.out.println(classNum);
			// boardService 객체 생성
			boardService = new ReviewBoardService();
			// 리턴할 형 insertBoard(request) 메서드 호출
			boardService.insertBoard(request);
			// reviewList.rbo 주소변경되면서 이동
			response.sendRedirect("classContent.cbo?classNum="+classNum);
		} // writePro
		
		if(sPath.equals("/reviewDelete.rbo")) {
			System.out.println("뽑은 가상주소 비교 : /reviewDelete.rbo");
			// BoardService 객체생성
			boardService = new ReviewBoardService();
			
			boardService.deleteBoard(request);
			
			request.setCharacterEncoding("utf-8");
			int classNum = Integer.parseInt(request.getParameter("classNum"));
			System.out.println(classNum);
			// 주소 변경되면서 list.rbo 이동
			response.sendRedirect("classContent.cbo?classNum="+classNum);
		 } // delete
		
//		if(sPath.equals("/reviewList.rbo")) {
//			System.out.println("뽑은 가상주소 비교 : /reviewList.rbo");
//			// 한페이지에 출력될 게시물 수
//			int pageSize = 8;
//			// 페이지 번호
//			String pageNum = request.getParameter("pageNum");
//			// 페이지 번호 없으면 1페이지 설정
//			if(pageNum == null) {
//				pageNum ="1";
//			}
//			// 페이지 번호를 정수형으로 변경
//			int currentPage = Integer.parseInt(pageNum);
//			PageDTO pageDTO = new PageDTO();
//			pageDTO.setPageSize(pageSize);
//			pageDTO.setPageNum(pageNum);
//			pageDTO.setCurrentPage(currentPage);
//			
//			// BoardService 객체생성
//			boardService = new ReviewBoardService();
//			List<ReviewBoardDTO> boardList = boardService.getBoardList(pageDTO);
//			request.setAttribute("boardList", boardList);
//			
//			System.out.println("boardList" + boardList);
//			// 주소 변경없이 페이지 이동
//			dispatcher = request.getRequestDispatcher("board/review/list.jsp");
//			dispatcher.forward(request, response);
//		} // list
//		
//		if(sPath.equals("/reviewContent.rbo")) {
//			System.out.println("뽑은 가상주소 비교 : /reviewContent.rbo");
//			// BoardService 객체 생성
//			boardService = new ReviewBoardService();
//			// BoardDTO boardDTO = getBoard(request) 메서드 호출
//			ReviewBoardDTO boardDTO = boardService.getBoard(request);
//			// request에 boardDTO 담기
//			request.setAttribute("boardDTO", boardDTO);
//			// content.jsp 주소변경 없이 이동
//			dispatcher = request.getRequestDispatcher("/board/review/content.jsp");
//			dispatcher.forward(request, response);
//			
//		} // reviewContent
		
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
		
		if(sPath.equals("/myReview.rbo")) {
			System.out.println("주소 : /myReview.rbo");
			int pageSize = 8;
			// 페이지 번호
			String pageNum = request.getParameter("pageNum");
			// 페이지 번호 없으면 1페이지 설정
			if(pageNum == null) {
				pageNum ="1";
			}
			// 페이지 번호를 정수형으로 변경
			int currentPage = Integer.parseInt(pageNum);
			PageDTO pageDTO = new PageDTO();
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			pageDTO.setCurrentPage(currentPage);
			
			// BoardService 객체생성
			boardService = new ReviewBoardService();
			List<ReviewBoardDTO> boardList = boardService.getBoardList(pageDTO);
			request.setAttribute("boardList", boardList);
			System.out.println(boardList);
			dispatcher = request.getRequestDispatcher("member/memberInfo/myReview.jsp");
			dispatcher.forward(request, response);
		}
		
	} // process
}
