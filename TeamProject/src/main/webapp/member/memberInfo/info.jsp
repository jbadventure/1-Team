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
String memberNickname = (String) session.getAttribute("memberNickname");
%>
<p>닉네임 <%= memberNickname %></p>

<img src="images/DefaultProfile.jpg" alt="기본프로필" width="300" height="250"><br>
<input type="button" value="회원정보변경" id="회원정보변경" onclick="location.href='update.me'"><br>
<input type="button" value="클래스관리" id="클래스관리" onclick="location.href='update.me'"><br>
<input type="button" value="예약관리" id="예약관리" onclick="location.href='update.me'">
 
</body>
</html>