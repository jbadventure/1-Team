<%@page import="com.itwillbs.domain.QuestionBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
</head>
<body>
	<%
	QuestionBoardDTO boardDTO = (QuestionBoardDTO) request.getAttribute("boardDTO");
	%>
	<h1>수정</h1>
	<form action="questionUpdatePro.qbo" method="post">
		<input type="hidden" name="questionNum"
			value="<%=boardDTO.getQuestionNum()%>">
		<table border="1">
			<tr>
				<td>분류</td>
				<td><%=boardDTO.getQuestionCategory()%></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="questionQuestion"
					value="<%=boardDTO.getQuestionQuestion()%>"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="questionAnswer" rows="5"><%=boardDTO.getQuestionAnswer()%></textarea></td>
			</tr>
			<button type="submit">수정</button>

		</table>
	</form>

</body>
</html>