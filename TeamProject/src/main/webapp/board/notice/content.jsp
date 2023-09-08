<%@page import="com.itwillbs.domain.NoticeBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>content</title>
</head>
<link rel="stylesheet" href="./css/content.css">
<body>
	<header>
		
	</header>
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
</body>
</html>
