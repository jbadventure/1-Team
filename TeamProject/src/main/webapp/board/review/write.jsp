<%@page import="com.itwillbs.domain.ReviewBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
</head>
<body>
<%
String memberId = (String)session.getAttribute("memberId");
ReviewBoardDTO boardDTO = (ReviewBoardDTO)request.getAttribute("boardDTO");
%>
<header>
    <h1>리뷰 작성</h1>
</header>
<div class="container">
    <form action="reviewWritePro.rbo" method="post">
    <table border = "1">
      <div class="form-group">
            <label for="title">제목</label>
            <input type="text" name="reviewSubject" required>
        </div>
        <div class="form-group">
            <label for="content">내용</label>
            <textarea name="reviewContent" rows="5" required></textarea>
        </div>
        <div class="form-group">
           <label for="file">첨부파일</label>
         
        </div>
        <div class="form-group">
           <label for ="date" name ="reviewIssueDate"> 작성일 : <%=boardDTO.getReviewIssueDate() %> </label>
           <input type="date" name="reviewIssueDate" required>
        </div>
        <button type="submit">작성</button>
        </table>
     </form>  
</div>

</body>
</html>