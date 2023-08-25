<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/loginsuccess.jsp</title>
</head>
<body>
	<script type="text/javascript">
	alert('비밀번호가 성공적으로 변경되었습니다.');
	<%response.sendRedirect("login.me");%>
	</script>
</body>
</html>