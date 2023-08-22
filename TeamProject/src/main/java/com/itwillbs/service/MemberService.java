package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.MemberDTO;

public class MemberService {
	MemberDAO memberDAO = null;
	
	public void insertMember(HttpServletRequest request) {
		System.out.println("MemberService insertMember()");
		try {
			//request 한글처리
			request.setCharacterEncoding("utf-8");
    	// request 저장된 id,pass,name 파라미터값 가져오기=>변수저장
			String id=request.getParameter("id");
			String pass=request.getParameter("pass");
			String name=request.getParameter("name");
			Timestamp date = new Timestamp(System.currentTimeMillis());
			
			// MemberDTO 객체생성 
			MemberDTO memberDTO =new MemberDTO();
			// set메서드 호출 파라미터값 저장
			memberDTO.setId(id);
			memberDTO.setPass(pass);
			memberDTO.setName(name);
			memberDTO.setDate(date);
			
			System.out.println(memberDTO);
			
			// MemberDAO 객체생성
			memberDAO = new MemberDAO();
			// insertMember() 메서드 호출
			memberDAO.insertMember(memberDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//insertMember()

	public MemberDTO userCheck(HttpServletRequest request) {
		System.out.println("MemberService userCheck()");
		MemberDTO memberDTO = null;
		try {
			//한글처리
			request.setCharacterEncoding("utf-8");
			//id,pass 파라미터 값 가져오기
			String id=request.getParameter("id");
			String pass=request.getParameter("pass");
			// MemberDTO 저장
			MemberDTO memberDTO2 = new MemberDTO();
			memberDTO2.setId(id);
			memberDTO2.setPass(pass);
			// MemberDAO 객체생성
			memberDAO = new MemberDAO();
			// memberDTO =  userCheck(memberDTO2) 메서드 호출
			memberDTO=memberDAO.userCheck(memberDTO2);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberDTO;
	}//userCheck()

	public MemberDTO getMember(String id) {
		System.out.println("MemberService getMember()");
		MemberDTO memberDTO = null;
		try {
			// MemberDAO 객체생성
			memberDAO = new MemberDAO();
			// memberDTO  = getMember(id) 메서드 호출
			memberDTO = memberDAO.getMember(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberDTO;
	}//getMember()

	public void updateMember(HttpServletRequest request) {
		System.out.println("MemberService updateMember()");
		try {
			// request 한글처리
			request.setCharacterEncoding("utf-8");
			// request 파라미터 가져오기(id,pass,name)
			String id = request.getParameter("id");
			String pass = request.getParameter("pass");
			String name = request.getParameter("name");
			// MemberDTO 객체생성 
			MemberDTO memberDTO = new MemberDTO();
			// set메서드 호출 파라미터값 저장
			memberDTO.setId(id);
			memberDTO.setPass(pass);
			memberDTO.setName(name);
			// MemberDAO 객체생성
			memberDAO = new MemberDAO();
			// updateMember(memberDTO) 메서드 호출
			memberDAO.updateMember(memberDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//updateMember()

	public void deleteMember(HttpServletRequest request) {
		System.out.println("MemberService deleteMember()");
		try {
			// request 한글처리
			request.setCharacterEncoding("utf-8");
			// request 파라미터 가져오기(id,pass)
			String id = request.getParameter("id");
			String pass = request.getParameter("pass");
			// MemberDTO 객체생성 
			MemberDTO memberDTO = new MemberDTO();
			// set메서드 호출 파라미터값 저장
			memberDTO.setId(id);
			memberDTO.setPass(pass);
			// MemberDAO 객체생성
			memberDAO = new MemberDAO();
			// deleteMember(memberDTO) 메서드 호출
			memberDAO.deleteMember(memberDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//deleteMember()

	public List<MemberDTO> getMemberList() {
		System.out.println("MemberService getMemberList()");
		List<MemberDTO> memberList=null; 
		try {
			// MemberDAO 객체생성
			memberDAO = new MemberDAO();
			// memberList = getMemberList 메서드 호출
			memberList = memberDAO.getMemberList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberList;
	}
	
}//class
