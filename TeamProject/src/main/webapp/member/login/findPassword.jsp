<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>비밀번호 찾기</h1>
<h4>비밀번호는 가입시 사용한 아이디, 이름, 이메일을 통해 재설정 하실 수 있습니다.</h4>

<form action="PasswordReset.me" method="post">

아이디 : <input type="text" name="id"><br>
이름 : <input type="text" name="name"><br>
이메일 : <input type="email" name="email"><br>

<input type="submit" value="비밀번호 재설정하기">
</form>

</body>
</html>