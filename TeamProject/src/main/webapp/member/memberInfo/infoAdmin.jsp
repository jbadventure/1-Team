<%@page import="com.itwillbs.domain.MemberDTO"%>
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
MemberDTO memberDTO=(MemberDTO)request.getAttribute("memberDTO");
%>

<h1>마이페이지</h1>
관리자 | <%= memberDTO.getMemberNickname() %> <br>
사이트현황 조회
<input type="button" value="회원정보 조회" id="memberSearch" onclick="location.href='update.me'"><br>
<input type="button" value="클래스 등록정보" id="classSearch" onclick="location.href='update.me'"><br>
<input type="button" value="예약정보" id="reserveSerch" onclick="location.href='update.me'"><br>
<input type="button" value="취소정보" id="cancleSerch" onclick="location.href='update.me'"><br>
<input type="button" value="자주묻는질문 이동" id="question" onclick="location.href='update.me'"><br>
<input type="button" value="공지게시판 이동" id="notice" onclick="location.href='update.me'">
<!-- 푸터들어가는 곳 -->
<jsp:include page="../../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</body>
</html>