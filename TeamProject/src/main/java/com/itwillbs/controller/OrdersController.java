package com.itwillbs.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.domain.OrdersDTO;
import com.itwillbs.service.OrdersService;

public class OrdersController extends HttpServlet {
	
	RequestDispatcher dispatcher =null;
	OrdersService ordersService = null;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("OrdersController doProcess()");
		String sPath = request.getServletPath();
		System.out.println("뽑은 가상주소 : " + sPath);
		
		if(sPath.equals("/reserve.or")) {
			System.out.println("뽑은가상주소비교 :/reserve.or");
			request.setCharacterEncoding("utf-8");
			String classFile = request.getParameter("classFile");
			String classSubject = request.getParameter("classSubject");
			int classPrice = Integer.parseInt(request.getParameter("classPrice"));
			HttpSession session = request.getSession();
			session.setAttribute("classFile", classFile);
			session.setAttribute("classSubject", classSubject);
			session.setAttribute("classPrice", classPrice);
			System.out.println(classFile);
			// ordersService 객체생성 
			ordersService = new OrdersService();
			// 리턴할 형 insertBoard(request) 메서드 호출
			ordersService.insertOrders(request);
			
			int ordersNum = ordersService.getMaxNum();
			
			// pay.or 주소변경되면서 이동 
			response.sendRedirect("pay.or?ordersNum="+ordersNum);
		}
		
		if (sPath.equals("/pay.or")) { // 결제페이지로 이동
			System.out.println("뽑은 가상주소 비교 : /pay.or");
			OrdersService ordersService = new OrdersService();
			OrdersDTO ordersDTO = ordersService.getOrders(request);
			request.setAttribute("ordersDTO", ordersDTO);
			// 주소변경없이 이동
			dispatcher = request.getRequestDispatcher("order/pay.jsp");
			dispatcher.forward(request, response);
		}// pay.or
		
		if (sPath.equals("/payPro.or")) { // 결제누르면 결제정보 저장
			System.out.println("뽑은 가상주소 비교 : /payPro.or");
			request.setCharacterEncoding("utf-8");
			String classSubject = request.getParameter("classSubject");
			HttpSession session = request.getSession();
			session.setAttribute("classSubject", classSubject);
			// ordersService 객체생성 
			ordersService = new OrdersService();
			// 리턴할 형 insertBoard(request) 메서드 호출
			ordersService.insertPay(request);
			int ordersNum = ordersService.getMaxNum();
			// pay.or 주소변경되면서 이동 
			response.sendRedirect("reservationInfo.or?ordersNum="+ordersNum);
		}// payPro.or
		
		if (sPath.equals("/reservationInfo.or")) { // 예약내역으로 이동
			System.out.println("뽑은 가상주소 비교 : /reservationInfo.or");
			OrdersService ordersService = new OrdersService();
			OrdersDTO ordersDTO = ordersService.getOrders(request);
			request.setAttribute("ordersDTO", ordersDTO);
			// 주소변경없이 이동
			dispatcher = request.getRequestDispatcher("order/reservationInfo.jsp");
			dispatcher.forward(request, response);
		}// reservationInfo.or
		
	}//doProcess
	
}//class
