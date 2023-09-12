package com.itwillbs.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.itwillbs.dao.ClassBoardDAO;
import com.itwillbs.dao.ReviewBoardDAO;
import com.itwillbs.domain.ClassBoardDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReviewBoardDTO;
import com.mysql.cj.Session;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ClassBoardService {
	
	ClassBoardDAO boardDAO = null; 

	public List<ClassBoardDTO> getBoardList(PageDTO pageDTO) {
		System.out.println("ClassBoardService getBoardList()");
		List<ClassBoardDTO> boardList = null;
		try {
			// int startRow = 계산식; 
			int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
			// 시작하는 행	부터 끝나는 행까지 뽑아오기 

			// int endRow = 계산식;      
			int endRow = startRow+pageDTO.getPageSize()-1;
			//pageDTO 저장 <- startRow, endRow
			pageDTO.setStartRow(startRow);
			pageDTO.setEndRow(endRow);
					
			boardDAO = new ClassBoardDAO();
			boardList = boardDAO.getBoardList(pageDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boardList;
	}// getBoardList
	
	public List<ClassBoardDTO> getBoardList(PageDTO pageDTO, String classCategory) {
		System.out.println("ClassBoardService getBoardList()");
		List<ClassBoardDTO> boardList = null;
		try {
			// int startRow = 계산식; 
			int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
			// 시작하는 행	부터 끝나는 행까지 뽑아오기 

			// int endRow = 계산식;      
			int endRow = startRow+pageDTO.getPageSize()-1;
			//pageDTO 저장 <- startRow, endRow
			pageDTO.setStartRow(startRow);
			pageDTO.setEndRow(endRow);
					
			boardDAO = new ClassBoardDAO();
			boardList = boardDAO.getBoardList(pageDTO, classCategory);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boardList;
	}// getBoardList

	public int getBoardCount() {
		System.out.println("ClassBoardService getBoardCount()");
		int count=0; 
		try {
			// BoardDAO 객체생성 
			boardDAO = new ClassBoardDAO();
			// count = getBoardCount() 호출
			count = boardDAO.getBoardCount();
		} catch (Exception e) {
			e.printStackTrace();
			}
		return count;
	}//getBoardCount
	
	public int getBoardCount(String classCategory) {
		System.out.println("ClassBoardService getBoardCount()");
		int count=0; 
		try {
			// BoardDAO 객체생성 
			boardDAO = new ClassBoardDAO();
			// count = getBoardCount() 호출
			count = boardDAO.getBoardCount(classCategory);
		} catch (Exception e) {
			e.printStackTrace();
			}
		return count;
	}//getBoardCount

	public void insertBoard(HttpServletRequest request) {
		System.out.println("ClassBoardService insertBoard()");
		try {
			// request 한글처리 
			request.setCharacterEncoding("utf-8");
			
//			MultipartRequest 객체생성 사용 => 폴더에 파일업로드, 파라미터정보저장
//			import com.oreilly.servlet.MultipartRequest;
//			생성자 1) request 2) 업로드 할 파일경로 3) 파일크기 4) 한글처리 5) 파일이름변경
//			업로드 폴더 만들기 webapp - upload 폴더만들기
//			업로드 폴더 경로 => 물리적 경로
			String uploadPath = request.getRealPath("/upload");
			int maxSize = 10*1024*1024; 
			MultipartRequest multi 
			= new MultipartRequest(request, uploadPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
			
			// multi 파라미터값 가져오기 
			String classSubject = multi.getParameter("classSubject");
			int classPrice = Integer.parseInt(multi.getParameter("classPrice"));
			String classCategory = multi.getParameter("classCategory");
			String classLocation = multi.getParameter("classLocation");
			String classContent = multi.getParameter("classContent");
			String classFile = multi.getFilesystemName("classFile");
			
			// BoardDAO 객체생성 
			boardDAO = new ClassBoardDAO();
			// BoardDTO 객체생성  
			ClassBoardDTO boardDTO = new ClassBoardDTO();
			HttpSession session = request.getSession();
			// set메서드 호출 파라미터값 저장 
			boardDTO.setClassSubject(classSubject);
			boardDTO.setHostId(session.getAttribute("memberId").toString());
			boardDTO.setClassPrice(classPrice);
			boardDTO.setClassCategory(classCategory);
			boardDTO.setClassLocation(classLocation);
			boardDTO.setClassContent(classContent);
			boardDTO.setClassFile(classFile);
			System.out.println(boardDTO.getHostId());
			// 리턴할형없음 insertBoard(boardDTO) 호출 
			boardDAO.insertBoard(boardDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//insertBoard()

	public void updateBoard(HttpServletRequest request) {
		System.out.println("ClassBoardService updateBoard()");
		try {
			// => request 한글처리, request 값 가져오기, BoardDTO 값저장
			request.setCharacterEncoding("utf-8");
			int classNum = Integer.parseInt(request.getParameter("classNum"));
			String classSubject = request.getParameter("classSubject");
			int classPrice = Integer.parseInt(request.getParameter("classPrice"));
			String classCategory = request.getParameter("classCategory");
			String classLocation = request.getParameter("classLocation");
			String classContent = request.getParameter("classContent");
			
			ClassBoardDTO boardDTO =new ClassBoardDTO();
			boardDTO.setClassNum(classNum);
			boardDTO.setClassSubject(classSubject);
			boardDTO.setClassPrice(classPrice);
			boardDTO.setClassCategory(classCategory);
			boardDTO.setClassLocation(classLocation);
			boardDTO.setClassContent(classContent);
			
			// BoardDAO 객체생성 updateBoard(boardDTO) 호출
			boardDAO = new ClassBoardDAO();
			boardDAO.updateBoard(boardDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}// updateBoard
	}

	public void deleteBoard(HttpServletRequest request) {
		try {
			// request 한글처리
			request.setCharacterEncoding("utf-8");
			// request 파라미터값 가져오기
			int classNum = Integer.parseInt(request.getParameter("classNum"));
			// => BoardDAO 객체생성 deleteBoard(classNum) 호출
			boardDAO = new ClassBoardDAO();
			boardDAO.deleteBoard(classNum);
			} catch (Exception e) {
				e.printStackTrace();
			}
	}// deleteBoard

	public ClassBoardDTO getBoard(HttpServletRequest request) {
		System.out.println("ClassBoardService getBoard()");
		ClassBoardDTO boardDTO = null;
		try {
			// request 한글처리 
			request.setCharacterEncoding("utf-8");
			// request에 classNum 파라미터 값 가져오기
			int classNum = Integer.parseInt(request.getParameter("classNum"));
			System.out.println(classNum);
			// BoardDAO 객체생성 
			boardDAO = new ClassBoardDAO();
			// boardDTO = getBoard(classNum);
			boardDTO = boardDAO.getBoard(classNum);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boardDTO;
	} // getBoard

	public List<ClassBoardDTO> getBoardListSearch(PageDTO pageDTO) {
		System.out.println("BoardService getBoardListSearch()");
		List<ClassBoardDTO> boardList = null;
		try {
			// 시작하는 행부터 10개 뽑아오기
//			페이지번호     한화면에 보여줄 글개수 => 시작하는 행번호
//			currentPage         pageSize    => startRow
//			    1                 10        => (1-1)*10+1=>0*10+1=> 0+1=>1        ~ 10
//			    2                 10        => (2-1)*10+1=>1*10+1=>10+1=>11       ~ 20
//		        3                 10        => (3-1)*10+1=>2*10+1=>20+1=>21       ~ 30			
			
			
			int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
			// 시작하는 행부터 끝나는 행까지 뽑아오기
//			startRow  pageSize => endRow
//			    1         10   =>   1+10-1 =>10
//			    11        10   =>   11+10-1 =>20
//		        21        10   =>   21+10-1 =>30
			    		
			int endRow = startRow+pageDTO.getPageSize()-1;
			//pageDTO 저장 <= startRow, endRow
			pageDTO.setStartRow(startRow);
			pageDTO.setEndRow(endRow);
			
			// BoardDAO 객체생성
			boardDAO = new ClassBoardDAO();
			// boardList = getBoardList() 메서드 호출
			boardList = boardDAO.getBoardListSearch(pageDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boardList;
	}
	
	public int getBoardCountSearch(PageDTO pageDTO) {
		System.out.println("BoardService getBoardCountSearch()");
		int count=0;
		try {
			// BoardDAO 객체생성
			boardDAO = new ClassBoardDAO();
			// count = getBoardCount() 호출
			count = boardDAO.getBoardCountSearch(pageDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}//getBoardCount

	public List<ReviewBoardDTO> getReviewBoardList(HttpServletRequest request) {
		System.out.println("ReviewBoardService getReviewBoardList()");
		List<ReviewBoardDTO> boardList = null;
		try {
			// request 한글처리 
			request.setCharacterEncoding("utf-8");
			// request에 classNum 파라미터 값 가져오기
			int classNum = Integer.parseInt(request.getParameter("classNum"));
			System.out.println(classNum);
			
			boardDAO = new ClassBoardDAO();
			boardList = boardDAO.getReviewBoardList(classNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boardList;
	} // getReviewBoardList
	

}// 클래스



