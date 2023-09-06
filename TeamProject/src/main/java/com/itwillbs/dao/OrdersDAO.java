package com.itwillbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.itwillbs.domain.NoticeBoardDTO;
import com.itwillbs.domain.OrdersDTO;

public class OrdersDAO {
	
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs =null;

	public void dbClose() {
		if(rs != null) {try {rs.close();} catch (SQLException e) {	}}			
		if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {	}}
		if(con != null) {try {con.close();} catch (SQLException e) {	}}
	}// dbClose

	public void insertOrders(OrdersDTO ordersDTO) {
		System.out.println("OrdersDAO insertOrders()");
		try {
			// 1단계 JDBC 프로그램 가져오기 
			// 2단계 디비 연결
			con = new SQLConnection().getConnection();

			// 3단계 문자열 -> sql구문 변경
			String sql = "insert into orders(ordersId, classNum, ordersDate, ordersAmount, totalPrice) values(?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, ordersDTO.getOrdersId()); 
			pstmt.setInt(2, ordersDTO.getClassNum()); 
			pstmt.setString(3, ordersDTO.getOrdersDate());
			pstmt.setInt(4, ordersDTO.getOrdersAmount());
			pstmt.setInt(5, ordersDTO.getTotalPrice());
			// 4단계 sql구문 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
	}//insertOrders()

	public OrdersDTO getOrders(int ordersNum) {
		System.out.println("OrdersDAO getOrders()");
		OrdersDTO ordersDTO = null;
		try {
			con = new SQLConnection().getConnection();
			//select * from orders where ordersNum=?
			String sql = "select o.ordersNum, o.ordersId, o.classNum, o.ordersDate, o.ordersAmount, o.totalPrice, o.payDate, o.payMethod, c.classSubject from orders o join class c on o.classNum = c.classNum where ordersNum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, ordersNum);
			rs =pstmt.executeQuery();
			
			if(rs.next()) {
				ordersDTO = new OrdersDTO();
				ordersDTO.setOrdersNum(rs.getInt("ordersNum"));
				ordersDTO.setOrdersId(rs.getString("ordersId"));
				ordersDTO.setClassNum(rs.getInt("classNum"));
				ordersDTO.setOrdersDate(rs.getString("ordersDate"));
				ordersDTO.setOrdersAmount(rs.getInt("ordersAmount"));
				ordersDTO.setTotalPrice(rs.getInt("totalPrice"));
				ordersDTO.setPayDate(rs.getString("payDate"));
				ordersDTO.setPayMethod(rs.getString("payMethod"));
				ordersDTO.setClassSubject(rs.getString("classSubject"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return ordersDTO;
	} // getOrders

	public int getMaxNum() {
		int ordersNum = 0;
		try {
			// 1단계 JDBC 프로그램 가져오기
			// 2단계 디비 연결
			con = new SQLConnection().getConnection();
			
			// 3단계 문자열 -> sql구문 변경
			String sql = "select max(ordersNum) from orders";
			pstmt=con.prepareStatement(sql);
			
			// 4단계 sql구문 실행
			rs = pstmt.executeQuery();
			
			// 5단계 : if행 접근 -> 데이터있으면 true
			if(rs.next()) {
				ordersNum = rs.getInt("max(ordersNum)");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 예외 상관없이 마무리 작업 => con, pstmt, rs 기억장소 해제
			dbClose();
		}
		return ordersNum;
	}// getMaxNum()

	public void insertPay(OrdersDTO ordersDTO) {
		System.out.println("OrdersDAO insertPay()");
		System.out.println(ordersDTO.getPayDate());
		System.out.println(ordersDTO.getPayMethod());
		System.out.println(ordersDTO.getOrdersNum());
		try {
			con = new SQLConnection().getConnection();
			String sql = "update orders set payDate=?, payMethod=? where ordersNum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ordersDTO.getPayDate());
			pstmt.setString(2, ordersDTO.getPayMethod());
			pstmt.setInt(3, ordersDTO.getOrdersNum());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		
	}// insertPay

	public List<OrdersDTO> getOrdersList(String ordersId) {
		List<OrdersDTO> ordersList = null;
		try {
			con = new SQLConnection().getConnection();
			String sql = "select o.ordersNum, o.ordersId, o.classNum, o.ordersDate, o.ordersAmount, o.totalPrice, o.payDate, o.payMethod, c.classSubject from orders o join class c on o.classNum = c.classNum where ordersId=? order by ordersNum desc";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, ordersId);
			rs =pstmt.executeQuery();
			ordersList = new ArrayList<>();
			while(rs.next()) {
				OrdersDTO ordersDTO = new OrdersDTO();
				ordersDTO.setOrdersNum(rs.getInt("ordersNum"));
				ordersDTO.setOrdersId(rs.getString("ordersId"));
				ordersDTO.setClassNum(rs.getInt("classNum"));
				ordersDTO.setOrdersDate(rs.getString("ordersDate"));
				ordersDTO.setOrdersAmount(rs.getInt("ordersAmount"));
				ordersDTO.setTotalPrice(rs.getInt("totalPrice"));
				ordersDTO.setPayDate(rs.getString("payDate"));
				ordersDTO.setPayMethod(rs.getString("payMethod"));
				ordersDTO.setClassSubject(rs.getString("classSubject"));
				ordersList.add(ordersDTO);
				}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return ordersList;
	}// getOrdersList



		
	
	
	
	
	
	
	
}// class
