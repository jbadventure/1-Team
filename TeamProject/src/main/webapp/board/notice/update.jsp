<%@page import="com.itwillbs.domain.NoticeBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="images/favicon.ico?v=2" type="image/x-icon">
<link rel="stylesheet" href="shopcss.css">
<link href="css/NewTop.css" rel="stylesheet" type="text/css">
<link href="css/NewBottom.css" rel="stylesheet" type="text/css">
<link href="css/loginbody.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css"
	rel="stylesheet">
<meta charset="UTF-8">
<title>palette</title>
</head>
<body>
<!-- 헤더들어가는 곳 -->
	<jsp:include page="../../inc/NewTop.jsp"></jsp:include>
	<!-- 헤더들어가는 곳 -->

<link rel="stylesheet" href="./css/noticeupdate.css">

	<%
NoticeBoardDTO boardDTO = (NoticeBoardDTO)request.getAttribute("boardDTO");
%>
	<h1>글수정</h1>
	<form action="noticeUpdatePro.nbo" method="post">
		<input type="hidden" name="noticeNum"
			value="<%=boardDTO.getNoticeNum()%>">
		<table border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" name="noticeSubject"
					value="<%=boardDTO.getNoticeSubject() %>"></td>
			</tr>
			<tr>
				<td>글내용</td>
				<td><textarea name="noticeContent" rows="5"><%=boardDTO.getNoticeContent() %></textarea></td>
			</tr>
			<label for="date">수정일</label>
			<input type="date" id="date" name="noticeIssueDate" required>
			<button type="submit">수정</button>
		</table>

		</table>

	</form>

</body>
</html>