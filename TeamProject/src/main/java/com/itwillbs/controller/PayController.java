package com.itwillbs.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.service.PayService;

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
//			HttpSession session = request.getSession();
//			String classFile = (String)session.getAttribute("classFile");
//			String classSubject = (String)session.getAttribute("classSubject");
			dispatcher = request.getRequestDispatcher("order/pay.jsp");
			dispatcher.forward(request, response);
		}
		
		if (sPath.equals("/payPro.pa")) { // 결제페이지로 이동
			dispatcher = request.getRequestDispatcher("order/reservationInfo.jsp");
			dispatcher.forward(request, response);
		}
		
		
		
		
	}// doProcess()
}// class
