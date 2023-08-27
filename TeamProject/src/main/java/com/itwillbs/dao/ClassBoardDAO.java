package com.itwillbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.itwillbs.domain.ClassBoardDTO;
import com.itwillbs.domain.PageDTO;

public class ClassBoardDAO {

	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs =null;

	public void dbClose() {
		if(rs != null) {try {rs.close();} catch (SQLException e) {	}}			
		if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {	}}
		if(con != null) {try {con.close();} catch (SQLException e) {	}}
	}
		
	public List<ClassBoardDTO> getBoardList(PageDTO pageDTO) {
		System.out.println("ClassBoardDAO getBoardList()");
		List<ClassBoardDTO> boardList = null;
		try { 
			// 1 2
			con = new SQLConnection().getConnection();
			String sql = "select * from class order by classNum desc limit ?, ?";
			// 3
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, pageDTO.getStartRow()-1); // 시작행 -1 
			pstmt.setInt(2, pageDTO.getPageSize());//몇개	
			//4
			rs =pstmt.executeQuery();
			boardList = new ArrayList<>();
			//5 
			while(rs.next()) {
				ClassBoardDTO boardDTO = new ClassBoardDTO();
				boardDTO.setClassNum(rs.getInt("classNum"));
				boardDTO.setClassSubject(rs.getString("classSubject"));
				boardDTO.setHostNum(rs.getInt("hostNum"));
				boardDTO.setClassIssueDate(rs.getTimestamp("classIssuedate"));
				boardDTO.setClassLocation(rs.getString("classLocation"));
				boardDTO.setClassCategory(rs.getString("classCategory"));
				boardDTO.setClassContent(rs.getString("classContent"));
				boardDTO.setClassPrice(rs.getInt("classPrice"));
				boardList.add(boardDTO);
				}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return boardList;
	}// getBoardList

	public int getBoardCount() {
		System.out.println("ClassBoardDAO getBoardCount()");
		int count =0;
		try {
			// 1단계 2단계 
			con = new SQLConnection().getConnection();
			// 3단계 문자열 -> sql구문 변경			// 3 select count(*) from board	
			String sql = "select count(*) from board;";
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
	}//getBoardCount

}
