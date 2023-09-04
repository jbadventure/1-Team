package com.itwillbs.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.dao.QuestionBoardDAO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.QuestionBoardDTO;
import com.itwillbs.domain.ReviewBoardDTO;
import com.itwillbs.service.QuestionBoardService;

public class QuestionBoardController extends HttpServlet{
	
	RequestDispatcher dispatcher = null;
	QuestionBoardService boardService = null;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("QuestionBoardController doGet()");
		doProcess(request, response);
	}//doGet()

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("QuestionBoardController doPost()");
		doProcess(request, response);
	}//doPost()
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("QuestionBoardController doProcess()");
		String sPath = request.getServletPath();
		System.out.println("뽑은 주소 :" + sPath);
		
		if(sPath.equals("/questionList.qbo")){
			// 한페이지에 출력될 게시물 수 pageSize
			int pageSize = 10;
			// 페이지 번호
			String pageNum = request.getParameter("pageNum");
			// 페이지 번호 없으면 1페이지 설정
			if(pageNum == null) {
				pageNum = "1";
			}
			// 번호 정수형으로 변경
			int currentPage = Integer.parseInt(pageNum);
			
			PageDTO pageDTO = new PageDTO();
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			pageDTO.setCurrentPage(currentPage);
			
			// BoardService 객체생성
			boardService = new QuestionBoardService();
			List<QuestionBoardDTO>boardList = boardService.getBoardList(pageDTO);
			
			// 게시판 전체 글 개수 구하기
			int count = boardService.getBoardCount();
			// 한화면에 출력될 페이지개수  pageBlock
			int pageBlock = 10;
			// 시작하는 페이지번호 startPage
			int startPage=(currentPage-1)/pageBlock*pageBlock+1;
			// 끝나는페이지번호 endPage
			int endPage=startPage+pageBlock-1;
			int pageCount = count/pageSize + (count%pageSize==0?0:1);
						
			if(endPage >pageCount) {
				endPage = pageCount; 
			}
						
			// pageDTO에 저장  
			pageDTO.setCount(count);
			pageDTO.setPageBlock(pageBlock);
			pageDTO.setStartPage(startPage);
			pageDTO.setEndPage(endPage);
			pageDTO.setPageCount(pageCount);
						
						
			request.setAttribute("boardList", boardList);
			request.setAttribute("pageDTO", pageDTO);
						
			System.out.println(boardList);
			dispatcher = request.getRequestDispatcher("board/question/list.jsp");
			dispatcher.forward(request, response);
			} // list 
					
		if (sPath.equals("/questionWrite.qbo")) { 
			// 주소변경없이 이동 board/question/write.jsp
			dispatcher = request.getRequestDispatcher("board/question/write.jsp");
			dispatcher.forward(request, response);
		} // questionWrite
			
		if(sPath.equals("/questionWritePro.qbo")) {
			System.out.println("주소 비교 : /questionWritePro.qbo");
			// BoardService 객체생성
			boardService = new QuestionBoardService();
			// insertBoard(request) 호출
			boardService.insertBoard(request);
			// 주소변경되면서 이동
			response.sendRedirect("questionList.qbo");
				
		} // questionWritePro
		
		if(sPath.equals("/questionContent.qbo")) {
			System.out.println("주소 비교 : /questionContent.qbo");
			// boardService 객체생성
			boardService = new QuestionBoardService();
			// getBoard(request) 호출
			QuestionBoardDTO boardDTO = boardService.getBoard(request);
			request.setAttribute("boardDTO", boardDTO);
			// 주소 변경 없이 이동
			dispatcher = request.getRequestDispatcher("board/question/content.jsp");
			dispatcher.forward(request, response);
		} // questionContent
		
		if(sPath.equals("/questionUpdate.qbo")) {
			System.out.println("주소 비교 : /questionUpdate.qbo");
			// boardService 객체생성
			boardService = new QuestionBoardService();
			// updateBoard(request) 호출
			boardService.updateBoard(request);
			// 주소 변경되면서 이동
			response.sendRedirect("questionList.qbo");
		} // questionUpdate
		
		if(sPath.equals("/questionDelete.qbo")) {
			// boardService 객체생성
			boardService = new QuestionBoardService();
			// deleteBoard(request) 호출
			boardService.deleteBoard(request);
			// 주소 변경되면서 이동
			response.sendRedirect("questionList.qbo");
		}
		
	} // doProcess
}
