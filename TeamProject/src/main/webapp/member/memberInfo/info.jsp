<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- form -->
<%
String memberNickname = (String) session.getAttribute("memberNickname");
%>
<p>닉네임 <%= memberNickname %></p>

<img src="nnn.jpg" alt="기존이미지" width="300" height="250"><br>
<input type="button" value="회원정보변경" id="회원정보변경"><br>
<input type="button" value="클래스관리" id="클래스관리"><br>
<input type="button" value="예약관리" id="예약관리">

<!-- script -->
<script type="text/javascript" src="../../script/jquery-3.7.0.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$('#회원정보변경').click(function(){
		window.location.href = 'update.jsp';
	});
	
	$('#클래스관리').click(function(){
		window.location.href = 'update.jsp';
	});
	
	$('#예약관리').click(function(){
		window.location.href = 'update.jsp';
	});
});

</script>
</body>
</html>