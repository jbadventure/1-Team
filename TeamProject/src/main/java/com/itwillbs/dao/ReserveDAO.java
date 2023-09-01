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
		System.out.println("ReserveDAO insertReserve");
		try {
			//1 2
			con = new SQLConnection().getConnection();
			// 3
			String sql = "insert into reservation(classNum,reservationDate,reservationId,reservationAmount,payComplete) values(?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, reserveDTO.getClassNum());
			pstmt.setString(2, reserveDTO.getReservationDate());
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

	public ReserveDTO reservationComplete(int reservationNum) {
		System.out.println("ReserveDAO reservationComplete");
		ReserveDTO reserveDTO = null; 
		try {
			//1 2
			con = new SQLConnection().getConnection();
			// 3
			String sql = "select r.reservationNum , r.reservationId, r.reservationDate, r.reservationAmount, c.classNum , p.payDate, p.payMethod from reservation r join class c on r.classNum = c.classNum join pay p on r.reservationNum = p.reservationNum where r.reservationNum=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, reservationNum); 
			//4 
			rs =pstmt.executeQuery();
			//5 
			if(rs.next()) {
				reserveDTO = new ReserveDTO();
				reserveDTO.setReservationNum(rs.getInt("reservationNum"));
				reserveDTO.setClassNum(rs.getInt("classNum"));
				reserveDTO.setReservationDate(rs.getString("reservationDate"));
				reserveDTO.setReservationId(rs.getString("reservationId"));
				reserveDTO.setReservationAmount(rs.getInt("reservationAmount"));
				reserveDTO.setPayComplete(rs.getString("payComplete"));
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}

		return null;
	}

}
