<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="shopcss.css">
  <link href="css/newfile.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<meta charset="UTF-8">
<title>member/login.jsp</title>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../../inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 -->
<h1>로그인</h1>

<form action="loginPro.me" method="post" name="checkForm" id ="checkForm">

<input type="text" placeholder="아이디" name="memberId" id ="memberId"><br>
<input type="password" placeholder="비밀번호" name="memberPassword" id = "memberPassword"><br>

<div id="div" style="color:red;"></div>

<button type ="button" onclick="checkForm_check();">로그인</button><br>
<input type="button" value="회원가입" onclick ="location.href='ghselect.me'">
<input type="button" value="아이디찾기" onclick ="location.href='findId.me'">
<input type="button" value="비밀번호 재설정" onclick ="location.href='findPassword.me'">
</form>

<script type="text/javascript">

function checkForm_check() {
	var memberId = document.getElementById("memberId");
	var memberPassword = document.getElementById("memberPassword");
	
	if(memberId.value ==""){
		//alert("이름입력하세요");
		document.getElementById("div").innerHTML = "아이디 입력하세요";
		return false; 
	}
	
	if(memberPassword.value ==""){
		//alert("이름입력하세요");
		document.getElementById("div").innerHTML = "비밀번호 입력하세요";
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