package com.itwillbs.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.domain.NoticeBoardDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.QuestionBoardDTO;
import com.itwillbs.service.NoticeBoardService;
import com.itwillbs.service.QuestionBoardService;

public class NoticeBoardController extends HttpServlet {

	RequestDispatcher dispatcher = null;
	NoticeBoardService boardService = null;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("NoticeBoardController doGet()");
		doProcess(request, response);
	}// doGet()

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("NoticeBoardController doPost()");
		doProcess(request, response);
	}// doPost()

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("NoticeBoardController doProcess()");
		String sPath = request.getServletPath();
		System.out.println("뽑은 가상주소 : " + sPath);

		if (sPath.equals("/noticeList.nbo")) {
			// 한페이지에 출력될 게시물 수 pageSize
			int pageSize = 8;
			// 페이지 번호
			String pageNum = request.getParameter("pageNum");
			// 페이지 번호 없으면 1페이지 설정
			if (pageNum == null) {
				pageNum = "1";
			}
			// 번호 정수형으로 변경
			int currentPage = Integer.parseInt(pageNum);

			PageDTO pageDTO = new PageDTO();
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			pageDTO.setCurrentPage(currentPage);

			// BoardService 객체생성
			boardService = new NoticeBoardService();
			List<NoticeBoardDTO> boardList = boardService.getBoardList(pageDTO);

			// 게시판 전체 글 개수 구하기
			int count = boardService.getBoardCount();
			// 한화면에 출력될 페이지개수 pageBlock
			int pageBlock = 5;
			// 시작하는 페이지번호 startPage
			int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
			// 끝나는페이지번호 endPage
			int endPage = startPage + pageBlock - 1;
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);

			if (endPage > pageCount) {
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
			dispatcher = request.getRequestDispatcher("board/notice/list.jsp");
			dispatcher.forward(request, response);
		} // list

		if (sPath.equals("/questionWrite.qbo")) {
			// 주소변경없이 이동 board/question/write.jsp
			dispatcher = request.getRequestDispatcher("board/question/write.jsp");
			dispatcher.forward(request, response);
		} // questionWrite
		if (sPath.equals("/noticeWrite.nbo")) {
			dispatcher = request.getRequestDispatcher("/board/notice/write.jsp");
			dispatcher.forward(request, response);
		} // write
		if (sPath.equals("/noticeWritePro.nbo")) {
			request.setCharacterEncoding("utf-8");
			boardService = new NoticeBoardService();
			boardService.insertBoard(request);
			response.sendRedirect("noticeList.nbo");
		} // writepro

		if (sPath.equals("/noticeContent.nbo")) {
			System.out.println("뽑은 가상주소 비교 : /noticeContent.nbo");
			System.out.println(request.getParameter("noticeNum"));
			boardService = new NoticeBoardService();
//			boardService.updateReadcount(request);
			NoticeBoardDTO boardDTO = boardService.getBoard(request);
			request.setAttribute("boardDTO", boardDTO);
			dispatcher = request.getRequestDispatcher("/board/notice/content.jsp");
			dispatcher.forward(request, response);
		} // content

		if (sPath.equals("/noticeUpdate.nbo")) {
			boardService = new NoticeBoardService();
			NoticeBoardDTO boardDTO = boardService.getBoard(request);
			request.setAttribute("boardDTO", boardDTO);
			dispatcher = request.getRequestDispatcher("/board/notice/update.jsp");
			dispatcher.forward(request, response);
		} // update

		if (sPath.equals("/noticeUpdatePro.nbo")) {
			boardService = new NoticeBoardService();
			boardService.updateBoard(request);
			response.sendRedirect("noticeList.nbo");
		} // updatePro

		if (sPath.equals("/noticeDelete.nbo")) {
			boardService = new NoticeBoardService();
			boardService.deleteBoard(request);
			response.sendRedirect("noticeList.nbo");

		} // delete

	}
}
