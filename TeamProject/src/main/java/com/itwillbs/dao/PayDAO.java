package com.itwillbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.itwillbs.domain.PayDTO;

public class PayDAO {

	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs =null;

	public void dbClose() {
		if(rs != null) {try {rs.close();} catch (SQLException e) {	}}			
		if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {	}}
		if(con != null) {try {con.close();} catch (SQLException e) {	}}
	}

	public void insertPay(PayDTO payDTO) {
		System.out.println("PayDTO insertPay()");
		try {
			// 1단계 JDBC 프로그램 가져오기 
			// 2단계 디비 연결
			con = new SQLConnection().getConnection();

			// 3단계 문자열 -> sql구문 변경
			String sql = "insert into pay(reservationNum, payPrice, payMethod) values(?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, payDTO.getReservationNum());
			pstmt.setInt(2, payDTO.getPayPrice());
			pstmt.setString(3, payDTO.getPayMethod()); 
			// 4단계 sql구문 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
	}// insertPay()

}