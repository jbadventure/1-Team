<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="shopcss.css">
  <link href="css/newfile.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../../inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 --> 
<%
String memberNickname = (String) session.getAttribute("memberNickname");
%>
<p>닉네임 <%= memberNickname %></p>

<img src="images/DefaultProfile.jpg" alt="기본프로필" width="300" height="250"><br>
<input type="button" value="회원정보변경" id="회원정보변경" onclick="location.href='update.me'"><br>
<input type="button" value="클래스관리" id="클래스관리" onclick="location.href='update.me'"><br>
<input type="button" value="예약관리" id="예약관리" onclick="location.href='update.me'">
 
<!-- 푸터들어가는 곳 -->
<jsp:include page="../../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</body>
</html>