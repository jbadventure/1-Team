<%@page import="com.itwillbs.domain.ReviewBoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reviewList</title>
</head>
<body>
<%
List<ReviewBoardDTO> boardList = (List<ReviewBoardDTO>)request.getAttribute("boardList");
%>
<header>
    <h2>클래스 리뷰</h2>
</header>
<div class = "container">
<%
for(int i=0; i<boardList.size(); i++){
	ReviewBoardDTO boardDTO = boardList.get(i);
    %>
  <div class = "review" href="reviewContent.rbo?reviewNum<%=boardDTO.getReviewNum() %>">
    
    <div class = "reviewNum">
          리뷰 번호 : <%=boardDTO.getReviewNum() %>
       </div>
    <div class = "classNum">
          클래스 번호 : <%=boardDTO.getClassNum() %>
       </div>
    <div class = "reviewID">
          후기 작성자 : <%=boardDTO.getReviewId() %>
       </div>
    <div class = "reviewIssueDate">
          후기 작성일시 : <%=boardDTO.getReviewIssueDate() %>
       </div>
    
 </div>
<% 
}
%>
    <div class="add-button">
            <button onclick="window.location.href='/TeamProject/reviewWrite.rbo'">리뷰 작성</button>
        </div>

</div>
     

</body>
</html>