<%@page import="com.itwillbs.domain.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="shopcss.css">
  <link href="css/NewTop.css" rel="stylesheet" type="text/css">
  <link href="css/NewBottom.css" rel="stylesheet" type="text/css">
  <link href="css/report.css" rel="stylesheet" type="text/css">
    <link rel="icon" href="images/favicon.ico?v=2" type="image/x-icon">
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<meta charset="UTF-8">
<title>palette</title>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../../inc/NewTop.jsp"></jsp:include>
<!-- 헤더들어가는 곳 --> 

<p align="center" style = "font-size:20px"> 비밀번호가 변경되었습니다. 새로운 비밀번호로 로그인 해주세요.<br>
<input type="button" value="메인으로가기" onclick="location.href='main.me'">
<input type="button" value="로그인 하기" onclick="location.href='login.me'">
</p>


<!-- 푸터들어가는 곳 -->
<jsp:include page="../../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</body>
</html>