
<%@page import="com.itwillbs.domain.PageDTO"%>
<%@page import="com.itwillbs.domain.MemberDTO"%>
<%@page import="com.itwillbs.domain.NoticeBoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
</style>
</head>
<link rel="stylesheet" href="./css/noticelist.css">
<body>
	<%
	List<NoticeBoardDTO> boardList = (List<NoticeBoardDTO>) request.getAttribute("boardList");
	;
	String memberId = (String) session.getAttribute("memberId");
	PageDTO pageDTO = (PageDTO) request.getAttribute("pageDTO");
	%>
	<header> </header>
	<div class="container">
		<h1>공지사항</h1>

		<%
		for (int i = 0; i < boardList.size(); i++) {
			NoticeBoardDTO boardDTO = boardList.get(i);
		%>
		<div class="notice" style="opacity: 1; display: block;"
			onclick="location.href='noticeContent.nbo?noticeNum=<%=boardDTO.getNoticeNum()%>'">
			<ul class="a1">
				<li>
					<div class="a2">
						<div class="a3">공지</div>
						<div class="noticeNum">
							<input type="hidden" value="<%=boardDTO.getNoticeNum()%>">
						</div>
						<div class="a4"><%=boardDTO.getNoticeSubject()%></div>
						<div class="noticeContent">
							<input type="hidden" value="<%=boardDTO.getNoticeContent()%>">
						</div>
						<div class="date"><%=boardDTO.getNoticeIssueDate()%></div>
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
			<button onclick="window.location.href='/TeamProject/noticeWrite.nbo'">공지
				작성</button>
		</div>
		<%
}
%>
		<%
		// 시작페이지 1페이지 prev 없음
		if (pageDTO.getStartPage() > pageDTO.getPageBlock()) {
		%>
		<a
			href="noticeList.qbo?pageNum=<%=pageDTO.getStartPage() - pageDTO.getPageBlock()%>">Prev</a>
		<%
}
%>
		<%
		for (int i = pageDTO.getStartPage(); i <= pageDTO.getEndPage(); i++) {
		%>
		<a href="noticeList.qbo?pageNum=<%=i%>"><%=i%></a>
		<%
		}
		%>
	</div>

</body>
</html>
