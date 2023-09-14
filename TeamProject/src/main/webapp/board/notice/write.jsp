<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="shopcss.css">
<link href="css/NewTop.css" rel="stylesheet" type="text/css">
<link href="css/NewBottom.css" rel="stylesheet" type="text/css">
<link href="css/loginbody.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css"
	rel="stylesheet">
<link rel="icon" href="images/favicon.ico?v=2" type="image/x-icon">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>palette</title>
</head>
<link rel = "stylesheet" href = "./css/noticewrite.css">
<body>
<jsp:include page="../../inc/NewTop.jsp"></jsp:include>
<%
String id = (String)session.getAttribute("id");
%>
   <div class="hhh"><h1>공지사항 작성</h1></div>
<div class="container">
    <form action="noticeWritePro.nbo" method="post">
    <table border = "1">
        <div class="title1">
            <label for="title">제목</label>
            <input type="text" id="title" name="noticeSubject" required>
        </div>
        <div class="content1">
            <label for="content">내용</label>
            <textarea id="content" name="noticeContent" rows="5" required></textarea>
<!--         </div> -->
<!--         <div class="form-group"> -->
<!--             <label for="date">작성일</label> -->
<!--             <input type="date" id="date" name="noticeIssueDate" required> -->
<!--         </div> -->
        <button type="submit">작성</button>
        </table>
    </form>
</div>
</body>
<jsp:include page="../../inc/bottom.jsp"></jsp:include>
</html>