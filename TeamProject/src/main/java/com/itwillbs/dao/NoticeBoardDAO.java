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

import com.itwillbs.domain.NoticeBoardDTO;

public class NoticeBoardDAO {
	
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs =null;
	
	
	
	public void dbClose() {
		if(rs != null) {try {rs.close();} catch (SQLException e) {	}}			
		if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {	}}
		if(con != null) {try {con.close();} catch (SQLException e) {	}}
	}
	public void insertBoard(NoticeBoardDTO boardDTO) {
		try {
			con = new SQLConnection().getConnection();
			String sql = "insert into notice(noticeNum, noticeSubject, noticeContent, noticeIssuedate, noticeReadcount) values(?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardDTO.getNoticeNum());
			pstmt.setString(2, boardDTO.getNoticeSubject());
			pstmt.setString(3, boardDTO.getNoticeContent());
			pstmt.setTimestamp(4, boardDTO.getNoticeIssueDate());
			pstmt.setInt(5, boardDTO.getNoticeReadcount());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
	} // insertBoard
	
	public int getMaxNum() {
		int noticeNum = 0;
		try {
			con = new SQLConnection().getConnection();
			String sql = "select max(noticeNum) from notice";
			pstmt=con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				noticeNum = rs.getInt("max(noticeNum)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return noticeNum;
	}
	public List<NoticeBoardDTO> getBoardList() {
		List<NoticeBoardDTO> boardList = null;
		try {
			con = new SQLConnection().getConnection();
			String sql = "select * from notice order by noticeNum desc";
			pstmt=con.prepareStatement(sql);
			rs =pstmt.executeQuery();
			boardList = new ArrayList<>();
			while(rs.next()) {
				NoticeBoardDTO boardDTO = new NoticeBoardDTO();
				boardDTO.setNoticeNum(rs.getInt("noticeNum"));
				boardDTO.setNoticeSubject(rs.getString("noticeSubject"));
				boardDTO.setNoticeContent(rs.getString("noticeContent"));
				boardDTO.setNoticeIssueDate(rs.getTimestamp("noticeIssuedate"));
				boardDTO.setNoticeReadcount(rs.getInt("noticeReadcount"));
				boardList.add(boardDTO);
				}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return boardList;
	}
	public NoticeBoardDTO getBoard(int noticeNum) {
		System.out.println("NoticeBoardDAO getMember()");
		NoticeBoardDTO boardDTO = null;
		try {
			con = new SQLConnection().getConnection();
			String sql = "select * from notice where noticeNum =?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, noticeNum);
			rs =pstmt.executeQuery();
			
			if(rs.next()) {
			boardDTO = new NoticeBoardDTO();
			boardDTO.setNoticeNum(rs.getInt("noticeNum"));
			boardDTO.setNoticeSubject(rs.getString("noticeSubject"));
			boardDTO.setNoticeContent(rs.getString("noticeContent"));
			boardDTO.setNoticeIssueDate(rs.getTimestamp("noticeIssuedate"));
			boardDTO.setNoticeReadcount(rs.getInt("noticeReadcount"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return boardDTO;
	} // getBoard
	public void updateReadcount(int noticeNum) {
		try {
			con = new SQLConnection().getConnection();
			String sql = "update notice set = noticeReadcount+1 where noticeNum = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, noticeNum);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		
	}
	public void updateBoard(NoticeBoardDTO boardDTO) {
		try {
			con = new SQLConnection().getConnection();
			String sql = "update notice set noticeSubject=?,noticeContent=? where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, boardDTO.getNoticeSubject());
			pstmt.setString(2, boardDTO.getNoticeContent());
			pstmt.setInt(3, boardDTO.getNoticeNum());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		
	} // updateBoard
	public void deleteBoard(int noticeNum) {
		try {
			con = new SQLConnection().getConnection();
			String sql = "delete from notice where noticeNum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, noticeNum);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		
	}
	



	


}
