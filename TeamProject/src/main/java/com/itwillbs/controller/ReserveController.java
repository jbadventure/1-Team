package com.itwillbs.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.service.ReserveService;
import com.itwillbs.service.ClassBoardService;

public class ReserveController extends HttpServlet{
	
	RequestDispatcher dispatcher =null;
	ReserveService reserveService = null;

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
		System.out.println("ReservationController doProcess()");
		String sPath = request.getServletPath();
		System.out.println("뽑은 가상주소"+sPath);
		
		if(sPath.equals("/order.re")) {
			System.out.println("뽑은가상주소비교 :/order.re");
			HttpSession session = request.getSession();
			String classFile = (String)session.getAttribute("classFile");
			String classSubject = (String)session.getAttribute("classSubject");
			System.out.println(classSubject);
			// BoardService 객체생성 
			reserveService = new ReserveService();
			// 리턴할 형 insertBoard(request) 메서드 호출
			reserveService.insertReserve(request);
			// pay.pa 주소변경되면서 이동 
			response.sendRedirect("pay.pa");
		}

		
	}
}
