package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.itwillbs.dao.ClassBoardDAO;
import com.itwillbs.dao.ReserveDAO;
import com.itwillbs.domain.ClassBoardDTO;
import com.itwillbs.domain.ReserveDTO;

public class ReserveService {
	ReserveDAO reserveDAO = null;

	public void insertReserve(HttpServletRequest request) {
		System.out.println("ReserveService insertReserve()");
		try {
			// request 한글처리 
			request.setCharacterEncoding("utf-8");
			// request id, pass,name 가져와서 -> 변수에 저장 
			int classNum = Integer.parseInt(request.getParameter("classNum"));
			String reservationDate = request.getParameter("reservationDate");
			//String reservationId = request.getParameter("reservationId");
			int reservationAmount = Integer.parseInt(request.getParameter("reservationAmount"));
			//DTO 객체생성
			reserveDAO = new ReserveDAO();
			ReserveDTO reserveDTO = new ReserveDTO();
			HttpSession session = request.getSession();
			// set메서드 호출 파라미터값 저장
			reserveDTO.setClassNum(classNum);
			reserveDTO.setReservationDate(reservationDate);
			reserveDTO.setReservationId(session.getAttribute("memberId").toString());
			reserveDTO.setReservationAmount(reservationAmount);
			
			reserveDAO.insertReserve(reserveDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	} //insertReserve

	public ReserveDTO reservationComplete(HttpServletRequest request) {
		System.out.println("ReserveService reservationComplete()");
		ReserveDTO reserveDTO = null;
		try {
			// request 한글처리 
			request.setCharacterEncoding("utf-8");
			int reservationNum = Integer.parseInt(request.getParameter("reservationNum"));
			reserveDAO = new ReserveDAO();
		    reserveDTO = reserveDAO.reservationComplete(reservationNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return reserveDTO;
	}
	
	public ReserveDTO getReserve(HttpServletRequest request) {
		System.out.println("ReserveService getReserve()");
		ReserveDTO reserveDTO = null;
		try {
			// request 한글처리 
			request.setCharacterEncoding("utf-8");
//			HttpSession session = request.getSession();
//			int reservationNum = (int) session.getAttribute("reservationNum");
			
			// request에 classNum 파라미터 값 가져오기
			int reservationNum = Integer.parseInt(request.getParameter("reservationNum"));
			System.out.println(reservationNum);
			// BoardDAO 객체생성 
			reserveDAO = new ReserveDAO();
			// boardDTO = getBoard(classNum);
			reserveDTO = reserveDAO.getReserve(reservationNum);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return reserveDTO;
	} // getReserve

	public int getMaxNum() {
		int reservationNum = 0;
		try {
			reserveDAO = new ReserveDAO();
			reservationNum = reserveDAO.getMaxNum();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return reservationNum;
	}

	public List<ReserveDTO> getReserveList(String reservationId) {
		System.out.println("ReserveService getReserveList()");
		List<ReserveDTO> reserveList = null;
		try {

		 reserveDAO = new ReserveDAO();
		 reserveList = reserveDAO.getReserveList(reservationId);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return reserveList;
	}//gerReserveList

}
