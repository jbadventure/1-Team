
<%@page import="com.itwillbs.domain.PageDTO"%>
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
<link rel="stylesheet" href="./css/questionlist.css">
<body>
	<%
	List<QuestionBoardDTO> boardList = (List<QuestionBoardDTO>) request.getAttribute("boardList");
	String memberId = (String) session.getAttribute("memberId");
	PageDTO pageDTO = (PageDTO) request.getAttribute("pageDTO");
	%>
	<header> </header>
	<div class="container">
		<h1>자주 묻는 질문</h1>
		<%
		for (int i = 0; i < boardList.size(); i++) {
			QuestionBoardDTO boardDTO = boardList.get(i);
		%>

		<div class="question" style="opacity: 1; display: block;"
			onclick="location.href='questionContent.qbo?questionNum=<%=boardDTO.getQuestionNum()%>'">

			<ul class="a1">
				<li>
					<div class="a2">
						<div class="a3">질문</div>
						<div class="questionNum">
							<input type="hidden" value="<%=boardDTO.getQuestionNum()%>">
						</div>
						<div class="a4"><%=boardDTO.getQuestionQuestion()%></div>
						<div class="questionAnswer">
							<input type="hidden" value="<%=boardDTO.getQuestionAnswer()%>">
						</div>
					</div>
				</li>
			</ul>
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
		<div class="add-button">
			<button onclick="location.href='questionDelete.qbo'">질문 삭제</button>
		</div>

	</div>
	<%
}
%>
	<%
 // 시작페이지 1페이지 prev 없음
 if (pageDTO.getStartPage() > pageDTO.getPageBlock()) {
 %>
	<a
		href="questionList.qbo?pageNum=<%=pageDTO.getStartPage() - pageDTO.getPageBlock()%>">Prev</a>
	<%
}
%>
	<%
 for (int i = pageDTO.getStartPage(); i <= pageDTO.getEndPage(); i++) {
 %>
	<a href="questionList.qbo?pageNum=<%=i%>"><%=i%></a>
	<%
	}
	%>

</body>
</html>