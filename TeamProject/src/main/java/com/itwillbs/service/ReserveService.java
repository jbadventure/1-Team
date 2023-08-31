package com.itwillbs.service;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.itwillbs.dao.ReserveDAO;
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
			String payCompelete = request.getParameter("payCompelete");
			//DTO 객체생성
			reserveDAO = new ReserveDAO();
			ReserveDTO reserveDTO = new ReserveDTO();
			HttpSession session = request.getSession();
			// set메서드 호출 파라미터값 저장
			reserveDTO.setClassNum(classNum);
			reserveDTO.setReservationDate(reservationDate);
			reserveDTO.setReservationId(session.getAttribute("memberId").toString());
			reserveDTO.setReservationAmount(reservationAmount);
			reserveDTO.setPayComplete(payCompelete);
			
			reserveDAO.insertReserve(reserveDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	} //insertReserve

}
