<%@page import="com.itwillbs.domain.PageDTO"%>
<%@page import="com.itwillbs.domain.ReviewBoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="icon" href="images/favicon.ico?v=2" type="image/x-icon">
<meta charset="UTF-8">
<title>palette</title>
</head>
<body>
	<%
List<ReviewBoardDTO> boardList = (List<ReviewBoardDTO>)request.getAttribute("boardList");
String memberId = (String)session.getAttribute("memberId");
PageDTO pageDTO = (PageDTO)request.getAttribute("pageDTO");
%>
	<header>
		<h2>클래스 리뷰</h2>
	</header>
	<div class="container">
		<%
for(int i=0; i<boardList.size(); i++){
	ReviewBoardDTO boardDTO = boardList.get(i);
    %>
		<div class="review"
			onclick="window.location.href='reviewContent.rbo?reviewNum=<%=boardDTO.getReviewNum() %>'">

			<div class="reviewNum">
				리뷰번호 :
				<%=boardDTO.getReviewNum() %>
			</div>
			<div class="classNum">
				클래스번호 :
				<%=boardDTO.getClassNum() %>
			</div>
			<div class="reviewID">
				후기작성자 :
				<%=boardDTO.getReviewId() %>
			</div>
			<div class="reviewIssueDate">
          		작성일자 : <%=boardDTO.getReviewIssueDate() %>
     		</div>
			<div class="reviewContent">
				후기 내용 :
				<%=boardDTO.getReviewContent()%>
			</div>
			<div class="reviewFile" >
				첨부파일 :
				<%=boardDTO.getReviewFile()%>
			</div><br>

		</div>
		<%
		}
		%>
		<%
if(memberId != null) {
%>
		<div class="add-button">
			<button onclick="window.location.href='/TeamProject/reviewWrite.rbo'">
			리뷰 작성</button>
		</div>

	</div>

		<% 
}
%>

</body>
</html>