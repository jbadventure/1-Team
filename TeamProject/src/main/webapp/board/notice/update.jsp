<%@page import="com.itwillbs.domain.NoticeBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
NoticeBoardDTO boardDTO = (NoticeBoardDTO)request.getAttribute("boardDTO");
%>
<h1>글수정</h1>
<div class="container">
<form action="noticeUpdatePro.nbo" method="post">
<input type="hidden" name="noticeNum" value="<%=boardDTO.getNoticeNum() %>">
<table border = "1">
        <div class="form-group">
            <label for="title">제목</label>
            <input type="text" id="title" name="noticeSubject" required>
        </div>
        <div class="form-group">
            <label for="content">내용</label>
            <textarea id="content" name="noticeContent" rows="5" required></textarea>
        </div>
        <div class="form-group">
            <label for="date">수정일</label>
            <input type="date" id="date" name="noticeIssueDate" required>
        </div>
        <button type="submit">수정</button>
        </table>

</table>

</form>
</div>

</body>
</html>