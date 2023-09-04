<%@page import="com.itwillbs.domain.QuestionBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>content</title>
</head>
<body>
	<header>조회</header>
	<div class="container">
		<%
QuestionBoardDTO boardDTO = (QuestionBoardDTO) request.getAttribute("boardDTO");
%>
		<div class="question">
			<tr>
				<td>글번호</td>
				<td><%=boardDTO.getQuestionNum()%></td>
			</tr>
			<h2><%=boardDTO.getQuestionQuestion()%></h2>
			<p><%=boardDTO.getQuestionAnswer()%></p>
		</div>
		<div class="add-button">
			<button
				onclick="location.href='questionUpdate.qbo?questionNum=<%=boardDTO.getQuestionNum()%>'">
				수정</button>
		</div>
		<div class="add-button">
			<button
				onclick="location.href='questionDelete.qbo?questionNum=<%=boardDTO.getQuestionNum()%>'">
				삭제</button>
		</div>
	</div>
</body>
</html>