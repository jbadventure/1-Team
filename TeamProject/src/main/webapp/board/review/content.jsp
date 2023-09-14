<%@page import="com.itwillbs.domain.ReviewBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="icon" href="images/favicon.ico?v=2" type="image/x-icon">
<meta charset="UTF-8">
<title>palette</title>
</head>
<body>
      <header>
         <h1>리뷰 조회</h1>
      </header>
      <div class="container">
         <%
         String memberId = (String)session.getAttribute("memberId");
         ReviewBoardDTO boardDTO = (ReviewBoardDTO) request.getAttribute("boardDTO");
         %>
      <div class="reviewNum">
          후기번호 : <%=boardDTO.getReviewNum() %>
      </div>
      <div class="classNum">
          클래스번호 : <%=boardDTO.getClassNum() %>
      </div>
      <div class="reviewID">
          후기작성자 : <%=boardDTO.getReviewId() %>
      </div>
      <div class="reviewContent">
          후기 내용 : <%=boardDTO.getReviewContent() %>
      </div>
      <div class="reviewFile">
          첨부파일 : <%=boardDTO.getReviewFile() %>
      </div>
      <div class="reviewIssueDate">
          작성일자 : <%=boardDTO.getReviewIssueDate() %>
      </div>
      
      </div>
      
<!--  로그인, 글쓴이 일치하면 => 글수정, 글삭제 보이기 -->
<% 
if(memberId != null){
	if(memberId.equals(boardDTO.getReviewId())){
		%>    
		<input type="button" value="리뷰 수정" class="btn" 
       					onclick="location.href='reviewUpdate.rbo?reviewNum=<%=boardDTO.getReviewNum()%>'">
  		<input type="button" value="리뷰 삭제" class="btn" 
       					onclick="location.href='reviewDelete.rbo?reviewNum=<%=boardDTO.getReviewNum()%>'">
       <%
	}
}
    %>
</body>
</html>