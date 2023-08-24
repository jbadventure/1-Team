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
<input type="radio" name="login_check" value="게스트 회원 로그인">게스트 회원 로그인<br>
<input type="radio" name="login_check" value="호스트 회원 로그인">호스트 회원 로그인<br>
아이디 : <input type="text" name="id"><br>
비밀번호 : <input type="password" name="pass"><br>
<input type="submit" value="로그인"><input type="submit" value="아이디찾기"><input type="submit" value="비밀번호찾기">
</form>
</body>
</html>