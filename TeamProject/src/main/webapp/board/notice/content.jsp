<%@page import="com.itwillbs.domain.NoticeBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- head -->
<head>
<link rel="icon" href="images/favicon.ico?v=2" type="image/x-icon">
  <link rel="stylesheet" href="shopcss.css">
  <link href="css/NewTop.css" rel="stylesheet" type="text/css">
  <link href="css/NewBottom.css" rel="stylesheet" type="text/css">
  <link href="css/loginbody.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<meta charset="UTF-8">
<title>palette</title>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../../inc/NewTop.jsp"></jsp:include>
<!-- 헤더들어가는 곳 --> 

	<div class="container">
		<%
		NoticeBoardDTO boardDTO = (NoticeBoardDTO) request.getAttribute("boardDTO");
		String memberId = (String) session.getAttribute("memberId");
		%>
		<h1>공지사항 상세조회</h1>
		<div class="notice">
			<tr>
				<td>글번호</td>
				<td><%=boardDTO.getNoticeNum()%></td>
			</tr>
			<h2><%=boardDTO.getNoticeSubject()%></h2>
			<p><%=boardDTO.getNoticeContent()%></p>
			<small>작성일: <%=boardDTO.getNoticeIssueDate()%></small>
		</div>
		
		<%
		if ("admin".equals(memberId)) {
		%>
		<div class="add-button">
			<button onclick="window.location.href='noticeUpdate.nbo?noticeNum=<%=boardDTO.getNoticeNum()%>'">공지 수정</button>
		</div>
		<div class="add-button">
			<button onclick="window.location.href='noticeDelete.nbo?noticeNum=<%=boardDTO.getNoticeNum()%>'">공지 삭제</button>
		</div> 
		<%
}
%>
		
	</div>
<jsp:include page="../../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</body>
</html>
