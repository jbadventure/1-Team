<%@page import="com.itwillbs.domain.ReviewBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>review 수정</title>
</head>
<body>
<%
ReviewBoardDTO boardDTO = (ReviewBoardDTO) request.getAttribute("boardDTO");
%>
     <h1>글수정</h1>
     
     <form action="reviewUpdatePro.rbo" method="post">
         <input type="hidden" name="reviewNum" value="<%=boardDTO.getReviewNum() %>">
         <tabele border = "1">
            <tr>
               <td>후기 내용</td>
               <td><input type="text" name="reviewContent" value="<%=boardDTO.getReviewContent() %>"></td>
            </tr>
            <tr>
               <td>첨부파일</td>
               <td><input type="file" name="reviewFile" value="<%=boardDTO.getReviewFile() %>"></td>
            </tr>
           </tabele>
           <div class="add-button">
            <button onclick="window.location.href='/TeamProject/reviewList.rbo'">리뷰 수정</button>
        </div>
     </form>
</body>
</html>