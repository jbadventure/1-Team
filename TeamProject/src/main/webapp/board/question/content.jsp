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
	<header></header>
	<div class="container">
		<%
		String memberId = (String) session.getAttribute("memberId");
		QuestionBoardDTO boardDTO = (QuestionBoardDTO) request.getAttribute("boardDTO");
		%>
		<h1>자주 묻는 질문 조회</h1>
		<div class="question">
			<tr>
				<td>분류</td>
				<td><%=boardDTO.getQuestionCategory()%></td>
			</tr>
			<tr>
				<td>글번호</td>
				<td><%=boardDTO.getQuestionNum()%></td>
			</tr>
			<h2><%=boardDTO.getQuestionQuestion()%></h2>
			<p><%=boardDTO.getQuestionAnswer()%></p>
		</div>
		<%
		if ("admin".equals(memberId)) {
		%>
		<div class="add-button">
			<button onclick="window.location.href='questionUpdate.qbo?questionNum=<%=boardDTO.getQuestionNum()%>'">질문 수정</button>
		</div>
		<div class="add-button">
			<button onclick="window.location.href='questionDelete.qbo?questioneNum=<%=boardDTO.getQuestionNum()%>'">질문 삭제</button>
		</div> 
		<%
}
%>
	</div>
</body>
</html>