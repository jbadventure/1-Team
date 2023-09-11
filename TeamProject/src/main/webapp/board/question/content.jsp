<%@page import="com.itwillbs.domain.QuestionBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- head -->
<head>
  <link rel="stylesheet" href="shopcss.css">
  <link href="css/NewTop.css" rel="stylesheet" type="text/css">
  <link href="css/NewBottom.css" rel="stylesheet" type="text/css">
  <link href="css/loginbody.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<meta charset="UTF-8">
<title>member/login.jsp</title>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../../inc/NewTop.jsp"></jsp:include>
<!-- 헤더들어가는 곳 --> 
	<div class="container">
		<%
		QuestionBoardDTO boardDTO = (QuestionBoardDTO) request.getAttribute("boardDTO");
		String memberId = (String) session.getAttribute("memberId");
		%>
		<div class ="c1">
		자주 묻는 질문 조회
		</div>
		<table class="question">
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
		</table>
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
<jsp:include page="../../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</body>
</html>