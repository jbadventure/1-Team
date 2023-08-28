package com.itwillbs.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.NoticeBoardService;

public class MemberController extends HttpServlet {
	RequestDispatcher dispatcher = null;
	MemberService memberService = null;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("MemberController doGet()");
		doProcess(request, response);
	}// doGet()

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("MemberController doPost()");
		doProcess(request, response);
	}// doPost()

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("MemberController doProcess()");
		// 가상주소 뽑아오기
		String sPath = request.getServletPath();
		System.out.println("뽑아온 가상주소 : " + sPath);

		if (sPath.equals("/main.me")) {
			dispatcher = request.getRequestDispatcher("main/main.jsp");
			dispatcher.forward(request, response);
		} // main.me

		// 게스트 회원가입
		if (sPath.equals("/insertGuest.me")) {
			// 주소가 변경되지 않으면서 이동
			// request, response 정보도 들고 이동
			dispatcher = request.getRequestDispatcher("member/join/insertGuest.jsp");
			dispatcher.forward(request, response);
		} // insert.me

		if (sPath.equals("/insertProGuest.me")) {
			System.out.println("뽑은 가상주소 비교 : /insertProGuest.me");
			// MemberService 객체생성
			memberService = new MemberService();
			// insertGuest() 메서드 호출
			memberService.insertGuest(request);
			// 로그인 이동 => 주소변경하면서 이동
			response.sendRedirect("main.me");
		}

		// 호스트 회원가입
		if (sPath.equals("/insertHost.me")) {
			// forward 방식 : 주소가 변경되지 않으면서 request, response 정보를 들고 이동
			dispatcher = request.getRequestDispatcher("member/join/insertHost.jsp");
			dispatcher.forward(request, response);
		}

		if (sPath.equals("/insertProHost.me")) {
			System.out.println("주소 비교 : /insertProHost.me");
			memberService = new MemberService();
			memberService.insertHost(request);
			response.sendRedirect("main.me");
		}
		
			//아이디 중복체크
			if(sPath.equals("/idCheck.me")) {
				System.out.println("뽑은 가상주소 비교 : /idCheck.me");
				String memberId = request.getParameter("memberId");
				System.out.println("받은 아이디 : " + memberId);
				// MemberService 객체생성
				memberService = new MemberService();
				// getMember() 메서드 호출
				MemberDTO memberDTO = memberService.getMember(memberId);
				String result="";
				if(memberDTO != null) {
					//아이디 있음 => 아이디 중복
					System.out.println("아이디 있음 => 아이디 중복");
					result = "중복되는 아이디입니다";
				}else {
					//아이디 없음 => 아이디 사용가능
					System.out.println("아이디 없음 => 아이디 사용가능");
					result = "사용가능한 아이디입니다";
				}
					//이동하지 않고 =>결과 웹에 출력 => 출력 결과를 가지고 되돌아감
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter printWriter = response.getWriter();
					printWriter.println(result);
					printWriter.close();
				}//idCheck.me
				
			// 닉네임 중복체크
			if(sPath.equals("/nickCheck.me")) {
				System.out.println("뽑은 가상주소 비교 : /nickCheck.me");
				String memberNickname = request.getParameter("memberNickname");
				System.out.println("받은 아이디 : " + memberNickname);
				// MemberService 객체생성
				memberService = new MemberService();
				// getMember() 메서드 호출
				MemberDTO memberDTO = memberService.getMemberNick(memberNickname);
				String result="";
				if(memberDTO != null) {
					//아이디 있음 => 아이디 중복
					System.out.println("닉네임 있음 => 닉네임 중복");
					result = "중복되는 닉네임입니다";
				}else {
					//아이디 없음 => 아이디 사용가능
					System.out.println("닉네임 없음 => 닉네임 사용가능");
					result = "사용가능한 닉네임입니다";
				}
					//이동하지 않고 =>결과 웹에 출력 => 출력 결과를 가지고 되돌아감
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter printWriter = response.getWriter();
					printWriter.println(result);
					printWriter.close();
					
				}//nickCheck.me

		if (sPath.equals("/login.me")) {
			// member/login/login.jsp 주소변경없이 이동
			dispatcher = request.getRequestDispatcher("member/login/login.jsp");
			dispatcher.forward(request, response);
		} // login.me

		if (sPath.equals("/loginPro.me")) {
			System.out.println("뽑은 가상주소 비교 : /loginPro.me");

			// MemberService 객체생성
			memberService = new MemberService();

			// MemberDTO memberDTO = userCheck(request) 메서드 호출
			MemberDTO memberDTO = memberService.userCheck(request);

			if (memberDTO != null) {
				// 아이디 비밀번호 일치 -> 로그인(세션에 로그인값 저장) -> main.me 이동
				System.out.println(memberDTO);
				System.out.println("아이디 비밀번호 일치");
				// 세션 객체생성 => 세션 기억장소 안에 로그인값 저장
				HttpSession session = request.getSession();
				session.setAttribute("memberId", memberDTO.getMemberId());
				// 주소 변경하면서 이동 -> 가상주소 main.me 이동
				response.sendRedirect("main.me");
			} else {
				// 아이디 비밀번호 불일치 -> 아이디, 비밀번호 불일치 메세지, 뒤로이동
				System.out.println(memberDTO);
				System.out.println("아이디 비밀번호 불일치");
				// member/msg.jsp 주소변경없이 이동
				dispatcher = request.getRequestDispatcher("member/msg.jsp");
				dispatcher.forward(request, response);
			}
		} // loginPro.me

		if (sPath.equals("/logout.me")) {
			// 세션값 전체 삭제
			HttpSession session = request.getSession();
			session.invalidate();
			// main.me 주소변경하면서 이동
			response.sendRedirect("main.me");

		} // logout.me

		if (sPath.equals("/ghselect.me")) { // 회원가입 페이지로
			// member/join/ghselect.jsp 주소변경없이 이동
			dispatcher = request.getRequestDispatcher("member/join/ghselect.jsp");
			dispatcher.forward(request, response);

		}

		if (sPath.equals("/findId.me")) { // 아이디 찾기
			// member/join/findPassword.jsp 주소변경없이 이동
			dispatcher = request.getRequestDispatcher("member/login/findId.jsp");
			dispatcher.forward(request, response);
		}

		if (sPath.equals("/findIdPro.me")) { // 아이디 찾기
			System.out.println("뽑은 가상주소 비교 : /findId.me");
			memberService = new MemberService();
			MemberDTO memberDTO = memberService.userInfoCheck(request);

			if (memberDTO != null) {
				// 입력한회원정보 일치하면 세션값 저장 ->idReport.me로 이동
				HttpSession session = request.getSession();
				session.setAttribute("memberId", memberDTO.getMemberId());
				response.sendRedirect("idReport.me");
			} else {
				// memberDTO == null 아이디 비밀번호 틀림=> member/msg.jsp
				dispatcher = request.getRequestDispatcher("member/msg.jsp");
				dispatcher.forward(request, response);
			}
		}//findIdPro 
		
		if (sPath.equals("/idReport.me")) { // 아이디 보여주기
			// member/join/findPassword.jsp 주소변경없이 이동
			dispatcher = request.getRequestDispatcher("member/login/idReport.jsp");
			dispatcher.forward(request, response);
		}
		
		if(sPath.equals("/idReportPro.me")) {  // 아이디 보여주기
			System.out.println("뽑은 가상주소 비교 : /idReportPro.me");
			HttpSession session = request.getSession();
			// "memberId" 세션값 가져오기 => String memberId 변수 저장
			String memberId = (String) session.getAttribute("memberId");
			System.out.println(memberId); // memberId값 확인용
			if (memberId != null) {
				dispatcher = request.getRequestDispatcher("member/login/idReport.jsp");
				dispatcher.forward(request, response);
//				response.sendRedirect("login.me"); 
				session.invalidate();
			} else {
				// 저장된 memberId값이 없으면 => 팝업창 띄운다.
				dispatcher = request.getRequestDispatcher("member/msg.jsp");
				dispatcher.forward(request, response);
			}
		} // idReportPro

		if (sPath.equals("/findPassword.me")) { // 비밀번호 찾기
			// member/join/findPassword.jsp 주소변경없이 이동
			dispatcher = request.getRequestDispatcher("member/login/findPassword.jsp");
			dispatcher.forward(request, response);

		} // findPassword

		if (sPath.equals("/findPasswordPro.me")) { // 비밀번호 찾기
			System.out.println("뽑은 가상주소 비교 : /findPasswordPro.me");

			// MemberService 객체생성
			memberService = new MemberService();

			// MemberDTO memberDTO = userCheck(request) 메서드 호출
			MemberDTO memberDTO = memberService.pwCheck(request);

			if (memberDTO != null) {
				// 아이디 이름 이메일 일치 -> 로그인(세션에 값 저장) -> PasswordReset.me 이동
				System.out.println(memberDTO);
				System.out.println("아이디 이름 이메일 일치");
				// 세션 객체생성 => 세션 기억장소 안에 값 저장
				HttpSession session = request.getSession();
				session.setAttribute("memberId", memberDTO.getMemberId());
				session.setAttribute("memberName", memberDTO.getMemberName());
				session.setAttribute("memberEmail", memberDTO.getMemberEmail());
				// 주소 변경하면서 이동 -> 가상주소 PasswordReset.me 이동
				response.sendRedirect("PasswordReset.me");
			} else {
				// 아이디 이름 이메일 불일치 -> 아이디 이름 이메일 불일치 메세지, 뒤로이동
				System.out.println(memberDTO);
				System.out.println("아이디 이름 이메일 불일치");
				// member/msg.jsp 주소변경없이 이동
				dispatcher = request.getRequestDispatcher("member/msg.jsp");
				dispatcher.forward(request, response);
			}
		} // findPasswordPro

		if (sPath.equals("/PasswordReset.me")) { // 비밀번호 재설정
			// 수정하기 전에 디비 나의 정보 조회(세션값 memberId)
			// 세션 객체생성
			HttpSession session = request.getSession();
			// "memberId" 세션값 가져오기 => String memberId 변수 저장
			String memberId = (String) session.getAttribute("memberId");
			System.out.println(memberId); // memberId값 확인용
			// member/join/PasswordReset.jsp 주소변경없이 이동
			dispatcher = request.getRequestDispatcher("member/login/PasswordReset.jsp");
			dispatcher.forward(request, response);

		} // PasswordReset

		if (sPath.equals("/PasswordResetPro.me")) { // 비밀번호 재설정
			System.out.println("뽑은 가상주소 비교 : /PasswordResetPro.me");
			HttpSession session = request.getSession();
			// "memberId" 세션값 가져오기 => String memberId 변수 저장
			String memberId = (String) session.getAttribute("memberId");
			System.out.println(memberId); // memberId값 확인용
			// MemberService 객체생성
			memberService = new MemberService();
			if (memberId != null) {
				// 저장된 memberId값이 있으면 => updatePwMember(request) 메서드 호출
				// sql => update member set memberPassword = ? where memberId = ?
				memberService.updatePwMember(request);
				// 팝업창 띄운 후 => 로그인페이지로 이동
				dispatcher = request.getRequestDispatcher("member/loginsuccess.jsp");
				dispatcher.forward(request, response);
//				response.sendRedirect("login.me");
			} else {
				// 저장된 memberId값이 없으면 => 팝업창 띄운다.
				dispatcher = request.getRequestDispatcher("member/msg.jsp");
				dispatcher.forward(request, response);
			}
		} // PasswordResetPro

	}
}
