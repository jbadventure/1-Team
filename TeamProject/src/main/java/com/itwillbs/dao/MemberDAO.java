package com.itwillbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.itwillbs.domain.MemberDTO;

public class MemberDAO {
	
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs =null;
	
	public void dbClose() {
		if(rs != null) {try {rs.close();} catch (SQLException e) {	}}			
		if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {	}}
		if(con != null) {try {con.close();} catch (SQLException e) {	}}
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
			
			//4단계 sql구문 실행한 결과를 ResultSet(변수rs)으로 저장하겠다
			rs = pstmt.executeQuery();
			//5단계 : if 행 접근 -> 데이터 있으면 true -> 아이디 비밀번호 일치 출력
//				     else			  없으면 false -> 아이디 비밀번호 틀림 출력
			if(rs.next()){
				// true 아이디 비밀번호 일치 => 세션값 저장 => main.jsp로 이동
				// 열접근 각각의 컬럼값 => MemberDTO에 담아서 리턴
				// MemberDTO 객체생성 => 기억장소 할당 => 각각의 컬럼값 저장
				memberDTO = new MemberDTO();
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
				memberDTO.setMemberProfileImagePath(rs.getString("memberProfileImagePath"));
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
}
