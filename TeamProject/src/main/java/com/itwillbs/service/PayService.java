package com.itwillbs.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.itwillbs.dao.ClassBoardDAO;
import com.itwillbs.dao.PayDAO;
import com.itwillbs.domain.ClassBoardDTO;
import com.itwillbs.domain.PayDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class PayService {
	
	PayDAO payDAO = null;

	public void insertPay(HttpServletRequest request) {
		System.out.println("PayService insertBoard()");
		try {
			// request 한글처리 
			request.setCharacterEncoding("utf-8");
			// request 파라미터값 가져오기 
			int reservationNum = Integer.parseInt(request.getParameter("reservationNum"));
			int payPrice = Integer.parseInt(request.getParameter("payPrice"));
			String payMethod = request.getParameter("payMethod");
			
			// PayDAO 객체생성 
			payDAO = new PayDAO();
			// PayDTO 객체생성  
			PayDTO payDTO = new PayDTO();
			// set메서드 호출 파라미터값 저장 
			payDTO.setReservationNum(reservationNum);
			payDTO.setPayPrice(payPrice);
			payDTO.setPayMethod(payMethod);
//			HttpSession session = request.getSession();
//			boardDTO.setHostId(session.getAttribute("memberId").toString());
//			System.out.println(boardDTO.getHostId());
			// 리턴할형없음 insertPay(payDTO) 호출 
			payDAO.insertPay(payDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}// insertPay()

}
