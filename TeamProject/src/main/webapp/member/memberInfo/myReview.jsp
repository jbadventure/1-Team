<%@page import="com.itwillbs.domain.PageDTO"%>
<%@page import="com.itwillbs.domain.ReviewBoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

</style>
  <link rel="stylesheet" href="shopcss.css">
  <link href="css/NewTop.css" rel="stylesheet" type="text/css">
  <link href="css/NewBottom.css" rel="stylesheet" type="text/css">
  <link href="css/body.css" rel="stylesheet" type="text/css">
  <link href="css/myreservelist.css" rel="stylesheet" type="text/css"> 
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<meta charset="UTF-8">
<title>myReview.jsp</title>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../../inc/NewTop.jsp"></jsp:include>
<!-- 헤더들어가는 곳 --> 
<div id = bodycontainer>
<div id = content_frame>
	<%
List<ReviewBoardDTO> boardList = (List<ReviewBoardDTO>)request.getAttribute("boardList");
String memberId = (String)session.getAttribute("memberId");
PageDTO pageDTO = (PageDTO)request.getAttribute("pageDTO");
%>
		&nbsp;<h1 style="30px 0px 20px;">클래스 리뷰</h1><br>

		<%
for(int i=0; i<boardList.size(); i++){
	ReviewBoardDTO boardDTO = boardList.get(i);
	if (boardDTO.getReviewId().equals(memberId)) {
    %>
		<%-- <div class="review"
			onclick="window.location.href='reviewContent.rbo?reviewNum=<%=boardDTO.getReviewNum() %>'"> --%>

		<div class="reservelist-box" style="opacity: 1; display: block;">
		
		    <% if(boardDTO.getReviewFile() != null){ %>
		    <img src="upload/<%=boardDTO.getReviewFile() %>" class="content-image" width="141" height="83" style="margin-top: 20px; margin-left: 20px;">
		    <% } else { %>
		    <img src="images/logo-198x66.png" id="default_image" class="content-image" width="141" height="83" style="margin-top: 20px; margin-left: 20px;">
		    <% } %>    

		<div id="class-content" onclick="window.location.href='classContent.cbo?classNum=<%=boardDTO.getClassNum() %>'">
		<table>
			<tr><td>리뷰번호 : <%=boardDTO.getReviewNum() %></td></tr>
			<tr><td>클래스번호 : <%=boardDTO.getClassNum() %></td></tr>
			<tr><td>후기내용 : <%=boardDTO.getReviewContent() %></td></tr>
		</table>
		</div>
		<div id="class-content-l" >
		</div>
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
</div>
</div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</body>
</html> 