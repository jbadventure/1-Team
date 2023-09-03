package com.itwillbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.itwillbs.domain.ClassBoardDTO;
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
			String sql = "insert into reservation(classNum, reservationDate, reservationId, reservationAmount) values(?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, reserveDTO.getClassNum());
			pstmt.setString(2, reserveDTO.getReservationDate());
			pstmt.setString(3, reserveDTO.getReservationId()); 
			pstmt.setInt(4, reserveDTO.getReservationAmount());
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
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}

		return reserveDTO;
	}
	
	public ReserveDTO getReserve(int reservationNum) {
		System.out.println("ReserveDAO getReserve()");
		ReserveDTO reserveDTO = null;
		try {
			con = new SQLConnection().getConnection();
			String sql = "select * from reservation where reservationNum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, reservationNum);
			rs =pstmt.executeQuery();
			
			if(rs.next()) {
				reserveDTO = new ReserveDTO();
				reserveDTO.setReservationNum(rs.getInt("reservationNum"));
				reserveDTO.setClassNum(rs.getInt("classNum"));
				reserveDTO.setReservationDate(rs.getString("reservationDate"));
				reserveDTO.setReservationId(rs.getString("reservationId"));
				reserveDTO.setReservationAmount(rs.getInt("reservationAmount"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return reserveDTO;
	} // getReserve
	
	public int getMaxNum() {
		int reservationNum = 0;
		try {
			// 1단계 JDBC 프로그램 가져오기
			// 2단계 디비 연결
			con = new SQLConnection().getConnection();
			
			// 3단계 문자열 -> sql구문 변경
			String sql = "select max(reservationNum) from reservation";
			pstmt=con.prepareStatement(sql);
			
			// 4단계 sql구문 실행
			rs = pstmt.executeQuery();
			
			// 5단계 : if행 접근 -> 데이터있으면 true
			if(rs.next()) {
				reservationNum = rs.getInt("max(reservationNum)");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 예외 상관없이 마무리 작업 => con, pstmt, rs 기억장소 해제
			dbClose();
		}
		return reservationNum;
	}// getMaxNum()

	public List<ReserveDTO> getReserveList(String reservationId) {
		System.out.println("ReserveDAO gerReserveList()");
		List<ReserveDTO> reserveList = null;
		try {
			// 1, 2
			con = new SQLConnection().getConnection();
			// 3단계 문자열 -> sql구문 변경
			String sql = "select * from reservation where reservationId =? order by reservationNum desc";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, reservationId);
			System.out.println(pstmt);
			System.out.println("where reservationId =?"+reservationId);
			// 4단계 sql구문 실행
			rs =pstmt.executeQuery();
			reserveList= new ArrayList<>();
			while(rs.next()) {
				ReserveDTO reserveDTO = new ReserveDTO();
				reserveDTO.setReservationNum(rs.getInt("reservationNum"));
				reserveDTO.setClassNum(rs.getInt("classNum"));
				reserveDTO.setReservationDate(rs.getString("reservationDate"));
				reserveDTO.setReservationId(rs.getString("reservationId"));
				reserveDTO.setReservationAmount(rs.getInt("reservationAmount"));
				reserveList.add(reserveDTO);
				System.out.println("select * from reservation"+reserveList);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return reserveList;
	}
}
