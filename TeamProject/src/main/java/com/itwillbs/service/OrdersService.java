package com.itwillbs.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.itwillbs.dao.OrdersDAO;
import com.itwillbs.domain.OrdersDTO;

public class OrdersService {

	OrdersDAO ordersDAO = null;

	public void insertOrders(HttpServletRequest request) {
		System.out.println("OrdersService insertOrders()");
		try {
			// request 한글처리 
			request.setCharacterEncoding("utf-8");
			// request id, pass,name 가져와서 -> 변수에 저장 
			int classPrice = Integer.parseInt(request.getParameter("classPrice"));
			int classNum = Integer.parseInt(request.getParameter("classNum"));
			String ordersDate = request.getParameter("ordersDate");
			int ordersAmount = Integer.parseInt(request.getParameter("ordersAmount"));
			//DTO 객체생성
			ordersDAO = new OrdersDAO();
			OrdersDTO ordersDTO = new OrdersDTO();
			HttpSession session = request.getSession();
			// set메서드 호출 파라미터값 저장
			ordersDTO.setClassNum(classNum);
			ordersDTO.setOrdersDate(ordersDate);
			ordersDTO.setOrdersId(session.getAttribute("memberId").toString());
			ordersDTO.setOrdersAmount(ordersAmount);
			ordersDTO.setTotalPrice(classPrice*ordersAmount);
			
			ordersDAO.insertOrders(ordersDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}// insertOrders

	public OrdersDTO getOrders(HttpServletRequest request) {
		System.out.println("OrdersService getOrders()");
		OrdersDTO ordersDTO = null;
		try {
			// request 한글처리 
			request.setCharacterEncoding("utf-8");
			// request에 classNum 파라미터 값 가져오기
			int ordersNum = Integer.parseInt(request.getParameter("ordersNum"));
			System.out.println(ordersNum);
			// BoardDAO 객체생성 
			ordersDAO = new OrdersDAO();
			// boardDTO = getBoard(classNum);
			ordersDTO = ordersDAO.getOrders(ordersNum);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ordersDTO;
	} // getOrders

	public int getMaxNum() {
		int ordersNum = 0;
		try {
			ordersDAO = new OrdersDAO();
			ordersNum = ordersDAO.getMaxNum();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ordersNum;
	}// getMaxNum

	public void insertPay(HttpServletRequest request) {
		System.out.println("OrdersService insertPay()");
		try {
			// request 한글처리 
			request.setCharacterEncoding("utf-8");
			// request id, pass,name 가져와서 -> 변수에 저장 
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String payDate = sdf.format(System.currentTimeMillis());
			String payMethod = request.getParameter("payMethod");
			System.out.println(payMethod);
			//DTO 객체생성
			ordersDAO = new OrdersDAO();
			int ordersNum = ordersDAO.getMaxNum();
			OrdersDTO ordersDTO = new OrdersDTO();
			// set메서드 호출 파라미터값 저장
			ordersDTO.setPayDate(payDate);
			ordersDTO.setPayMethod(payMethod);
			ordersDTO.setOrdersNum(ordersNum);
			
			ordersDAO.insertPay(ordersDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}// insertPay


		
	
	
	
	
	
}
