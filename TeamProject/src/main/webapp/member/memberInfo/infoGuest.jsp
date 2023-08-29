jsp

<%@page import="com.itwillbs.domain.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/memberInfo/infoGuest.jsp</title>
</head>
<body>

<%
// 세션에서 로그인 정보 가져오기
String id=(String)session.getAttribute("id");
MemberDTO memberDTO = (MemberDTO)request.getAttribute("memberDTO");
%>
<h1>게스트 마이페이지</h1>
<%-- <p>닉네임 <%= memberDTO.getMemberNickname() %></p> --%>

<%-- <img src="upload/<%= memberDTO.getMemberFile() %>" width="100" height="100" --%>
<!--  alt="프로필사진" width="300" height="250"> -->
<input type="button" value="개인정보수정" id="개인정보수정" onclick="location.href='update.me'"><br><br>
<input type="button" value="예약정보" id="예약정보"><br>
<input type="button" value="예약관리" id="결제내역"><br>
<input type="button" value="나의 게시판 활동내역" id="나의 게시판 활동내역">
 
</body>
</html>