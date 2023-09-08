package com.itwillbs.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
				String phone = request.getParameter("phone");
				String emailop1 = request.getParameter("emailop1");
				String emailop2 = request.getParameter("emailop2");
				String address = request.getParameter("address");
				String memberType = request.getParameter("memberType");
				
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
				memberDTO.setMemberPhoneNum(phone);
				memberDTO.setMemberEmail(email);
				memberDTO.setMemberLocation(address);
				memberDTO.setMemberType(memberType);
				 
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
				String bNum = request.getParameter("bNum");
				String memberType = request.getParameter("memberType");
				String address = request.getParameter("address");
						
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
				memberDTO.setBusinessNum(bNum);
				memberDTO.setMemberType(memberType);
				memberDTO.setMemberLocation(address);
						
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
	
	
	public String userInfoCheck(HttpServletRequest request) {
		System.out.println("MemberService userInfoCheck()");
		String memberId = null;
		try {
			memberDAO = new MemberDAO();
			request.setCharacterEncoding("utf-8");
			String memberName = request.getParameter("memberName");
			String emailop1 = request.getParameter("emailop1");
			String emailop2 = request.getParameter("emailop2");
			String memberEmail = emailop1+'@'+emailop2;
			memberId = memberDAO.userInfoCheck(memberName,memberEmail);
			request.setAttribute("memberId", memberId);
			System.out.println(memberId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberId;
	}//userInfoCheck 


	public MemberDTO pwCheck(HttpServletRequest request) {
		System.out.println("MemberService pwCheck()");
		// MemberDTO memberDTO 변수 선언 => 초기값 null
		MemberDTO memberDTO = null;
		try {
			memberDAO = new MemberDAO();
			// request 한글처리
			request.setCharacterEncoding("utf-8");
			
			//사용자가 입력한 정보를 http가 들고와서 서버에 request 에 저장
			//request에 저장된 memberId memberName memberEmail 가져와서 -> 변수에 저장
			String memberId = request.getParameter("memberId");
			String memberName = request.getParameter("memberName");
			String emailop1 = request.getParameter("emailop1");
			String emailop2 = request.getParameter("emailop2");
			String memberEmail = emailop1+'@'+emailop2;
			System.out.println(memberId);
			System.out.println(memberName);
			System.out.println(memberEmail);
			
			MemberDTO memberDTO2 = new MemberDTO();
			memberDTO2.setMemberId(memberId);
			memberDTO2.setMemberName(memberName);
			memberDTO2.setMemberEmail(memberEmail);
			
			memberDTO = memberDAO.pwCheck(memberDTO2);
			// memberDTO = userCheck(memberDTO2) 메서드 호출
			System.out.println(memberId);
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

	public void infoType(HttpServletRequest request) {
		System.out.println("MemberService infoType()");
		try {
			// request 한글처리
			request.setCharacterEncoding("utf-8");
			// 변수에 값 담기
			String memberNickname = request.getParameter("memberNickname");
			String memberFile = request.getParameter("memberFile");
			// MemberDTO 객체생성 
			MemberDTO memberDTO = new MemberDTO();
			// set메서드 호출 파라미터값 저장
			memberDTO.setMemberNickname(memberNickname);
			memberDTO.setMemberFile(memberFile);
			// MemberDAO 객체생성
			memberDAO = new MemberDAO();
			// updateMember(memberDTO) 메서드 호출
			memberDAO.infoType(memberDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}// infoType() - 마이페이지
	
	public void updateMember(HttpServletRequest request) {
		System.out.println("MemberService updateMember()");
		try {
			request.setCharacterEncoding("utf-8");
			
			String uploadPath=request.getRealPath("/upload");
			int maxSize=10*1024*1024;
			MultipartRequest multi 
			= new MultipartRequest(request, uploadPath,maxSize,"utf-8",
					new DefaultFileRenamePolicy());
			String memberId = multi.getParameter("memberId");
			String memberFile = multi.getFilesystemName("memberFile");
			String memberNickname = multi.getParameter("memberNickname");
			String memberPhoneNum = multi.getParameter("memberPhoneNum");
			String memberEmail = multi.getParameter("memberEmail");
			String memberLocation = multi.getParameter("memberLocation");
			String businessNum = multi.getParameter("businessNum");
			if(memberFile == null) {
			//기존 파일이름 가져오기
			memberFile = multi.getParameter("oldfile");
			}
			// MemberDTO 객체생성 
			MemberDTO memberDTO = new MemberDTO();
			// set메서드 호출 파라미터값 저장
			memberDTO.setMemberId(memberId);
			memberDTO.setMemberFile(memberFile);
			memberDTO.setMemberNickname(memberNickname);
			memberDTO.setMemberPhoneNum(memberPhoneNum);
			memberDTO.setMemberEmail(memberEmail);
			memberDTO.setMemberLocation(memberLocation);
			memberDTO.setBusinessNum(businessNum);
			System.out.println(memberId);
			System.out.println(memberEmail);
			// MemberDAO 객체생성
			memberDAO = new MemberDAO();
			// updateMember(memberDTO) 메서드 호출
			memberDAO.updateMember(memberDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}// updateMember()
	
	public int getMemberCount() {
		System.out.println("MemberService getMemberCount()");
		int count=0; 
		try { 
			memberDAO = new MemberDAO();
			count = memberDAO.getMemberCount();
		} catch (Exception e) {
			e.printStackTrace();
			}
		return count;
	}//getMemberCount

	public List<MemberDTO> getAdminList(String memberType) {
		System.out.println("MemberService getAdminList()");
		List<MemberDTO> memberList = null;
		try {
			memberDAO = new MemberDAO();
			memberList = memberDAO.getAdminList(memberType);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberList;
	}// getAdminList


	public void deleteMember(HttpServletRequest request) {
		System.out.println("MemberService deleteMember()");
		try {
			// request 한글처리
			request.setCharacterEncoding("utf-8");
			// request 파라미터 가져오기(id,pass)
			String memberId = request.getParameter("memberId");
			String memberPassword = request.getParameter("memberPassword");
			// MemberDTO 객체생성 
			MemberDTO memberDTO = new MemberDTO();
			// set메서드 호출 파라미터값 저장
			memberDTO.setMemberId(memberId);
			memberDTO.setMemberPassword(memberPassword);
			// MemberDAO 객체생성
			memberDAO = new MemberDAO();
			// deleteMember(memberDTO) 메서드 호출
			memberDAO.deleteMember(memberDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//deleteMember()

}
