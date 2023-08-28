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

<form action="findPasswordPro.me" method="post">

<input type="text" placeholder="아이디" name="memberId"><br>
<input type="text" placeholder="이름" name="memberName"><br>
<input type="email" placeholder="이메일" name="memberEmail"><br>

<input type="submit" value="비밀번호 재설정하기">
</form>

</body>
</html>