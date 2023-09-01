package com.itwillbs.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.dao.ClassBoardDAO;
import com.itwillbs.dao.PayDAO;
import com.itwillbs.domain.ClassBoardDTO;
import com.itwillbs.domain.PayDTO;
import com.itwillbs.domain.ReserveDTO;
import com.itwillbs.service.ClassBoardService;
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
		System.out.println("뽑은 가상주소 : " + sPath);
		
		if (sPath.equals("/pay.pa")) { // 결제페이지로 이동
			System.out.println("뽑은 가상주소 비교 : /pay.pa");
			ReserveService reserveService = new ReserveService();
			ReserveDTO reserveDTO = reserveService.getReserve(request);
			request.setAttribute("reserveDTO", reserveDTO);
			dispatcher = request.getRequestDispatcher("order/pay.jsp");
			dispatcher.forward(request, response);
		}
		
		if (sPath.equals("/payPro.pa")) { // 결제누르면 결제정보 저장
			System.out.println("뽑은 가상주소 비교 : /payPro.pa");
			request.setCharacterEncoding("utf-8");
			int reservationNum = Integer.parseInt(request.getParameter("reservationNum"));
			System.out.println(reservationNum);
			// payService 객체생성
			payService = new PayService();
			// 리턴할 형 insertPay(request) 메서드 호출
			payService.insertPay(request);
			
//			ReserveDTO reserveDTO = (ReserveDTO)request.getAttribute("reserveDTO");			
			ReserveService reserveService = new ReserveService();
			ReserveDTO reserveDTO = reserveService.getReserve(request);
			request.setAttribute("reserveDTO", reserveDTO);

			// order/reservationInfo.jsp 주소변경되면서 이동 
		//	response.sendRedirect("order/reservationInfo.jsp");   // 주문정보확인창
			
//			ClassBoardDTO boardDTO = (ClassBoardDTO)request.getAttribute("boardDTO");
//			ClassBoardService boardService = new ClassBoardService();
//			ClassBoardDTO boardDTO = boardService.getBoard(request);
			
			ClassBoardDAO boardDAO = new ClassBoardDAO();
			// boardDTO = getBoard(classNum);
			ClassBoardDTO boardDTO = boardDAO.getBoard(reserveDTO.getClassNum());
			
			request.setAttribute("boardDTO", boardDTO);
			
			System.out.println(boardDTO);
		//	PayDTO payDTO = (PayDTO)request.getAttribute("payDTO");
//			PayService payService = new PayService();
//			PayDTO payDTO = payService.getPay(request);
			
		    PayDAO payDAO = new PayDAO();
		    PayDTO payDTO = payDAO.getPayRN(reserveDTO.getReservationNum());
				    
		    
			request.setAttribute("payDTO", payDTO);

			dispatcher = request.getRequestDispatcher("order/reservationInfo.jsp");
			dispatcher.forward(request, response);
			
		}
		
		
		
		
	}// doProcess()
}// class
