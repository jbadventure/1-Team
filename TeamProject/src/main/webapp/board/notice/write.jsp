<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 작성</title>
</head>
<link rel = "stylesheet" href = "./css/write.css">
<body>
<%
String id = (String)session.getAttribute("id");
%>
<header>
    <h1>공지사항 작성</h1>
</header>
<div class="container">
    <form action="noticeWritePro.nbo" method="post">
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
            <label for="date">작성일</label>
            <input type="date" id="date" name="noticeIssueDate" required>
        </div>
        <button type="submit">작성</button>
        </table>
    </form>
</div>
</body>
</html>