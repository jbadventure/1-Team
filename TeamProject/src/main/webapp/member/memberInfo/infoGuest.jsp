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
닉네임 | <%= memberDTO.getMemberNickname() %> <br>

프로필사진 | <%if(memberDTO.getMemberFile()== null){
     %>
                <img src="images/DefaultProfile.jpg" width="100" height="100px">
     <%		}else{
     %>           
            	<img src="upload/<%=memberDTO.getMemberFile() %>" width="100" height="100px">
     <%			 }
     %><br>
<input type="button" value="개인정보수정" id="개인정보수정" onclick="location.href='update.me'"><br>
<input type="button" value="예약내역" id="예약내역" onclick="location.href='myReserveList.or'"><br>
<input type="button" value="내가 쓴 리뷰" id="내가 쓴 리뷰" onclick="location.href='myReview.rbo'">

<!-- 푸터들어가는 곳 -->
<jsp:include page="../../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</body>
</html>