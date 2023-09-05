<%@page import="com.itwillbs.domain.QuestionBoardDTO"%>
<%@page import="java.util.List"%>
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
	List<QuestionBoardDTO> boardList = (List<QuestionBoardDTO>) request.getAttribute("boardList");
	String memberId = (String)session.getAttribute("memberId");
	%>
	<header>
		<h1>자주 묻는 질문</h1>
	</header>
	<div class="container">
		<%
		for (int i = 0; i < boardList.size(); i++) {
			QuestionBoardDTO boardDTO = boardList.get(i);
		%>
		<div class="question"
			onclick="window.Location.href='questionContent.qbo?questionNum=<%=boardDTO.getQuestionNum()%>'">
			<tr>
				<td>분류</td>
				<td><%=boardDTO.getQuestionCategory()%></td>
			</tr>
			<tr>
				<td>질문번호</td>
				<td><%=boardDTO.getQuestionNum()%></td>
			</tr>
			<h2><%=boardDTO.getQuestionQuestion()%></h2>
			<p><%=boardDTO.getQuestionAnswer()%></p>
		</div>

		<%
}
%>
<%
if ("admin".equals(memberId)) {
%>
		<div class="add-button">
			<button onclick="location.href='questionWrite.qbo'">질문 작성</button>
		</div>

	</div>
<%
}
%>
</body>
</html>