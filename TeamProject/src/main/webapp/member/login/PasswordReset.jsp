<%@page import="com.itwillbs.domain.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// "memberId" 세션값 가져오기=> String memberId 변수 저장
String memberId = (String)session.getAttribute("memberId");
%>
<h1>비밀번호 재설정</h1>
<h4>비밀번호는 6자 이상이어야 합니다.</h4>

<form action="PasswordResetPro.me" method="post">

아이디 : <input type="text" name="memberId" value="<%=memberId %>"><br>
새 비밀번호 : <input type="password" name="memberPassword"><br>
새 비밀번호 확인 : <input type="password" ><br>

<input type="submit" value="변경하기">
</form>
</body>
</html>