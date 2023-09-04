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

import com.itwillbs.domain.ClassBoardDTO;
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
				memberDTO.setMailOrderNum(rs.getString("mailOrderNum"));
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
	
	public MemberDTO userInfoCheck(MemberDTO memberDTO3) {
		System.out.println("MemberDAO userInfoCheck()");
		MemberDTO memberDTO = null;
		try {
			System.out.println("DAO try");
			//1단계 JDBC 프로그램 가져오기
			//2단계 디비 연결
			con = new SQLConnection().getConnection(); 
			//3단계 sql문 
			String sql = "select memberId from member where memberName = ? and memberEmail = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, memberDTO3.getMemberName());
			pstmt.setString(2, memberDTO3.getMemberEmail());
			System.out.println(pstmt);
			
			//4단계 sql구문 실행한 결과를 ResultSet(변수rs)으로 저장하겠다
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				System.out.println("DAO if");
				memberDTO = new MemberDTO();
				memberDTO.setMemberId(rs.getString("MemberId"));
		      }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return memberDTO;
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
			String sql = "select * from member where memberId=? and memberName=? and memberEmail=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, memberDTO2.getMemberId());
			pstmt.setString(2, memberDTO2.getMemberName());
			pstmt.setString(3, memberDTO2.getMemberEmail());
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
				memberDTO.setMailOrderNum(rs.getString("mailOrderNum"));
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
				memberDTO.setMailOrderNum(rs.getString("mailOrderNum"));
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
				memberDTO.setMailOrderNum(rs.getString("mailOrderNum"));
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

	public List<MemberDTO> getMemberList(PageDTO pageDTO) {
		List<MemberDTO> memberList = null;
		try {
			//1,2 디비연결
			con = new SQLConnection().getConnection();
			//3sql 
			String sql = "select * from member order by memberNum desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pageDTO.getStartRow()-1); // 시작행 -1 
			pstmt.setInt(2, pageDTO.getPageSize());//몇개	
			//4실행 => 결과 저장
			rs = pstmt.executeQuery();
			//5결과 행접근=> MemberDTO 객체생성 => set저장(열접근)=> 배열한칸에 저장
			memberList = new ArrayList<>();
			while(rs.next()) {
				MemberDTO memberDTO = new MemberDTO();
				memberDTO.setMemberNum(rs.getInt("memberNum"));
				memberDTO.setMemberId(rs.getString("memberId"));
				memberDTO.setMemberPassword(rs.getString("memberPassword"));
				memberDTO.setMemberName(rs.getString("memberName"));
				memberDTO.setMemberNickname(rs.getString("memberNickname"));
				memberDTO.setMemberBirthday(rs.getString("memberBirthday"));
				memberDTO.setMemberGender(rs.getString("memberGender"));
				memberDTO.setMemberPhoneNum(rs.getString("memberPhoneNum"));
				memberDTO.setMemberEmail(rs.getString("memberEmail"));
				memberDTO.setMemberType(rs.getString("memberType"));
				memberDTO.setBusinessNum(rs.getString("businessNum"));
				//배열 한칸에 저장
				memberList.add(memberDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return memberList;
	}
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
}