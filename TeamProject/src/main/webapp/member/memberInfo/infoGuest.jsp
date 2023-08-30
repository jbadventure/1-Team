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

MemberDTO memberDTO=(MemberDTO)request.getAttribute("memberDTO");

// if (memberNickname == null) {
//     // 로그인하지 않았을 경우 로그인 페이지로 이동
//     response.sendRedirect("../login/login.jsp");
// } else {
%>


<h1>게스트 마이페이지</h1>
<p>닉네임 : <%= memberDTO.getMemberNickname() %></p>

<p>프로필사진 : <a href="upload/<%= memberDTO.getMemberFile() %>" download>
        <%= memberDTO.getMemberFile() %></a>
<img src="upload/<%= memberDTO.getMemberFile() %>" 
         width="100" height="100"></p>
<input type="button" value="개인정보수정" id="개인정보수정" onclick="location.href='update.me'"><br><br>
<input type="button" value="예약정보" id="예약정보"><br>
<input type="button" value="예약관리" id="결제내역"><br>
<input type="button" value="나의 게시판 활동내역" id="나의 게시판 활동내역">
<%-- <%} %> --%>
</body>
</html>