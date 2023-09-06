<%@page import="com.itwillbs.domain.ReviewBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
</head>
<body>
	<%
	String memberId = (String) session.getAttribute("memberId");
	ReviewBoardDTO reviewboardDTO = (ReviewBoardDTO) request.getAttribute("reviewboardDTO");
	%>
	<header>
		<h1>리뷰 작성</h1>
	</header>
	<div class="container">
		<form action="reviewWritePro.rbo?classNum=<%=reviewboardDTO.getClassNum() %>" method="post" enctype="multipart/form-data">
			<table id="review" border="1">
				<div class="form-group">
<!-- 					<label for="content">내용</label> -->
					<textarea placeholder="리뷰를 작성해주세요" name="reviewContent" rows="5" required></textarea>
				</div>
				<div class="form-group">
					<label for="file">사진첨부</label> <input type="file" name="reviewFile">
				</div>
				<input type="submit" value="작성" class="btn">
			</table>
		</form>
	</div>

</body>
</html>