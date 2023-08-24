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
			String sql = "insert into notice(notice_num, notice_subject, notice_content, notice_issuedate, notice_readcount) values(?,?,?,?,?)";
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
			String sql = "select max(notice_num) from notice";
			pstmt=con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				noticeNum = rs.getInt("max(notice_num)");
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
			String sql = "select * from notice order by notice_num desc";
			pstmt=con.prepareStatement(sql);
			rs =pstmt.executeQuery();
			boardList = new ArrayList<>();
			while(rs.next()) {
				NoticeBoardDTO boardDTO = new NoticeBoardDTO();
				boardDTO.setNoticeNum(rs.getInt("notice_num"));
				boardDTO.setNoticeSubject(rs.getString("notice_subject"));
				boardDTO.setNoticeContent(rs.getString("notice_content"));
				boardDTO.setNoticeIssueDate(rs.getTimestamp("notice_issuedate"));
				boardDTO.setNoticeReadcount(rs.getInt("notice_readcount"));
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
		NoticeBoardDTO boardDTO = null;
		try {
			con = new SQLConnection().getConnection();
			String sql = "select * from notice where notice_num =?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, noticeNum);
			rs =pstmt.executeQuery();
			if(rs.next()) {
			boardDTO = new NoticeBoardDTO();
			boardDTO.setNoticeNum(rs.getInt("notice_num"));
			boardDTO.setNoticeSubject(rs.getString("notice_subject"));
			boardDTO.setNoticeContent(rs.getString("notice_content"));
			boardDTO.setNoticeIssueDate(rs.getTimestamp("notice_issuedate"));
			boardDTO.setNoticeReadcount(rs.getInt("notice_readcount"));
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
			String sql = "update notice set = notice_readcount+1 where notice_num = ?";
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
