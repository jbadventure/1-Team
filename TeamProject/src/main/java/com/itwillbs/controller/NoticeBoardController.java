package com.itwillbs.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.domain.NoticeBoardDTO;
import com.itwillbs.service.NoticeBoardService;

public class NoticeBoardController extends HttpServlet{
	
	RequestDispatcher dispatcher =null;
	NoticeBoardService boardService = null;
	

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("NoticeBoardController doGet()");
		doProcess(request, response);
	}//doGet()

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("NoticeBoardController doPost()");
		doProcess(request, response);
	}//doPost()
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("NoticeBoardController doProcess()");
		String sPath = request.getServletPath();
		System.out.println("뽑은 가상주소 : " + sPath);
		
		if (sPath.equals("/noticeList.nbo")) {
			boardService = new NoticeBoardService();
			List<NoticeBoardDTO> boardList = boardService.getBoardList();
			request.setAttribute("boardList", boardList);
			System.out.println(boardList);
			dispatcher = request.getRequestDispatcher("/board/notice/list.jsp");
			dispatcher.forward(request,response);
		} // list 
		if (sPath.equals("/noticeWrite.nbo")) {
			dispatcher = request.getRequestDispatcher("/board/notice/write.jsp");
			dispatcher.forward(request, response);
		} // write 
		if(sPath.equals("/noticeWritePro.nbo")) {
			request.setCharacterEncoding("utf-8");
			boardService = new NoticeBoardService();
			boardService.insertBoard(request);
			response.sendRedirect("noticeList.nbo");
		} //writepro
		
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
		
		if(sPath.equals("/noticeUpdate.nbo")) {
			boardService = new NoticeBoardService();
			NoticeBoardDTO boardDTO = boardService.getBoard(request);
			request.setAttribute("boardDTO", boardDTO);
			dispatcher = request.getRequestDispatcher("/board/notice/update.jsp");
			dispatcher.forward(request, response);
		} // update
		
		if(sPath.equals("/noticeUpdatePro.nbo")) {
			boardService = new NoticeBoardService();
			boardService.updateBoard(request);
			response.sendRedirect("noticeList.nbo");
		} // updatePro
		
		if(sPath.equals("/noticeDelete.nbo")) {
			boardService = new NoticeBoardService();
			boardService.deleteBoard(request);
			response.sendRedirect("noticeList.bo");
			
		} // delete
				
	}
}
