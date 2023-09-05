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
// "memberId" 세션값 가져오기=> String memberId 변수 저장
MemberDTO memberDTO = (MemberDTO)request.getAttribute("memberDTO");
%>
<h1>비밀번호 재설정</h1>
<h4>비밀번호는 6자 이상이어야 합니다.</h4>

<%
if(memberDTO.getMemberId().equals("Value does not exist")){
%>
<p align="center" style = "font-size:20px">회원정보가 존재하지 않습니다 </p> 


<%
} else {
%>
<form action="PasswordResetPro.me" method="post">

<%=memberDTO.getMemberId() %>님의 새 비밀번호를 설정해주세요.<br>
<input type="password" placeholder="새 비밀번호" name="memberPassword"><br>
<input type="password" placeholder="새 비밀번호 확인" ><br>

<input type="submit" value="변경하기">
</form>

<%
}
%>

<!-- 푸터들어가는 곳 -->
<jsp:include page="../../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</body>
</html>