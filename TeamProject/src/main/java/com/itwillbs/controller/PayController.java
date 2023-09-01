package com.itwillbs.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.domain.ReserveDTO;
import com.itwillbs.service.PayService;
import com.itwillbs.service.ReserveService;

public class PayController extends HttpServlet {
	
	RequestDispatcher dispatcher =null;
	PayService payService = null;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("PayController doGet()");
		doProcess(request, response);
	}// doGet()

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("PayController doPost()");
		doProcess(request, response);
	}// doPost()
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("PayController doProcess()");
		String sPath = request.getServletPath();
		System.out.println("뽑은 가상주소"+sPath);
		
		if (sPath.equals("/pay.pa")) { // 결제페이지로 이동
			System.out.println("뽑은 가상주소 비교  : /pay.pa");
//			request.setCharacterEncoding("utf-8");
//			int reservationNum = Integer.parseInt(request.getParameter("reservationNum"));
//			HttpSession session = request.getSession();
//			int reservationNum = (int) session.getAttribute("reservationNum");
//			session.setAttribute("reservationNum", reservationNum);
//			System.out.println(reservationNum);
			ReserveService reserveService = new ReserveService();
			ReserveDTO reserveDTO = reserveService.getReserve(request);
			request.setAttribute("reserveDTO", reserveDTO);
			dispatcher = request.getRequestDispatcher("order/pay.jsp");
			dispatcher.forward(request, response);
		}
		
		if (sPath.equals("/payPro.pa")) { // 결제페이지로 이동
			System.out.println("뽑은 가상주소 비교  : /payPro.pa");
			request.setCharacterEncoding("utf-8");
			int reservationNum = Integer.parseInt(request.getParameter("reservationNum"));
			HttpSession session = request.getSession();
			session.setAttribute("reservationNum", reservationNum);
			// payService 객체생성
			payService = new PayService();
			// 리턴할 형 insertPay(request) 메서드 호출
			payService.insertPay(request);
			// classList.cbo 주소변경되면서 이동 
						
			dispatcher = request.getRequestDispatcher("order/reservationInfo.jsp");
			dispatcher.forward(request, response);
		}
		
		
		
		
	}// doProcess()
}// class
