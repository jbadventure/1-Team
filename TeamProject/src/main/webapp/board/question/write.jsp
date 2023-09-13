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
<%
String memberId = (String)session.getAttribute("memberId");
%>
<header>
    <h1>질문 작성</h1>
</header>
<div class="container">
    <form action="questionWritePro.qbo" method="post">
    <table border = "1">
       <div class="form-group">
       <label for="category">분류</label>
       <input type="text" id="category" name="questionCategory">
       </div>
       <div class="form-group">
          <label for ="title">제목</label>
          <input type="text" id="title" name="questionQuestion" required>
       </div>
       <div class="form-group">
          <label for="content">내용</label>
          <textarea id="content" name="questionAnswer" rows="5" required></textarea>
       </div>
       <button type="submit">작성</button>
    </table>
    </form>
</div>

</body>
</html>