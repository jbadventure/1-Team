package com.itwillbs.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.service.HostMemberService;

public class HostMemberController extends HttpServlet {
	
	RequestDispatcher dispatcher = null;
	HostMemberService memberService = null;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HostMemberController doGet()");
		doProcess(request, response);
	}//doGet()

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HostMemberController doPost()");
		doProcess(request, response);
	}//doPost()
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HostMemberController doProcess()");
		// 가상주소 뽑아오기
		String sPath = request.getServletPath();
		System.out.println("뽑은 가상주소 : " + sPath);
		if(sPath.equals("/login.hme")) {
			// member/login/login.jsp 주소변경없이 이동
			dispatcher = request.getRequestDispatcher("member/login/login.jsp");
			dispatcher.forward(request, response);
		}
	}
}
