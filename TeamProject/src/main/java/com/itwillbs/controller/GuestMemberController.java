package com.itwillbs.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.service.GuestMemberService;

public class GuestMemberController extends HttpServlet{
	RequestDispatcher dispatcher =null;
	GuestMemberService guestMemberService = null;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GuestMemberController doGet()");
		doProcess(request, response);
	}//doGet()

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GuestMemberController doPost()");
		doProcess(request, response);
	}//doPost()
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GuestMemberController doProcess()");
		
		String sPath = request.getServletPath();
		
		System.out.println("뽑아온 가상주소 : " + sPath);
		
		if(sPath.equals("/main.gme")){
			System.out.println("뽑아온 가상주소 : " + sPath);
			dispatcher 
		    = request.getRequestDispatcher("main/main.jsp");
		dispatcher.forward(request, response);
		}
	}
}
