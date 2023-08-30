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

<form action="loginPro.me" method="post">

<input type="text" placeholder="아이디" name="memberId"><br>
<input type="password" placeholder="비밀번호" name="memberPassword"><br>

<input type="submit" value="로그인"><br>
<input type="button" value="회원가입" onclick ="location.href='ghselect.me'">
<input type="button" value="아이디찾기" onclick ="location.href='findId.me'">
<input type="button" value="비밀번호찾기" onclick ="location.href='findPassword.me'">
</form>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</body>
</html>