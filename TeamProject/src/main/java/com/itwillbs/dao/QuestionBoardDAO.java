package com.itwillbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.QuestionBoardDTO;


public class QuestionBoardDAO {
	
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs =null;

	public void dbClose() {
		if(rs != null) {try {rs.close();} catch (SQLException e) {	}}			
		if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {	}}
		if(con != null) {try {con.close();} catch (SQLException e) {	}}
	}

	public List<QuestionBoardDTO> getBoardList(PageDTO pageDTO) {
		System.out.println("QuestionBoardDTO");
		List<QuestionBoardDTO> boardList = null;
		try {
			// db 연결
			con = new SQLConnection().getConnection();
			// sql 구문
			String sql = "select * from question order by questionNum desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pageDTO.getStartRow()-1);
			pstmt.setInt(2, pageDTO.getPageSize());
			// 실행
			rs = pstmt.executeQuery();
			boardList = new ArrayList<>();
			//
			while(rs.next()) {
				QuestionBoardDTO boardDTO = new QuestionBoardDTO();
				boardDTO.setQuestionNum(rs.getInt("questionNum"));
				boardDTO.setQuestionQuestion(rs.getString("questionQuestion"));
				boardDTO.setQuestionAnswer(rs.getString("questionAnswer"));
				boardDTO.setQuestionCategory(rs.getString("questionCategory"));
				
				boardList.add(boardDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boardList;
	} // getBoardList

	public int getBoardCount() {
		System.out.println("QuestionBoardDAO getBoardCount");
		int count=0;
		try {
			// db 연결
			con = new SQLConnection().getConnection();
			// sql 구문
			String sql = "select count(*) from question";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt("count(*)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return count;
	} //getBoardCount

	public void insertBoard(QuestionBoardDTO boardDTO) {
		try {
			// db연결
			con = new SQLConnection().getConnection();
			// sql 구문
			String sql = "insert into question(questionQuestion, questionAnswer, questionNum, questionCategory) values(?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, boardDTO.getQuestionQuestion());
			pstmt.setString(2, boardDTO.getQuestionAnswer());
			pstmt.setInt(3, boardDTO.getQuestionNum());
			pstmt.setString(4, boardDTO.getQuestionCategory());
			// 실행
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		
	} // insertBoard
	
	public int getMaxNum() {
		int questionNum = 0;
		try {
			// db 연결
			con = new SQLConnection().getConnection();
			// sql 구문
			String sql = "select max(questionNum) from question";
			pstmt = con.prepareStatement(sql);
			// 실행
			rs = pstmt.executeQuery();
			//
			if(rs.next()) {
				questionNum = rs.getInt("max(questionNum)");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return questionNum;
	} // getMaxNum

	public QuestionBoardDTO getBoard(int questionNum) {
		QuestionBoardDTO boardDTO = null;
		try {
			// db
			con = new SQLConnection().getConnection();
			// sql
			String sql = "select * from question where questionNum = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, questionNum);
			// 실행
			rs = pstmt.executeQuery();
			// 
			if(rs.next()) {
				boardDTO = new QuestionBoardDTO();
				boardDTO.setQuestionAnswer(rs.getString("questionAnswer"));
				boardDTO.setQuestionCategory(rs.getString("questionCategory"));
				boardDTO.setQuestionNum(rs.getInt("questionNum"));
				boardDTO.setQuestionQuestion(rs.getString("questionQuestion"));
			}
					
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return boardDTO;
	} //getBoard

	public void updateBoard(QuestionBoardDTO boardDTO) {
		try {
			// db
			con = new SQLConnection().getConnection();
			// sql
			String sql = "update question set questionQuestion=?, questionAnswer=?, questionCategory=? where questionNum =? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, boardDTO.getQuestionQuestion());
			pstmt.setString(2, boardDTO.getQuestionAnswer());
			pstmt.setString(3, boardDTO.getQuestionCategory());
			pstmt.setInt(4, boardDTO.getQuestionNum());
			// 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
	} // updateBoard

	public void deleteBoard(int questionNum) {
		try {
			// db
			con = new SQLConnection().getConnection();
			// sql
			String sql = "delete from question where questionNum = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, questionNum);
			// 실행
			pstmt.executeUpdate();
			} catch (Exception e) {
			e.printStackTrace();
		    } finally {
		    	dbClose();
		    }
	   } // deleteBoard

}
