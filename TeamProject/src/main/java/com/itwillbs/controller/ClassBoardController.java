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
		System.out.println("뽑은 가상주소 : " + sPath);
		
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
			int pageBlock = 5;
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
			
			// 엔터(\r\n)를 <br>태그로 바꾸기 
			String content=boardDTO.getClassContent();
			content=content.replace("\r\n", "<br>");
			boardDTO.setClassContent(content);
			
			List<ReviewBoardDTO> reviewboardList = boardService.getReviewBoardList(request);
			request.setAttribute("boardDTO", boardDTO);
			request.setAttribute("reviewboardList", reviewboardList);
			dispatcher = request.getRequestDispatcher("board/class/content.jsp");
			dispatcher.forward(request, response);
		}// classContent
		
		if(sPath.equals("/classUpdate.cbo")) { // 클래스 수정
			System.out.println("뽑은 가상주소 비교  : /classUpdate.cbo");
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
			System.out.println("뽑은 가상주소 비교  : /classUpdatePro.cbo");
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
			response.sendRedirect("classList.cbo");
		} // classDelete 
		
		if(sPath.equals("/classManagement.cbo")) {
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
					dispatcher = request.getRequestDispatcher("member/memberInfo/classManagement.jsp");
					dispatcher.forward(request, response);
		}
		
		if(sPath.equals("/listSearch.cbo")) {
			System.out.println("뽑은 가상주소 비교 : /listSearch.cbo");
			// request 한글처리
			request.setCharacterEncoding("utf-8");
			//request 검색어 뽑아오기
			String search = request.getParameter("search");
			
			// 한페이지에서 보여지는 글개수 설정
			int pageSize=6;
			// 페이지번호 
			String pageNum=request.getParameter("pageNum");
			// 페이지번호가 없으면 1페이지 설정
			if(pageNum == null) {
				pageNum = "1";
			}
			// 페이지 번호를 => 정수형 변경
			int currentPage = Integer.parseInt(pageNum);
			
			PageDTO pageDTO = new PageDTO();
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			pageDTO.setCurrentPage(currentPage);
			//검색어 저장
			pageDTO.setSearch(search);
			
			// BoardService 객체생성
			boardService = new ClassBoardService();
// List<BoardDTO> boardList = getBoardList(); 메서드 호출
			List<ClassBoardDTO> boardList=boardService.getBoardListSearch(pageDTO);
			
			// 게시판 전체 글 개수 구하기 
			int count = boardService.getBoardCountSearch(pageDTO);
			// 한화면에 보여줄 페이지개수 설정
			int pageBlock = 10;
			// 시작하는 페이지번호
			// currentPage  pageBlock  => startPage
			//   1~10(0~9)      10     =>  (0~9)/10*10+1=>0*10+1=> 0+1=> 1 
			//   11~20(10~19)   10     =>  (10~19)/10*10+1=>1*10+1=>10+1=>11
			//   21~30(20~29)   10     =>  (20~29)/10*10+1=>2*10+1=>20+1=>21
			int startPage=(currentPage-1)/pageBlock*pageBlock+1;
			// 끝나는페이지번호
			//  startPage   pageBlock => endPage
			//     1            10    =>   10
			//     11           10    =>   20
			//     21           10    =>   30
			int endPage=startPage+pageBlock-1;
			// 계산한값 endPage 10 => 전체페이지 2
			// 전체페이지 구하기
			// 글개수 50  한화면에 보여줄글개수 10 => 페이지수 5 + 0
			// 글개수 57  한화면에 보여줄글개수 10 => 페이지수 5 + 1
			int pageCount = count / pageSize + (count % pageSize==0?0:1);
			if(endPage > pageCount) {
				endPage = pageCount;
			}
			
			//pageDTO 저장
			pageDTO.setCount(count);
			pageDTO.setPageBlock(pageBlock);
			pageDTO.setStartPage(startPage);
			pageDTO.setEndPage(endPage);
			pageDTO.setPageCount(pageCount);
			
			// request에 "boardList",boardList 저장
			request.setAttribute("boardList", boardList);
			request.setAttribute("pageDTO", pageDTO);
			
			// 주소변경없이 이동 center/noticeSearch.jsp
			dispatcher 
		    = request.getRequestDispatcher("board/class/list.jsp");
		dispatcher.forward(request, response);
		}
		
		if (sPath.equals("/classListCategory.cbo")) { // 메인에서 클래스테스트 누르면 클래스 리스트 보여줌 
			System.out.println("뽑은 가상주소 비교 : /classListCategory.cbo");
			// 메인페이지 카테고리 창에서 받아옴
			String classCategory = request.getParameter("classCategory");
			HttpSession session = request.getSession();
			session.setAttribute("classCategory", classCategory);
			System.out.println(classCategory);
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
			List<ClassBoardDTO> boardList = boardService.getBoardList(pageDTO, classCategory); 
			
			// 게시판 전체 글 개수 구하기 
			System.out.println(classCategory);
			int count = boardService.getBoardCount(classCategory);
			// 한화면에 출력될 페이지개수  pageBlock
			int pageBlock = 5;
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
			
//			request.setAttribute("classCategory", classCategory);
			request.setAttribute("boardList", boardList);
			request.setAttribute("pageDTO", pageDTO);
			
			System.out.println(boardList);
			dispatcher = request.getRequestDispatcher("board/class/listcategory.jsp");
			dispatcher.forward(request, response);
			} // list 
		
		
		
		
	} // doProcess
}// class
