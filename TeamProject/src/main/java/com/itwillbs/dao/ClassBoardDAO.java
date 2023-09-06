package com.itwillbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.itwillbs.domain.ClassBoardDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReviewBoardDTO;

public class ClassBoardDAO {

	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs =null;

	public void dbClose() {
		if(rs != null) {try {rs.close();} catch (SQLException e) {	}}			
		if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {	}}
		if(con != null) {try {con.close();} catch (SQLException e) {	}}
	}// dbClose
		
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
				boardDTO.setHostId(rs.getString("hostId"));
				boardDTO.setClassIssueDate(rs.getTimestamp("classIssuedate"));
				boardDTO.setClassLocation(rs.getString("classLocation"));
				boardDTO.setClassCategory(rs.getString("classCategory"));
				boardDTO.setClassContent(rs.getString("classContent"));
				boardDTO.setClassPrice(rs.getInt("classPrice"));
				boardDTO.setClassFile(rs.getString("classFile"));
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
			String sql = "select count(*) from class;";
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

	public void insertBoard(ClassBoardDTO boardDTO) {
		System.out.println("ClassBoardDTO insertBoard()");
		try {
			// 1단계 JDBC 프로그램 가져오기 
			// 2단계 디비 연결
			con = new SQLConnection().getConnection();

			// 3단계 문자열 -> sql구문 변경
			String sql = "insert into class(classSubject,hostId,classPrice,classCategory,classLocation,classContent, classFile) values(?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, boardDTO.getClassSubject()); 
			pstmt.setString(2, boardDTO.getHostId()); 
			pstmt.setInt(3, boardDTO.getClassPrice());
			pstmt.setString(4, boardDTO.getClassCategory());
			pstmt.setString(5, boardDTO.getClassLocation());
			pstmt.setString(6, boardDTO.getClassContent());
			pstmt.setString(7, boardDTO.getClassFile());
			// 4단계 sql구문 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
	}//insertBoard()

	public ClassBoardDTO getBoard(int classNum) {
		System.out.println("ClassBoardDAO getBoard()");
		ClassBoardDTO boardDTO = null;
		try {
			con = new SQLConnection().getConnection();
			String sql = "select * from class where classNum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, classNum);
			rs =pstmt.executeQuery();
			
			if(rs.next()) {
				boardDTO = new ClassBoardDTO();
				boardDTO.setClassNum(rs.getInt("classNum"));
				boardDTO.setClassSubject(rs.getString("classSubject"));
				boardDTO.setHostId(rs.getString("hostId"));
				boardDTO.setClassIssueDate(rs.getTimestamp("classIssuedate"));
				boardDTO.setClassLocation(rs.getString("classLocation"));
				boardDTO.setClassCategory(rs.getString("classCategory"));
				boardDTO.setClassContent(rs.getString("classContent"));
				boardDTO.setClassPrice(rs.getInt("classPrice"));
				boardDTO.setClassFile(rs.getString("classFile"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return boardDTO;
	} // getBoard
	
	public void updateBoard(ClassBoardDTO boardDTO) {
		try {
			// 1단계 JDBC 프로그램 가져오기 
			// 2단계 디비 연결
			con= new SQLConnection().getConnection();
			// 3단계 sql구문 
			String sql = "update class set classSubject=?,classPrice=?,classCategory=?,classLocation=?,classContent=? where classNum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, boardDTO.getClassSubject()); 
			pstmt.setInt(2, boardDTO.getClassPrice());
			pstmt.setString(3, boardDTO.getClassCategory());
			pstmt.setString(4, boardDTO.getClassLocation());
			pstmt.setString(5, boardDTO.getClassContent());
			pstmt.setInt(6, boardDTO.getClassNum());
			// 4단계 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
	}// updateBoard

	public void deleteBoard(int classNum) {
		try {
			// 1단계 JDBC 프로그램 가져오기 
			// 2단계 디비 연결
			con= new SQLConnection().getConnection();
			// 3
			String sql = "delete from class where classNum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, classNum);  
			// 4
			pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbClose();
			}
	}// deleteBoard

	public List<ClassBoardDTO> getBoardListSearch(PageDTO pageDTO) {
		System.out.println("BoardDAO getBoardListSearch()");
		List<ClassBoardDTO> boardList = null;
		try {
			//1,2 디비연결
			con= new SQLConnection().getConnection();
			//3 sql  => mysql 제공 => limit 시작행-1, 몇개
//			String sql="select * from board order by num desc";
			String sql="select * from class where classSubject like ? order by classNum desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+pageDTO.getSearch()+"%");
			pstmt.setInt(2, pageDTO.getStartRow()-1);//시작행-1
			pstmt.setInt(3, pageDTO.getPageSize());//몇개
			//4 실행 => 결과 저장
			rs = pstmt.executeQuery();
			// boardList 객체생성
			boardList = new ArrayList<>();
			//5 결과 행접근 => BoardDTO객체생성 => set호출(열접근저장)
			// => 배열 한칸에 저장
			while(rs.next()) {
				ClassBoardDTO classBoardDTO =new ClassBoardDTO();
				classBoardDTO.setClassNum(rs.getInt("classNum"));
				classBoardDTO.setHostId(rs.getString("hostId"));
				classBoardDTO.setClassSubject(rs.getString("classSubject"));
				classBoardDTO.setClassContent(rs.getString("classContent"));
				classBoardDTO.setClassIssueDate(rs.getTimestamp("classIssueDate"));
				classBoardDTO.setClassFile(rs.getString("classFile"));
				classBoardDTO.setClassPrice(rs.getInt("classPrice"));
				classBoardDTO.setClassLocation(rs.getString("classLocation"));
				classBoardDTO.setClassCategory(rs.getString("classCategory"));
				// => 배열 한칸에 저장
				boardList.add(classBoardDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return boardList;
	}//getBoardListSearch()
	
	public int getBoardCountSearch(PageDTO pageDTO) {
		int count = 0;
		try {
			//1,2 디비연결
			con= new SQLConnection().getConnection();
			//3 sql select count(*) from board
//String sql = "select count(*) from board where subject like '%검색어%';";
String sql = "select count(*) from class where classSubject like ?;";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "%"+pageDTO.getSearch()+"%");
			//4 실행 => 결과저장
			rs = pstmt.executeQuery();
			//5 결과 행접근 => 열접근 => count변수 저장
			if(rs.next()) {
				count = rs.getInt("count(*)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return count;
	}//getBoardCountSearch()

	public List<ReviewBoardDTO> getReviewBoardList(int classNum) {
		System.out.println("ReviewBoardDAO getReviewBoardList()");
		List<ReviewBoardDTO> boardList = null;
		try {
			con = new SQLConnection().getConnection();
			// 3
			String sql = "select * from review where classNum=? order by reviewNum desc";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, classNum);  
			// 4
			rs = pstmt.executeQuery();
			boardList = new ArrayList<>();
			// 5
			while(rs.next()) {
				ReviewBoardDTO boardDTO = new ReviewBoardDTO();
				boardDTO.setReviewNum(rs.getInt("reviewNum"));
				boardDTO.setClassNum(rs.getInt("classNum"));
				boardDTO.setReviewId(rs.getString("reviewID"));
				boardDTO.setReviewIssueDate(rs.getTimestamp("reviewIssueDate"));
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
	}// getReviewBoardList
	
}
