
<%@page import="com.itwillbs.domain.PageDTO"%>
<%@page import="com.itwillbs.domain.QuestionBoardDTO"%>
<%@page import="java.util.List"%>
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
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css"
	rel="stylesheet">
<meta charset="UTF-8">
<title>question/list.jsp</title>
<script type="text/javascript">
	console.log('test');
	function toggleItem(detailId) {
		let detail = document.getElementById(detailId);
		if (detail.style.display === 'none' || detail.style.display === '') {
			detail.style.display = 'block';
			detail.classList.add('active');
		} else {
			detail.style.display = 'none'
			detail.classList.remove('active');
		}
	}
</script>
</head>

<body>
	<!-- 헤더들어가는 곳 -->
	<jsp:include page="../../inc/NewTop.jsp"></jsp:include>
	<!-- 헤더들어가는 곳 -->

	<link rel="stylesheet" href="./css/questionlist.css">

	<%
	List<QuestionBoardDTO> boardList = (List<QuestionBoardDTO>) request.getAttribute("boardList");
	PageDTO pageDTO = (PageDTO) request.getAttribute("pageDTO");
	String memberId = (String) session.getAttribute("memberId");
	%>
	<div class="container">
		<h1>자주 묻는 질문</h1>
		<%
		for (int i = 0; i < boardList.size(); i++) {
			QuestionBoardDTO boardDTO = boardList.get(i);
		%>

		<div class="question" style="opacity: 1; display: block;">
			<%-- 				onclick="location.href='questionContent.qbo?questionNum=<%=boardDTO.getQuestionNum()%>'"> --%>

			<ul class="a1 items">
				<li class="question-item"
					onclick="toggleItem('<%=boardDTO.getQuestionNum()%>')">
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
					<div id="<%=boardDTO.getQuestionNum()%>" class="detail" id="questionNum" name ="questionNum">
						<p><%=boardDTO.getQuestionAnswer()%></p>
						<%
						if ("admin".equals(memberId)) {
						%>
						<div class="add-button">
							<button  class="boardbtn" 
								onclick="window.location.href='questionUpdate.qbo?questionNum=<%=boardDTO.getQuestionNum()%>'">질문
								수정</button>
						</div>
						<div class="add-button">
							<button  class="boardbtn" 
								onclick="window.location.href='questionDelete.qbo?questioneNum=<%=boardDTO.getQuestionNum()%>'">질문
								삭제</button>
						</div>
						<%
}
%>
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
			<button  class="boardbtn"  onclick="location.href='questionWrite.qbo'">질문 작성</button>
		</div>
	</div>
	<%
}
%>

	<div class="pagec">
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

		<%
		//끝페이지번호  전체페이지수 비교 => 전체페이지수 크면 => Next보임
		if (pageDTO.getEndPage() < pageDTO.getPageCount()) {
		%>
		<a
			href="questionList.qbo?pageNum=<%=pageDTO.getStartPage() + pageDTO.getPageBlock()%>">Next</a>
		<%
		}
		%>
	</div>
	
	</div>
	<jsp:include page="../../inc/bottom.jsp"></jsp:include>
	<!-- 푸터들어가는 곳 -->


</body>
</html>
