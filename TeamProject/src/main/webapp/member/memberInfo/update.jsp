<%@page import="com.itwillbs.domain.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/memberInfo/update.jsp</title>
</head>
<body>
<h1>나의정보수정</h1>
<% 
String memberId = (String) session.getAttribute("memberId");
String memberNickname = (String) session.getAttribute("memberNickname");
String memberName = (String) session.getAttribute("memberName");
String memberBirthday = (String) session.getAttribute("memberBirthday");
String memberGender = (String) session.getAttribute("memberGender");
String memberPhoneNumber = (String) session.getAttribute("memberPhoneNumber");
String memberEmail = (String) session.getAttribute("memberEmail");
%>
<form action = "updatePro.me" method="post">
아이디 : <input type="text" name="id" value="<%=memberId %>" readonly><br>
비밀번호 : <input type="submit" value="비밀번호 재설정" id="rePass" onclick="location.href='login.PasswordReset.me'" ><br>
닉네임 : <input type="text" name = "nick" value="<%=memberNickname%>"><br>
이름 : <input type="text" name="name" value="<%=memberName %>" readonly><br>
생년월일 : <input type="text" name="birth" value="<%=memberBirthday %>" readonly><br>
성별 : <input type="text" name="gender" value="<%=memberGender %>" readonly><br>
전화번호 : <input type="text" name="phone" value="<%=memberPhoneNumber %>"  ><br>
이메일 : <input type="text" name="email" value="<%=memberEmail%>"><br>
</form>

</body>
</html>