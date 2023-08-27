package com.itwillbs.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.domain.ClassBoardDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.ClassBoardService;

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
			// 한페이지에 출력될 게시물 수 pageSize
			int pageSize = 6;
			//페이지 번호
			String pageNum = request.getParameter("pageNum");
			// 페이지 번호 없으면 1페이지 설정 
			if(pageNum == null) {
				pageNum = "1";
			}
			// 페이지 번호를 정수형으로 변겅
			 int currentPage = Integer.parseInt(pageNum);
				
			 PageDTO pageDTO = new PageDTO();
			 pageDTO.setPageSize(pageSize);
			 pageDTO.setPageNum(pageNum);
			 pageDTO.setCurrentPage(currentPage);
			
			//ClassBoardService 객체생성 
			boardService = new ClassBoardService();
			List<ClassBoardDTO> boardList = boardService.getBoardList(pageDTO); 
			
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
			dispatcher = request.getRequestDispatcher("board/class/list.jsp");
			dispatcher.forward(request, response);
			} // list 
		
		if (sPath.equals("/classWrite.cbo")) { // 클래스 등록
			// 주소변경없이 이동 board/class/write.jsp
			dispatcher = request.getRequestDispatcher("board/class/write.jsp");
			dispatcher.forward(request, response);
		} // classWrite 
		
		if(sPath.equals("/classWritePro.cbo")) {
			System.out.println("뽑은가상주소비교 :/classWritePro.cbo");
			// ClassBoardService 객체생성
			boardService = new ClassBoardService();
			// 리턴할 형 insertBoard(request) 메서드 호출
			boardService.insertBoard(request);
			// classList.cbo 주소변경되면서 이동 
			response.sendRedirect("classList.cbo");
		} // classWritePro
		
		if(sPath.equals("/classContent.cbo")) { // 클래스 리스트에서 게시물 클릭하면 글내용보기 
			System.out.println("뽑은 가상주소 비교  : /classContent.cbo");
			// BoardService 객체생성
			boardService = new ClassBoardService();
			ClassBoardDTO boardDTO = boardService.getBoard(request);
			request.setAttribute("boardDTO", boardDTO);
			dispatcher = request.getRequestDispatcher("board/class/content.jsp");
			dispatcher.forward(request, response);
		}// classContent
		
		if(sPath.equals("/classUpdate.cbo")) { // 클래스 수정
			// BoardService 객체생성
			boardService = new ClassBoardService();
			// ClassBoardDTO boardDTO  = getBoard(request) 메서드 호출
			ClassBoardDTO boardDTO = boardService.getBoard(request);
			// request 데이터(boardDTO) 담아서
			request.setAttribute("boardDTO", boardDTO);
			// 수정하면 board/class/update.jsp 이동
			dispatcher = request.getRequestDispatcher("board/class/update.jsp");
			dispatcher.forward(request, response);
		} // classUpdate
		
		if(sPath.equals("/classUpdatePro.cbo")) {
			// BoardService 객체생성
			boardService = new ClassBoardService();
			// updateBoard(request) 호출
			boardService.updateBoard(request);
			// 주소 변경되면서 list.bo 이동 
			response.sendRedirect("classList.cbo");
		} // classUpdatePro
		
		if(sPath.equals("/classDelete.cbo")) { // 클래스 삭제
			// BoardService 객체생성
			boardService = new ClassBoardService();
			//  deleteBoard(request) 호출
			boardService.deleteBoard(request);
			// 주소 변경되면서 list.bo 이동 
			response.sendRedirect("list.bo");
		} // classDelete
		
		
		
	} // doProcess
}// class
