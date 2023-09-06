package com.itwillbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;

public class MemberDAO {
	
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs =null; 
	
	//기억장소 해제 메서드()
	public void dbClose() {
		if(rs != null) {try {rs.close();} catch (SQLException e) {	}}			
		if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {	}}
		if(con != null) {try {con.close();} catch (SQLException e) {	}}
	}
	
	// Guest 회원가입 
		public void insertGuest(MemberDTO memberDTO) {
			System.out.println("MemberDAO insertGuest()");
			try {
				// 1단계 JDBC 프로그램 가져오기 
				// 2단계 디비 연결
				con = new SQLConnection().getConnection();
				// 3단계 문자열 -> sql구문 변경
				String sql = "insert into member(memberId,memberPassword,memberNickname,memberName,memberBirthday,memberGender,memberPhoneNum,memberEmail,memberLocation,memberType) values(?,?,?,?,?,?,?,?,?,?)";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, memberDTO.getMemberId());
				pstmt.setString(2, memberDTO.getMemberPassword()); 
				pstmt.setString(3, memberDTO.getMemberNickname());
				pstmt.setString(4, memberDTO.getMemberName());
				pstmt.setString(5, memberDTO.getMemberBirthday());
				pstmt.setString(6, memberDTO.getMemberGender());
				pstmt.setString(7, memberDTO.getMemberPhoneNum());
				pstmt.setString(8, memberDTO.getMemberEmail());
				pstmt.setString(9, memberDTO.getMemberLocation());
				pstmt.setString(10, memberDTO.getMemberType());
				
				// 4단계 sql구문 실행
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbClose();
			} 
			
		}//insertMember()
		
	// insertHost
	public void insertHost(MemberDTO memberDTO) {
		System.out.println("MemberDAO insertHost()");
		try {
			con=new SQLConnection().getConnection();

			String sql = "insert into member(memberId,memberPassword,memberNickname,memberName,memberBirthday,memberGender,memberPhoneNum,memberEmail,memberLocation,businessNum,memberType) values(?,?,?,?,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, memberDTO.getMemberId());
			pstmt.setString(2, memberDTO.getMemberPassword()); 
			pstmt.setString(3, memberDTO.getMemberNickname());
			pstmt.setString(4, memberDTO.getMemberName());
			pstmt.setString(5, memberDTO.getMemberBirthday());
			pstmt.setString(6, memberDTO.getMemberGender());
			pstmt.setString(7, memberDTO.getMemberPhoneNum());
			pstmt.setString(8, memberDTO.getMemberEmail());
			pstmt.setString(9, memberDTO.getMemberLocation());
			pstmt.setString(10, memberDTO.getBusinessNum());
			pstmt.setString(11, memberDTO.getMemberType());

			// sql구문 실행결과를 ResultSet 내장객체에 저장
			pstmt.executeUpdate();
						
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}	
	}
	
	public MemberDTO userCheck(MemberDTO memberDTO2) {
		System.out.println("MemberDAO userCheck()");
		// MemberDTO 선언 초기값 null (return 하기위해 try/catch 밖으로 뺐음)
		MemberDTO memberDTO = null;
		try {
			//1단계 JDBC 프로그램 가져오기
			//2단계 디비 연결
			con = new SQLConnection().getConnection();
			
			//3단계 sql문
			String sql = "select * from member where memberId=? and memberPassword=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, memberDTO2.getMemberId());
			pstmt.setString(2, memberDTO2.getMemberPassword());
			System.out.println(pstmt);
			
			//4단계 sql구문 실행한 결과를 ResultSet(변수rs)으로 저장하겠다
			rs = pstmt.executeQuery();
			//5단계 : if 행 접근 -> 데이터 있으면 true -> 아이디 비밀번호 일치 출력
//				     else			  없으면 false -> 아이디 비밀번호 틀림 출력
//			System.out.println(rs.next());
//			if(rs.next()) {
//				System.out.println("DAO if문 들어옴-1");
//				
//			}
			if(rs.next()){
				System.out.println("DAO if문 들어옴-2");
				// 열접근 각각의 컬럼값 => MemberDTO에 담아서 리턴
				// MemberDTO 객체생성 => 기억장소 할당 => 각각의 컬럼값 저장
				memberDTO = new MemberDTO();
				memberDTO.setMemberNum(rs.getInt("memberNum"));
				memberDTO.setMemberId(rs.getString("memberId"));
				memberDTO.setMemberPassword(rs.getString("memberPassword"));
				memberDTO.setMemberName(rs.getString("memberName"));
				memberDTO.setMemberNickname(rs.getString("memberNickname"));
				memberDTO.setMemberGender(rs.getString("memberGender"));
				memberDTO.setMemberBirthday(rs.getString("memberBirthday"));
				memberDTO.setMemberPhoneNum(rs.getString("memberPhoneNum"));
				memberDTO.setMemberEmail(rs.getString("memberEmail"));
				memberDTO.setMemberType(rs.getString("memberType"));
				memberDTO.setMemberLocation(rs.getString("memberLocation"));
				memberDTO.setBusinessNum(rs.getString("businessNum"));
				memberDTO.setMemberFile(rs.getString("memberFile"));
			}else{
				// false 아이디 비밀번호 틀림, 뒤로이동
				// 열접근 못함 => memberDTO에 null을 담아서 리턴
				memberDTO = null;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 예외 상관없이 마무리 작업 => con, pstmt, rs 기억장소 해제
			dbClose();
		}
		// 아이디 비밀번호가 일치하면 MemberDTO 주소값 리턴;
		// 아이디 비밀번호가 다르면 MemberDTO null값 리턴;
		return memberDTO;
	}// userCheck() 
	
	
	public String userInfoCheck(String memberName, String memberEmail) {
		System.out.println("MemberDAO userInfoCheck()");
		String memberId = null;
		try {
			//1단계 JDBC 프로그램 가져오기
			//2단계 디비 연결
			con = new SQLConnection().getConnection(); 
			//3단계 sql문 
			String sql = "select memberId from member where memberName = ? and memberEmail = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, memberName);
			pstmt.setString(2, memberEmail);
			System.out.println(pstmt);
			
			//4단계 sql구문 실행한 결과를 ResultSet(변수rs)으로 저장하겠다
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				memberId = rs.getString("memberId");
				System.out.println(memberId);
		      }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return memberId;
	}

	public MemberDTO pwCheck(MemberDTO memberDTO2) {
		System.out.println("MemberDAO pwCheck()");
		// MemberDTO 선언 초기값 null (return 하기위해 try/catch 밖으로 뺐음)
		MemberDTO memberDTO = null;
		try {
			//1단계 JDBC 프로그램 가져오기
			//2단계 디비 연결
			con = new SQLConnection().getConnection();
			
			//3단계 sql문
			String sql = "select memberId from member where memberId=? and memberName=? and memberEmail=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, memberDTO2.getMemberId());
			pstmt.setString(2, memberDTO2.getMemberName());
			pstmt.setString(3, memberDTO2.getMemberEmail());
			System.out.println(pstmt);
			
			rs = pstmt.executeQuery();

			if(rs.next()){
				System.out.println("DAO if문");
				memberDTO = new MemberDTO();
				memberDTO.setMemberId(rs.getString("memberId"));
				System.out.println(memberDTO);
			} else {
				memberDTO = new MemberDTO();
				memberDTO.setMemberId("Value does not exist");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return memberDTO;
	}// pwCheck()


	public MemberDTO getMember(String memberId) {
		System.out.println("MemberDAO getMember()");
		MemberDTO memberDTO = null;
		try {
			//1,2 디비연결
			con = new SQLConnection().getConnection();
			//3 sql 
			String sql="select * from member where memberId=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberId);
			System.out.println(pstmt);
			//4 실행 => 결과저장
			rs = pstmt.executeQuery();
			//5 행접근 memberDTO 객체생성 set메서드호출 열접근 저장
			if(rs.next()) {
				memberDTO = new MemberDTO();
				memberDTO.setMemberNum(rs.getInt("memberNum"));
				memberDTO.setMemberId(rs.getString("memberId"));
				memberDTO.setMemberPassword(rs.getString("memberPassword"));
				memberDTO.setMemberName(rs.getString("memberName"));
				memberDTO.setMemberNickname(rs.getString("memberNickname"));
				memberDTO.setMemberGender(rs.getString("memberGender"));
				memberDTO.setMemberBirthday(rs.getString("memberBirthday"));
				memberDTO.setMemberPhoneNum(rs.getString("memberPhoneNum"));
				memberDTO.setMemberEmail(rs.getString("memberEmail"));
				memberDTO.setMemberType(rs.getString("memberType"));
				memberDTO.setMemberLocation(rs.getString("memberLocation"));
				memberDTO.setBusinessNum(rs.getString("businessNum"));
				memberDTO.setMemberFile(rs.getString("memberFile"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return memberDTO;
	}//getMember()
	
	public MemberDTO getMemberNick(String memberNickname) {
		System.out.println("MemberDAO getMember()");
		MemberDTO memberDTO = null;
		try {
			//1,2 디비연결
			con = new SQLConnection().getConnection();
			//3 sql 
			String sql="select * from member where memberNickname=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberNickname);
			System.out.println(pstmt);
			//4 실행 => 결과저장
			rs = pstmt.executeQuery();
			//5 행접근 memberDTO 객체생성 set메서드호출 열접근 저장
			if(rs.next()) {
				memberDTO = new MemberDTO();
				memberDTO.setMemberNum(rs.getInt("memberNum"));
				memberDTO.setMemberId(rs.getString("memberId"));
				memberDTO.setMemberPassword(rs.getString("memberPassword"));
				memberDTO.setMemberName(rs.getString("memberName"));
				memberDTO.setMemberNickname(rs.getString("memberNickname"));
				memberDTO.setMemberGender(rs.getString("memberGender"));
				memberDTO.setMemberBirthday(rs.getString("memberBirthday"));
				memberDTO.setMemberPhoneNum(rs.getString("memberPhoneNum"));
				memberDTO.setMemberEmail(rs.getString("memberEmail"));
				memberDTO.setMemberType(rs.getString("memberType"));
				memberDTO.setMemberLocation(rs.getString("memberLocation"));
				memberDTO.setBusinessNum(rs.getString("businessNum"));
				memberDTO.setMemberFile(rs.getString("memberFile"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return memberDTO;
	}//getMemberNick()

	public void updatePwMember(MemberDTO memberDTO) {
		System.out.println("MemberDAO updatePwMember()");
		try {
			//1,2 디비연결
			con = new SQLConnection().getConnection();
			//3 sql update members set name = ? where id = ?
			String sql = "update member set memberPassword = ? where memberId = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberDTO.getMemberPassword());
			pstmt.setString(2, memberDTO.getMemberId());
			System.out.println(pstmt);
			//4 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
	}//updatePwMember()
	
	public void infoType(MemberDTO memberDTO) {
		System.out.println("MemberDAO infoType()");
		try {
			//1,2 디비연결
			con = new SQLConnection().getConnection();
			//3 sql update members set name = ? where id = ?
			String sql = "select * from member where memberType = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberDTO.getMemberType());
			System.out.println(pstmt);
			//4 실행
			rs = pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
	}// infoType()

	public void updateMember(MemberDTO memberDTO) {
		System.out.println("MemberDAO updateMember()");
		try {
			//1,2 디비연결
			con = new SQLConnection().getConnection();
			//3 sql update members set name = ? where id = ?
			String sql = "update member set memberFile=?, memberNickname=?, memberPhoneNum=?, memberEmail=?, memberLocation=?, businessNum=? where memberId=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberDTO.getMemberFile());
			pstmt.setString(2, memberDTO.getMemberNickname());
			pstmt.setString(3, memberDTO.getMemberPhoneNum());
			pstmt.setString(4, memberDTO.getMemberEmail());
			pstmt.setString(5, memberDTO.getMemberLocation());
			pstmt.setString(6, memberDTO.getBusinessNum());
			pstmt.setString(7, memberDTO.getMemberId());
			System.out.println(pstmt);
			//4 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
	}//updateMember()

	
	public int getMemberCount() {
		System.out.println("MemberDAO getMemberCount()");
		int count =0;
		try {
			// 1단계 2단계 
			con = new SQLConnection().getConnection();
			// 3단계 문자열 -> sql구문 변경
			String sql = "select count(*) from member";
			pstmt=con.prepareStatement(sql);
			//4 실행 => 결과저장
			rs =pstmt.executeQuery();
		if(rs.next()) {
			count = rs.getInt("count(*)");
		}
			// 실행  -> 결과 저장 
			// 5결과 행접근 -> 열접근-> count 변수 저장 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return count;
	}//getMemeberCount

	public List<MemberDTO> getAdminList(String memberType) {
		System.out.println("MemberDAO getAdminList()");
		List<MemberDTO> memberList = null;
		try {
			con = new SQLConnection().getConnection();
			//3단계 문자열 -> sql구문 변경
			String sql = "select * from member where memberType=? order by memberNum desc";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, memberType);
			//4단계 sql구문 실행한 결과를 ResultSet(변수rs)으로 저장하겠다
			rs = pstmt.executeQuery();
			
			//5단계 : while 행 접근 -> 데이터 있으면 true 
			//      -> 아이디 비밀번호 이름 가입날짜 => MemberDTO에 저장 => 배열에 저장 
			// 배열 객체생성 => 기억장소 할당
			memberList = new ArrayList<>();
			while(rs.next()){
				// => MemberDTO에 객체를 생성 -> 기억장소 할당 
				// -> 멤버변수에 rs열에서 가져온 값을 저장 
				MemberDTO memberDTO = new MemberDTO();
				memberDTO.setMemberNum(rs.getInt("memberNum"));
				memberDTO.setMemberId(rs.getString("memberId"));
				memberDTO.setMemberPassword(rs.getString("memberPassword"));
				memberDTO.setMemberName(rs.getString("memberName"));
				memberDTO.setMemberNickname(rs.getString("memberNickname"));
				memberDTO.setMemberGender(rs.getString("memberGender"));
				memberDTO.setMemberBirthday(rs.getString("memberBirthday"));
				memberDTO.setMemberPhoneNum(rs.getString("memberPhoneNum"));
				memberDTO.setMemberEmail(rs.getString("memberEmail"));
				memberDTO.setMemberType(rs.getString("memberType"));
				memberDTO.setMemberLocation(rs.getString("memberLocation"));
				memberDTO.setBusinessNum(rs.getString("businessNum"));
				memberDTO.setMemberFile(rs.getString("memberFile"));
				// 한 사람의 주소를 배열 한칸에 저장
				memberList.add(memberDTO);
			}
			System.out.println("배열 회원여러명 : " + memberList);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 예외 상관없이 마무리 작업 => con, pstmt, rs 기억장소 해제
			dbClose();
		}
		return memberList;
	}// getAdminList()
	
	
}// class