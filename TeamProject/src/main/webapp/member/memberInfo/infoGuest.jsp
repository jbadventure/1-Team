<%@page import="com.itwillbs.domain.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="icon" href="images/favicon.ico?v=2" type="image/x-icon">
  <link rel="stylesheet" href="shopcss.css">
  <link href="css/NewTop.css" rel="stylesheet" type="text/css">
  <link href="css/NewBottom.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="css/infoGuest.css" type="text/css">
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<meta charset="UTF-8">
<title>palette</title>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../../inc/NewTop.jsp"></jsp:include>
<!-- 헤더들어가는 곳 --> 

<div id = bodycontainer>
<div id = bodycontent>

<%
MemberDTO memberDTO=(MemberDTO)request.getAttribute("memberDTO");
%>
<main>
<section id="info1">
<div id="info2">
<%if(memberDTO.getMemberFile()== null){
 %>	<img src="images/DefaultProfile.jpg" width="100" height="100px">
 		<% } else if(memberDTO.getMemberFile().equals("null")){  %>
		 <img src="images/DefaultProfile.jpg" width="100" height="100px">
     <%	} else { %>           
            	<img src="upload/<%=memberDTO.getMemberFile() %>" width="100" height="100px">
     <%			 }
%>
<p id="nick">
닉네임 </p> 
<p id="nick2"><%= memberDTO.getMemberNickname() %></p>
</div>
</section>
<br><br>
<section id="button">
<input type="button" value="개인정보수정" id="update" onclick="location.href='update.me'"><br>
<input type="button" value="예약내역" id="myReserve" onclick="location.href='myReserveList.or'"><br>
<input type="button" value="나의리뷰" id="myReview" onclick="location.href='myReview.rbo'"><br>
<input type="button" value="계정삭제" id="delete" onclick="location.href='delete.me'">
 </section>
 </main> 
 
 </div>
 </div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</body>
</html>