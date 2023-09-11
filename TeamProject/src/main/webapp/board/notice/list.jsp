
<%@page import="com.itwillbs.domain.PageDTO"%>
<%@page import="com.itwillbs.domain.MemberDTO"%>
<%@page import="com.itwillbs.domain.NoticeBoardDTO"%>
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
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<meta charset="UTF-8">
<title>member/login.jsp</title>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../../inc/NewTop.jsp"></jsp:include>
<!-- 헤더들어가는 곳 --> 




		<link rel="stylesheet" href="./css/noticelist.css">

		<%
		List<NoticeBoardDTO> boardList = (List<NoticeBoardDTO>) request.getAttribute("boardList");
		;
		PageDTO pageDTO = (PageDTO) request.getAttribute("pageDTO");
		String memberId = (String) session.getAttribute("memberId");
		%>
		<div class="container11">
			<h1 class="h33">공지사항</h1>

			<%
			for (int i = 0; i < boardList.size(); i++) {
				NoticeBoardDTO boardDTO = boardList.get(i);
			%>
			<div class="notice11" style="opacity: 1; display: block;"
				onclick="location.href='noticeContent.nbo?noticeNum=<%=boardDTO.getNoticeNum()%>'">
				<ul class="a11">
					<li class="b11">
						<div class="a2">
							<div class="a3">공지</div>
							<div class="noticeNum">
								<input type="hidden" value="<%=boardDTO.getNoticeNum()%>">
							</div>
							<div class="a4"><%=boardDTO.getNoticeSubject()%></div>
							<div class="noticeContent">
								<input type="hidden" value="<%=boardDTO.getNoticeContent()%>">
							</div>
							<div class="date11"><%=boardDTO.getNoticeIssueDate()%></div>
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
				<button
					onclick="window.location.href='/TeamProject/noticeWrite.nbo'">공지
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

			<%
			//끝페이지번호  전체페이지수 비교 => 전체페이지수 크면 => Next보임
			if (pageDTO.getEndPage() < pageDTO.getPageCount()) {
			%>
			<a
				href="noticeList.nbo?pageNum=<%=pageDTO.getStartPage() + pageDTO.getPageBlock()%>">Next</a>
			<%
			}
			%>
		</div>
<jsp:include page="../../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</body>
</html>
