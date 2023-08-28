package com.itwillbs.service;

import javax.servlet.http.HttpServletRequest;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.MemberDTO;

public class MemberService {
	MemberDAO memberDAO = null;
	
	// 게스트 회원가입 insertGuset
		public void insertGuest(HttpServletRequest request) {
			System.out.println("MemberService insertGuest()");
			try {
				//사용자가 입력한 정보서버에  request 에 저장
				//request 한글처리
				request.setCharacterEncoding("utf-8");
				// request id, pass,name 가져와서 -> 변수에 저장
				String id = request.getParameter("id");
				String pass = request.getParameter("pass");
				String nick = request.getParameter("nick");
				String name = request.getParameter("name");
				String birth = request.getParameter("birth");
				String gender = request.getParameter("gender");
				String phone1 = request.getParameter("phone1");
				String phone2 = request.getParameter("phone2");
				String phone3 = request.getParameter("phone3");
				String emailop1 = request.getParameter("emailop1");
				String emailop2 = request.getParameter("emailop2");
				String address = request.getParameter("address");

				String phoneNum = phone1+phone2+phone3;
				String email = emailop1+'@'+emailop2;
				
				// MemberDTO 객체생성(기억장소 할당)
				MemberDTO memberDTO = new MemberDTO();
				// set메서드 호출 값을 저장
				memberDTO.setMemberId(id);
				memberDTO.setMemberPassword(pass);
				memberDTO.setMemberNickname(nick);
				memberDTO.setMemberName(name);
				memberDTO.setMemberBirthday(birth);
				memberDTO.setMemberGender(gender);
				memberDTO.setMemberPhoneNum(phoneNum);
				memberDTO.setMemberEmail(email);
				memberDTO.setMemberLocation(address);
				
				System.out.println(memberDTO);
				
				// MemberDAO 객체생성
				memberDAO = new MemberDAO();
				// insertMember() 메서드 정의 
			// => MemberDTO 데이터(id,pass,name,date)가 저장된 주소값을 들고감 
				memberDAO.insertGuest(memberDTO);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}// insertGuset
	
	// insertHost
	public void insertHost(HttpServletRequest request) {
		System.out.println("MemberService insertHost()");
				
		try {
			// 사용자가 입력한 정보(id, pass, name 등)를 http(insertProHost.jsp)가 들고와서 서버 request에 저장
			// request 한글처리
			request.setCharacterEncoding("utf-8");
					
			// request에 저장된 id, pass, name 등을 가져와 변수에 저장
			String id = request.getParameter("id");
			String pass = request.getParameter("pass");
			String nick = request.getParameter("nick");
			String name = request.getParameter("name");
			String birth = request.getParameter("birth");
			String gender = request.getParameter("gender");
			String phone1 = request.getParameter("phone1");
			String phone2 = request.getParameter("phone2");
			String phone3 = request.getParameter("phone3");
			String emailop1 = request.getParameter("emailop1");
			String emailop2 = request.getParameter("emailop2");
			String address = request.getParameter("address");
			String bNum = request.getParameter("bNum");
					
			String phoneNum = phone1 + phone2 + phone3;
			String email = emailop1 + '@' + emailop2;
					
			// id, pass, name 등을 MemberDTO 파일(바구니)에 저장 : MemberDTO 객체생성 후 set메서드로 값 저장
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setMemberId(id);
			memberDTO.setMemberPassword(pass);
			memberDTO.setMemberNickname(nick);
			memberDTO.setMemberName(name);
			memberDTO.setMemberBirthday(birth);
			memberDTO.setMemberGender(gender);
			memberDTO.setMemberPhoneNum(phoneNum);
			memberDTO.setMemberEmail(email);
			memberDTO.setMemberLocation(address);
			memberDTO.setBusinessNum(bNum);
					
			// MemberDAO 객체생성 후 insertMember() 메서드 정의 : MemberDTO 데이터(id,pass,name 등)가 저장된 주소값을 들고감
			memberDAO = new MemberDAO();
			memberDAO.insertHost(memberDTO);
					
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
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
	
	public MemberDTO getMemberNick(String memberNickname) {
		System.out.println("MemberService getMemberNick()");
		MemberDTO memberDTO = null;
		try {
			// MemberDAO 객체생성
			memberDAO = new MemberDAO();
			// memberDTO  = getMember(memberId) 메서드 호출
			memberDTO = memberDAO.getMemberNick(memberNickname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberDTO;
	}// getMemberNick


	public void updatePwMember(HttpServletRequest request) {
		System.out.println("MemberService updatePwMember()");
		System.out.println(request.getParameter("memberId"));
		try {
			// request 한글처리
			request.setCharacterEncoding("utf-8");
			// 변수에 값 담기
			String memberId = request.getParameter("memberId");
			String memberPassword = request.getParameter("memberPassword");
			System.out.println(memberId);
			// MemberDTO 객체생성 
			MemberDTO memberDTO = new MemberDTO();
			// set메서드 호출 파라미터값 저장
			memberDTO.setMemberId(memberId);
			memberDTO.setMemberPassword(memberPassword);
			// MemberDAO 객체생성
			memberDAO = new MemberDAO();
			// updateMember(memberDTO) 메서드 호출
			memberDAO.updatePwMember(memberDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//updatePwMember()	



	
}
