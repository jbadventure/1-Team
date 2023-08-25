package com.itwillbs.service;

import javax.servlet.http.HttpServletRequest;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.MemberDTO;

public class MemberService {
	MemberDAO memberDAO = null; 
	
	public MemberDTO userCheck(HttpServletRequest request) {
		System.out.println("MemberService userCheck()");
		// MemberDTO memberDTO 변수 선언 => 초기값 null
		MemberDTO memberDTO = null;
		try {
			// request 한글처리
			request.setCharacterEncoding("utf-8");
			
			//사용자가 입력한 정보를 http가 들고와서 서버에 request 에 저장
			//request에 저장된 id, pass 가져와서 -> 변수에 저장
			String memberId = request.getParameter("memberId");
			String memberPassword = request.getParameter("memberPassword");
			
			// MemberDTO2 저장
			MemberDTO memberDTO2 = new MemberDTO();
			memberDTO2.setMemberId(memberId);
			memberDTO2.setMemberPassword(memberPassword);
			
			// MemberDAO 객체생성
			memberDAO = new MemberDAO();
			// memberDTO = userCheck(memberDTO2) 메서드 호출
			memberDTO = memberDAO.userCheck(memberDTO2);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberDTO;
	}// userCheck() 
	
	
	public MemberDTO userinfoCheck(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}
}
