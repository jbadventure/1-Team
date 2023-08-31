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
String memberNickname = (String) session.getAttribute("memberNickname");
String memberFile = (String) session.getAttribute("memberFile");
%>


<h1>게스트 마이페이지</h1>
닉네임 | <%= memberNickname %> <br>

프로필사진 | <%if(memberFile == null){
     %>
                <img src="images/DefaultProfile.jpg" width="100" height="100px">
     <%		}else{
     %>           
            	<img src="upload/<%=memberFile %>" width="100" height="100px">
     <%			 }
     %><br>
<input type="button" value="개인정보수정" id="개인정보수정" onclick="location.href='update.me'"><br>
<input type="button" value="예약정보" id="예약정보" onclick="location.href='reserveInfo.me'"><br>
<input type="button" value="결제내역" id="결제내역" onclick="location.href='payment.me'"><br>
<input type="button" value="나의 게시판 활동내역" id="나의 게시판 활동내역"><br>

</body>
</html>