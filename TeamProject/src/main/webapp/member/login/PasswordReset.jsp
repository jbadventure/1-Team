<%@page import="com.itwillbs.domain.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="shopcss.css">
  <link href="css/NewTop.css" rel="stylesheet" type="text/css">
  <link href="css/NewBottom.css" rel="stylesheet" type="text/css">
  <link href="css/find.css" rel="stylesheet" type="text/css">
    <link rel="icon" href="images/favicon.ico?v=2" type="image/x-icon">
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<meta charset="UTF-8">
<title>palette</title>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../../inc/NewTop.jsp"></jsp:include>
<!-- 헤더들어가는 곳 --> 
<%
// "memberId" 세션값 가져오기=> String memberId 변수 저장
MemberDTO memberDTO = (MemberDTO)request.getAttribute("memberDTO");
%>

<%
if(memberDTO.getMemberId().equals("Value does not exist")){
%>

<p align="center" style = "font-size:20px" id="memId">회원정보가 존재하지 않습니다. <br>
<input type="button" value="이전 페이지로 이동 " id="btn1" onclick="javascript:history.back();">
</p>
<%
} else {
%>
<div id ="bodycontainer">
<h1 id="head">비밀번호 재설정</h1>

<form action="PasswordReset.me" method="post" name="checkForm" id ="checkFormPass2">

<p id="memId2"><%=memberDTO.getMemberId() %>님의 새 비밀번호를 설정해주세요. </p><br>
<input type="hidden" name="memberId" value="<%=memberDTO.getMemberId() %>"/>
<input type="password" placeholder="새 비밀번호" name="memberPassword" id ="pass1"><br>
<input type="password" placeholder="새 비밀번호 확인" id="pass2"><br>

<div id="div" style="color:red;"></div>

<button type ="button" id="btn" onclick="checkForm_check();">변경하기</button>
</form>
</div>
<%
}
%>

<script type="text/javascript">
function checkForm_check() {
	var pass1 = document.getElementById("pass1");
	var pass2 = document.getElementById("pass2");
	
	if(pass1.value ==""){
		//alert("이름입력하세요");
		document.getElementById("div").innerHTML = "비밀번호 입력하세요";
		return false; 
	}
	
	if(pass1.value.length<6){
		//alert("이름입력하세요");
		document.getElementById("div").innerHTML = "비밀번호는 6자 이상이어야 합니다";
		return false; 
	}
	
	if(pass2.value ==""){
		//alert("이름입력하세요");
		document.getElementById("div").innerHTML = "비밀번호 확인 입력하세요";
		return false; 
	}
	
	if(pass1.value!=pass2.value){
		//alert("이름입력하세요");
		document.getElementById("div").innerHTML = "비밀번호와 비밀번호확인이 일치하지 않습니다";
		return false; 
	}
	document.checkForm.submit();
}	
</script>


<!-- 푸터들어가는 곳 -->
<jsp:include page="../../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</body>
</html>