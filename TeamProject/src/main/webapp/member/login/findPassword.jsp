<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="shopcss.css">
  <link href="css/NewTop.css" rel="stylesheet" type="text/css">
  <link href="css/NewBottom.css" rel="stylesheet" type="text/css">
  <link href="css/find.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../../inc/NewTop.jsp"></jsp:include>
<!-- 헤더들어가는 곳 --> 
<div id ="bodycontainer">
<h1 id="head">비밀번호 재설정</h1>
<h4 id="head2">비밀번호는 가입시 사용한 아이디, 이름, 이메일을 통해 재설정 하실 수 있습니다.</h4>

<form action="findPasswordPro.me" method="post" name="checkForm" id ="checkFormPass">
<input type="text" placeholder="아이디" name="memberId" id ="memberId"><br>
<input type="text" placeholder="이름" name="memberName"  id ="memberName"><br>
<input type="text" placeholder="이메일" name="emailop1" id="emailop1">@<select name="emailop2" id="emailop2">
												   <option value="">이메일을 선택해주세요</option>
												   <option value="naver.com">naver.com</option>
												   <option value="gmail.com">gmail.com</option>
        							   		   	   </select><br>
<div id="div" style="color:red;"></div>

<button type ="button" onclick="checkForm_check();" id="btn">비밀번호재설정</button>
</form>
</div>

<script type="text/javascript">

function checkForm_check() {
	var memberId = document.getElementById("memberId");
	var memberName = document.getElementById("memberName");
	var emailop1 = document.getElementById("emailop1");
	var emailop2 = document.getElementById("emailop2");
	
	if(memberId.value ==""){
		//alert("이름입력하세요");
		document.getElementById("div").innerHTML = "아이디 입력하세요";
		return false; 
	}
	
	if(memberName.value ==""){
		//alert("이름입력하세요");
		document.getElementById("div").innerHTML = "이름 입력하세요";
		return false; 
	}
	
	if(emailop1.value ==""){
		//alert("이메일입력하세요");
		document.getElementById("div").innerHTML = "이메일 입력하세요";
		return false; 
	}
	
	if(emailop2.value ==""){
		//alert("이메일선택하세요");
		document.getElementById("div").innerHTML = "이메일 선택하세요";
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