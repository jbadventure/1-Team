<%@page import="com.itwillbs.domain.PageDTO"%>
<%@page import="com.itwillbs.domain.ReviewBoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="shopcss.css">
  <link href="css/NewTop.css" rel="stylesheet" type="text/css">
  <link href="css/NewBottom.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="css/infoGuest.css">
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<meta charset="UTF-8">
<title>myReview.jsp</title>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../../inc/NewTop.jsp"></jsp:include>
<!-- 헤더들어가는 곳 --> 

	<%
List<ReviewBoardDTO> boardList = (List<ReviewBoardDTO>)request.getAttribute("boardList");
String memberId = (String)session.getAttribute("memberId");
PageDTO pageDTO = (PageDTO)request.getAttribute("pageDTO");
%>
		<h3>클래스 리뷰</h3>

	<div class="container">
		<%
for(int i=0; i<boardList.size(); i++){
	ReviewBoardDTO boardDTO = boardList.get(i);
	if (boardDTO.getReviewId().equals(memberId)) {
    %>
		<%-- <div class="review"
			onclick="window.location.href='reviewContent.rbo?reviewNum=<%=boardDTO.getReviewNum() %>'"> --%>

		<div class="reviewNum">
			리뷰번호 : <%=boardDTO.getReviewNum() %>
		</div>
		<div class="classNum">
			클래스번호 : <%=boardDTO.getClassNum() %>
		</div>
		<div class="reviewContent">
			후기내용 : <%=boardDTO.getReviewContent() %>
		</div><br>

		</div>
		<% 
	}
}
%>
<%-- 		<%
if(memberId != null) {
%>
		<div class="add-button">
			<button onclick="window.location.href='/TeamProject/reviewWrite.rbo'">
			리뷰 작성</button>
		</div>

	</div>
<%
}
%> --%>
     
<!-- 푸터들어가는 곳 -->
<jsp:include page="../../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</body>
</html> 