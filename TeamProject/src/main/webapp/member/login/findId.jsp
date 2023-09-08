<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="shopcss.css">
  <link href="css/NewTop.css" rel="stylesheet" type="text/css">
  <link href="css/NewBottom.css" rel="stylesheet" type="text/css">
  <link href="css/body.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../../inc/NewTop.jsp"></jsp:include>
<!-- 헤더들어가는 곳 --> 
<div id ="bodycontainer">
<h1>아이디찾기</h1>

<!-- form -->
<form action="findIdPro.me" method="post" name="checkForm" id ="checkForm">
<input type="text" placeholder="이름" name="memberName" id ="memberName"><br>
<input type="text" placeholder="이메일" name="emailop1" id="emailop1">@<select name="emailop2" id="emailop2">
												   <option value="">이메일을 선택해주세요</option>
												   <option value="naver.com">naver.com</option>
												   <option value="gmail.com">gmail.com</option>
        							   		   	   </select><br>
<div id="div" style="color:red;"></div>
 
<button type ="button" onclick="checkForm_check();">찾기</button>
</form>
</div>
<!-- script -->
<script type="text/javascript" src="../../script/jquery-3.7.0.js"></script>
<script type="text/javascript">

function checkForm_check() {
	var memberName = document.getElementById("memberName");
	var emailop1 = document.getElementById("emailop1");
	var emailop2 = document.getElementById("emailop2");
	
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