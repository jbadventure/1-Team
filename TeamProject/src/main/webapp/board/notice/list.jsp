
<%@page import="java.text.SimpleDateFormat"%>
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
<link rel="icon" href="images/favicon.ico?v=2" type="image/x-icon">
<link rel="stylesheet" href="shopcss.css">
<link href="css/NewTop.css" rel="stylesheet" type="text/css">
<link href="css/NewBottom.css" rel="stylesheet" type="text/css">
<link href="css/loginbody.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css"
	rel="stylesheet">
<meta charset="UTF-8">
<title>palette</title>
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
	<div class="container">
		&nbsp;<h1 style="30px 0px 20px;">공지사항</h1><br>

		<%
			for (int i = 0; i < boardList.size(); i++) {
				NoticeBoardDTO boardDTO = boardList.get(i);
			%>
			   
		<div class="notice" style="opacity: 1; display: block;">
			<%-- 				onclick="location.href='noticeContent.nbo?noticeNum=<%=boardDTO.getNoticeNum()%>'"> --%>
			<ul class="a1 items">
				<li class="notice-item"
					onclick="toggleItem('<%=boardDTO.getNoticeNum() %>')">
					<div class="a2">
						<div class="a3">공지</div>
						<div class="noticeNum">
							<input type="hidden" value="<%=boardDTO.getNoticeNum()%>">
						</div>
						<div class="a4"><%=boardDTO.getNoticeSubject()%></div>
						<div class="noticeContent">
							<input type="hidden" value="<%=boardDTO.getNoticeContent()%>">
						</div>
						<div class="date11"><%=boardDTO.getNoticeIssueDate()%>
						</div>
					</div>
					<div id="<%=boardDTO.getNoticeNum() %>" class="detail">
						<div class ="a5"> <p><%=boardDTO.getNoticeContent() %> </p>
							<%
		if ("admin".equals(memberId)) {
		%>
		<div class="add-button">
			<button class="boardbtn" onclick="window.location.href='noticeUpdate.nbo?noticeNum=<%=boardDTO.getNoticeNum()%>'">공지 수정</button>
		</div>
		<div class="add-button">
			<button  class="boardbtn"  onclick="window.location.href='noticeDelete.nbo?noticeNum=<%=boardDTO.getNoticeNum()%>'">공지 삭제</button>
		</div> </div>
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
			<button class="boardbtn" onclick="window.location.href='/TeamProject/noticeWrite.nbo'">공지 작성</button>
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
			href="noticeList.nbo?pageNum=<%=pageDTO.getStartPage() - pageDTO.getPageBlock()%>">Prev</a>
		<%
}
%>
		<%
			for (int i = pageDTO.getStartPage(); i <= pageDTO.getEndPage(); i++) {
			%>
		<a href="noticeList.nbo?pageNum=<%=i%>"><%=i%></a>
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

	<script type="text/javascript">
console.log('test');
	function toggleItem(detailId) {
		let detail = document.getElementById(detailId);
		if (detail.style.display === 'none' || detail.style.display === '') {
			detail.style.display = 'block';
			detail.classList.add('active');
		} else {
			detail.style.display='none'
				detail.classList.remove('active');
		}
	}
</script>
</body>
</html>
