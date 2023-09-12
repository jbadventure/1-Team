<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="shopcss.css">
  <link href="css/NewTop.css" rel="stylesheet" type="text/css">
  <link href="css/NewBottom.css" rel="stylesheet" type="text/css">
  <link href="css/loginbody.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../../inc/NewTop.jsp"></jsp:include>
<!-- 헤더들어가는 곳 --> 


<div id = bodycontainer>
<div id = bodycontent>

<h2 id="loghead">계정삭제</h2>
<form action="deletePro.me" id="checkForm" method="post">
<section>
<input type = "text" name="memberId" id="memberId" placeholder="아이디"><br>
<input type = "password" name="memberPassword" id="memberPassword" placeholder="비밀번호"><br>
</section>

<section>
<input type="submit" value="삭제" id="login">
<input type="reset" value="취소" id="login">
</section>
</form>
</div>
</div>

<script type="text/javascript" src="script/jquery-3.7.0.js"></script>
<script type="text/javascript">    
$(document).ready(function(){
	// 버튼 클릭시
	$('#btn').click(function(){
		alert("계정이 삭제되었습니다")
		$('#fr').submit();
	}
	}
</script>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</body>
</html>