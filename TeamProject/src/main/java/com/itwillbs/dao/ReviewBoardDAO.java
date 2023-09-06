package com.itwillbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.itwillbs.domain.PageDTO;
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
		System.out.println("ReviewBoardDAO insertBoard()");
		try {
			con = new SQLConnection().getConnection();
			String sql = "insert into review(classNum, reviewId, reviewContent, reviewFile) values (?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardDTO.getClassNum());
			pstmt.setString(2, boardDTO.getReviewId());
			pstmt.setString(3, boardDTO.getReviewContent());
			pstmt.setString(4, boardDTO.getReviewFile());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			dbClose();
		}
		
	} // insertBoard

	
	public List<ReviewBoardDTO> getBoardList(PageDTO pageDTO) {
		System.out.println("ReviewBoardDAO getBoardList()");
		List<ReviewBoardDTO> boardList = null;
		try {
			con = new SQLConnection().getConnection();
			// 3
			String sql = "select * from review order by reviewNum desc limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, pageDTO.getStartRow()-1);
			pstmt.setInt(2, pageDTO.getPageSize());
			// 4
			rs = pstmt.executeQuery();
			boardList = new ArrayList<>();
			// 5
			while(rs.next()) {
				ReviewBoardDTO boardDTO = new ReviewBoardDTO();
				boardDTO.setReviewNum(rs.getInt("reviewNum"));
				boardDTO.setReviewId(rs.getString("reviewID"));
				boardDTO.setClassNum(rs.getInt("classNum"));
				boardDTO.setReviewContent(rs.getString("reviewContent"));
				boardDTO.setReviewFile(rs.getString("reviewFile"));
				
				boardList.add(boardDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return boardList;
	}



	public ReviewBoardDTO getBoard(int classNum) {
		System.out.println("ReviewBoardDAO getBoard");
		ReviewBoardDTO boardDTO = null;
		try {
			con = new SQLConnection().getConnection();
			// sql 구문
			String sql = "select * from review where classNum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, classNum);
			// 실행
			rs = pstmt.executeQuery();
			// 결과 행접근 => boardDTO 객체생성 => set메서드 호출 => 열접근 데이터 저장
			if(rs.next()) {
				boardDTO = new ReviewBoardDTO();
				boardDTO.setReviewNum(rs.getInt("reviewNum"));
				boardDTO.setClassNum(rs.getInt("classNum"));
				boardDTO.setReviewId(rs.getString("reviewID"));
				boardDTO.setReviewIssueDate(rs.getTimestamp("reviewIssueDate"));
				boardDTO.setReviewContent(rs.getString("reviewContent"));
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
			String sql = "update review set reviewContent=?, reviewFile=?, classNum=? where reviewNum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, boardDTO.getReviewContent());
			pstmt.setString(2, boardDTO.getReviewFile());
			pstmt.setInt(3, boardDTO.getClassNum());
			pstmt.setInt(4, boardDTO.getReviewNum());
			// 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		
	} // updateBoard



	public void deleteBoard(int reviewNum) {
		try {
			// 1단계 JDBC 프로그램 가져오기 
			// 2단계 디비 연결
			con= new SQLConnection().getConnection();
			// 3
			String sql = "delete from review where reviewNum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, reviewNum);  
			// 4
			pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbClose();
			}
		
	}



	
	
	

}
