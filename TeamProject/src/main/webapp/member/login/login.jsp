<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/login.jsp</title>
</head>
<body>
<h1>로그인</h1>

<form action="loginPro.me" method="post">

아이디 : <input type="text" name="memberId"><br>
비밀번호 : <input type="password" name="memberPassword"><br>

<input type="submit" value="로그인"><br>
<input type="button" value="회원가입" onclick ="location.href='ghselect.me'">
<input type="button" value="아이디찾기" onclick ="location.href='findId.me'">
<input type="button" value="비밀번호찾기" onclick ="location.href='findPassword.me'">
</form>

</body>
</html>