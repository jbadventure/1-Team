<%@page import="com.itwillbs.domain.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="shopcss.css">
  <link href="css/newfile.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
  <link rel="stylesheet" href="css/info.css">
  <link href="css/NewTop.css" rel="stylesheet" type="text/css">
  <link href="css/NewBottom.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>memberInfo/info.jsp</title>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../../inc/NewTop.jsp"></jsp:include>
<!-- 헤더들어가는 곳 --> 
<%
MemberDTO memberDTO=(MemberDTO)request.getAttribute("memberDTO");
if(memberDTO.getMemberType().equals("guest")){
	response.sendRedirect("infoGuest.me");
}
%>
<main>
<section id="info1">
<div id="info2">
<%if(memberDTO.getMemberFile()== null){
     %>
                <img src="images/DefaultProfile.jpg" width="100" height="100px">
     <%		}else{
     %>           
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
<input type="button" value="클래스관리" id="classManagement" onclick="location.href='classManagement.cbo'"><br>
<input type="button" value="예약관리" id="myReserve" onclick="location.href='myReserveList.or'"><br>
<input type="button" value="계정삭제" id="delete" onclick="location.href='delete.me'">
 </section>
 </main>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</body>
</html>