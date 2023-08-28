package com.itwillbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.itwillbs.domain.ReviewBoardDTO;

public class ReviewBoardDAO {
	
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs =null;
	
	public void dbClose() {
		if(rs != null) {try {rs.close();} catch (SQLException e) {	}}			
		if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {	}}
		if(con != null) {try {con.close();} catch (SQLException e) {	}}
	}

	

	public void insertBoard(ReviewBoardDTO boardDTO) {
		try {
			con = new SQLConnection().getConnection();
			String sql = "insert into review(reviewNum, classNum, reviewId, reviewContent, reviewFile, reviewIssueDate) values (?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardDTO.getReviewNum());
			pstmt.setInt(2, boardDTO.getClassNum());
			pstmt.setString(3, boardDTO.getReviewId());
			pstmt.setString(4, boardDTO.getReviewContent());
			pstmt.setString(5, boardDTO.getReviewFile());
			pstmt.setTimestamp(6, boardDTO.getReviewIssueDate());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			dbClose();
		}
		
	} // insertBoard

	public int getMaxNum() {
		int reviewNum = 0;
		try {
			con = new SQLConnection().getConnection();
			String sql = "select max(reviewNum) from notice";
			pstmt=con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				reviewNum = rs.getInt("max(noticeNum)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return reviewNum;
	} // getMaxNum
	
	public List<ReviewBoardDTO> getBoardList() {
		List<ReviewBoardDTO> boardList = null;
		try {
			con = new SQLConnection().getConnection();
			String sql = "select * from notice order by reviewNum desc";
			pstmt=con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			boardList = new ArrayList<>();
			while(rs.next()) {
				ReviewBoardDTO boardDTO = new ReviewBoardDTO();
				boardDTO.setReviewNum(rs.getInt("reviewNum"));
				boardDTO.setReviewId(rs.getString("reviewID"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return boardList;
	}



	public ReviewBoardDTO getBoard(int reviewNum) {
		ReviewBoardDTO boardDTO = null;
		try {
			con = new SQLConnection().getConnection();
			// sql 구문
			String sql = "select * from review where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, reviewNum);
			// 실행
			rs = pstmt.executeQuery();
			// 결과 행접근 => boardDTO 객체생성 => set메서드 호출 => 열접근 데이터 저장
			if(rs.next()) {
				boardDTO = new ReviewBoardDTO();
				boardDTO.setClassNum(rs.getInt("classNum"));
				boardDTO.setReviewNum(rs.getInt("reviewNum"));
				boardDTO.setReviewContent(rs.getString("reviewContent"));
				boardDTO.setReviewId(rs.getString("reviewID"));
				boardDTO.setReviewIssueDate(rs.getTimestamp("reviewIssueDate"));
				// 첨부파일
				boardDTO.setReviewFile(rs.getString("reviewFile"));
			}
			
 		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return boardDTO;
	} // getBoard



	public void updateBoard(ReviewBoardDTO boardDTO) {
		try {
			con = new SQLConnection().getConnection();
			// sql 구문
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}



	
	
	

}
