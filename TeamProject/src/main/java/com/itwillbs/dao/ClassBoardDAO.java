package com.itwillbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.itwillbs.domain.ClassBoardDTO;
import com.itwillbs.domain.NoticeBoardDTO;

public class ClassBoardDAO {

	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs =null;

	public void dbClose() {
		if(rs != null) {try {rs.close();} catch (SQLException e) {	}}			
		if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {	}}
		if(con != null) {try {con.close();} catch (SQLException e) {	}}
	}
		
	public List<ClassBoardDTO> getBoardList() {
		System.out.println("ClassBoardDAO getBoardList()");
		List<ClassBoardDTO> boardList = null;
		try {
			con = new SQLConnection().getConnection();
			String sql = "select * from class order by classNum desc";
			pstmt=con.prepareStatement(sql);
			rs =pstmt.executeQuery();
			
			boardList = new ArrayList<>();
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

}
