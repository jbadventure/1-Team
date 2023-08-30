package com.itwillbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.itwillbs.domain.ReserveDTO;

public class ReserveDAO {
	
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs =null;
	
	public void dbClose() {
		if(rs != null) {try {rs.close();} catch (SQLException e) {	}}			
		if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {	}}
		if(con != null) {try {con.close();} catch (SQLException e) {	}}
	}

	public void insertReserve(ReserveDTO reserveDTO) {
		System.out.println();
		try {
			//1 2
			con = new SQLConnection().getConnection();
			// 3
			String sql = "insert into reservation (classNum, reservationDate, reservationId, reservationAmount, payComplete) values(?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, reserveDTO.getClassNum());
			pstmt.setTimestamp(2, reserveDTO.getReservationDate());
			pstmt.setString(3, reserveDTO.getReservationId()); 
			pstmt.setInt(4, reserveDTO.getReservationAmount());
			pstmt.setString(5, reserveDTO.getPayComplete()); 			
			// 4단계 sql구문 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
	}// insertReserve

}
