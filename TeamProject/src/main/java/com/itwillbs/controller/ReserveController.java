package com.itwillbs.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.service.ReserveService;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.ReserveDTO;
import com.itwillbs.service.ClassBoardService;
import com.itwillbs.service.MemberService;

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
			request.setCharacterEncoding("utf-8");
			String classFile = request.getParameter("classFile");
			String classSubject = request.getParameter("classSubject");
			HttpSession session = request.getSession();
			session.setAttribute("classFile", classFile);
			session.setAttribute("classSubject", classSubject);
			System.out.println(classFile);
			// BoardService 객체생성 
			reserveService = new ReserveService();
			// 리턴할 형 insertBoard(request) 메서드 호출
			reserveService.insertReserve(request);
			
			int reservationNum = reserveService.getMaxNum();
			
			// pay.pa 주소변경되면서 이동 
			response.sendRedirect("pay.pa?reservationNum="+reservationNum);
		}
		
		if(sPath.equals("/orderInfo.re")){
			System.out.println("뽑은가상주소비교 :/orderInfo.re");

			// Service 객체 생성 
			reserveService = new ReserveService();
			// DTO = reservationComplete(id) 메서드 호출
			ReserveDTO reserveDTO = reserveService.reservationComplete(request);
			//info.jsp 이동할때 request에 담아서 이동 
			request.setAttribute("reserveDTO", reserveDTO);
			// 주소 변경없이 이동 => reservationInfo 이동
			dispatcher
			= request.getRequestDispatcher("order/reservationInfo.jsp");
			dispatcher.forward(request, response);
		}// 

		
	}
}
