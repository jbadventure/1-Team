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
		<h1>공지사항 상세조회</h1>
	</header>
	<div class="container">
		<%
		NoticeBoardDTO boardDTO = (NoticeBoardDTO) request.getAttribute("boardDTO");
		%>
		<div class="notice">
			<tr>
				<td>글번호</td>
				<td><%=boardDTO.getNoticeNum()%></td>
			</tr>
			<h2><%=boardDTO.getNoticeSubject()%></h2>
			<p><%=boardDTO.getNoticeContent()%></p>
			<small>작성일: <%=boardDTO.getNoticeIssueDate()%></small>
		</div>
		<div class="add-button">
			<button onclick="window.location.href='noticeUpdate.nbo'">공지 수정</button>
		</div>
		<div class="add-button">
			<button onclick="window.location.href='noticeDelete.nbo'">공지 삭제</button>
		</div>
	</div>
</body>
</html>
