package com.itwillbs.service;

import javax.servlet.http.HttpServletRequest;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.MemberDTO;

public class MemberService {
	MemberDAO memberDAO = null; 
	
	public MemberDTO userCheck(HttpServletRequest request) {
		System.out.println("MemberService userCheck()");
		System.out.println(request.getParameter("memberId"));
		// MemberDTO memberDTO 변수 선언 => 초기값 null
		MemberDTO memberDTO = null;
		try {
			// request 한글처리
			request.setCharacterEncoding("utf-8");
			
			//사용자가 입력한 정보를 http가 들고와서 서버에 request 에 저장
			//request에 저장된 id, pass 가져와서 -> 변수에 저장
			String memberId = request.getParameter("memberId");
			String memberPassword = request.getParameter("memberPassword");
			System.out.println(memberId);
			
			// MemberDTO2 저장
			MemberDTO memberDTO2 = new MemberDTO();
			memberDTO2.setMemberId(memberId);
			memberDTO2.setMemberPassword(memberPassword);
			System.out.println(memberDTO2.getMemberId());
			System.out.println(memberDTO2.getMemberPassword());
			
			// MemberDAO 객체생성
			memberDAO = new MemberDAO();
			// memberDTO = userCheck(memberDTO2) 메서드 호출
			memberDTO = memberDAO.userCheck(memberDTO2);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberDTO;
	}// userCheck() 
	
	
	public MemberDTO userInfoCheck(HttpServletRequest request) {
		System.out.println("MemberService userInfoCheck()");
		MemberDTO memberDTO = null;
		try {
			request.setCharacterEncoding("utf-8");
			String memberName = request.getParameter("memberName");
			String memberEmail = request.getParameter("memberEmail");
			MemberDTO memberDTO3 = new MemberDTO();
			memberDTO3.setMemberName(memberName);
			memberDTO3.setMemberEmail(memberEmail);
			memberDAO = new MemberDAO();
			memberDTO=memberDAO.userInfoCheck(memberDTO3);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberDTO;
	}//userInfoCheck

	public MemberDTO pwCheck(HttpServletRequest request) {
		System.out.println("MemberService pwCheck()");
		// MemberDTO memberDTO 변수 선언 => 초기값 null
		MemberDTO memberDTO = null;
		try {
			// request 한글처리
			request.setCharacterEncoding("utf-8");
			
			//사용자가 입력한 정보를 http가 들고와서 서버에 request 에 저장
			//request에 저장된 memberId memberName memberEmail 가져와서 -> 변수에 저장
			String memberId = request.getParameter("memberId");
			String memberName = request.getParameter("memberName");
			String memberEmail = request.getParameter("memberEmail");
			
			// MemberDTO2 저장
			MemberDTO memberDTO2 = new MemberDTO();
			memberDTO2.setMemberId(memberId);
			memberDTO2.setMemberName(memberName);
			memberDTO2.setMemberEmail(memberEmail);
			
			// MemberDAO 객체생성
			memberDAO = new MemberDAO();
			// memberDTO = userCheck(memberDTO2) 메서드 호출
			memberDTO = memberDAO.pwCheck(memberDTO2);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberDTO;
	}// pwCheck


	public MemberDTO getMember(String memberId) {
		System.out.println("MemberService getMember()");
		MemberDTO memberDTO = null;
		try {
			// MemberDAO 객체생성
			memberDAO = new MemberDAO();
			// memberDTO  = getMember(memberId) 메서드 호출
			memberDTO = memberDAO.getMember(memberId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberDTO;
	}//getMember()


	public void updatePwMember(HttpServletRequest request) {
		System.out.println("MemberService updatePwMember()");
		try {
			// request 한글처리
			request.setCharacterEncoding("utf-8");
			// request 파라미터 가져오기
			String memberId = request.getParameter("memberId");
			String memberName = request.getParameter("memberName");
			String memberEmail = request.getParameter("memberEmail");
			// MemberDTO 객체생성 
			MemberDTO memberDTO = new MemberDTO();
			// set메서드 호출 파라미터값 저장
			memberDTO.setMemberId(memberId);
			memberDTO.setMemberName(memberName);
			memberDTO.setMemberEmail(memberEmail);
			// MemberDAO 객체생성
			memberDAO = new MemberDAO();
			// updateMember(memberDTO) 메서드 호출
			memberDAO.updatePwMember(memberDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//updatePwMember()	


	
}
