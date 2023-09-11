<%@page import="com.itwillbs.domain.ClassBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
  <link rel="stylesheet" href="shopcss.css">
  <link href="css/NewTop.css" rel="stylesheet" type="text/css">
  <link href="css/NewBottom.css" rel="stylesheet" type="text/css">
  <link href="css/reviewWrite.css" rel="stylesheet" type="text/css">
<!--   <link href="css/newfile.css" rel="stylesheet" type="text/css"> -->
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<meta charset="UTF-8">
<title>리뷰 작성</title>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../../inc/NewTop.jsp"></jsp:include>
<!-- 헤더들어가는 곳 --> 

	<%
	String memberId = (String) session.getAttribute("memberId");
	ClassBoardDTO boardDTO = (ClassBoardDTO) request.getAttribute("boardDTO");
	%>

		<h1 id="reviewwrite">리뷰 작성</h1>

	<div class="container">
		<form action="reviewWritePro.rbo?classNum=<%=boardDTO.getClassNum() %>" method="post" enctype="multipart/form-data">
			<table id="review" border="1">
				<div class="form-group1">
<!-- 					<label for="content">내용</label> -->
					<textarea placeholder="리뷰를 작성해주세요" name="reviewContent" rows="5" required></textarea>
				</div>
				<div class="form-group2">
					<label for="file">사진첨부</label> <input type="file" name="reviewFile">
				</div>
				<input type="submit" value="작성" class="reviewwritebtn">
			</table>
		</form>
	</div>
	
	
<!-- 푸터들어가는 곳 -->
<jsp:include page="../../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</body>
</html>