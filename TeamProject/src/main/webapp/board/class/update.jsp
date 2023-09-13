<%@page import="com.itwillbs.domain.ClassBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="images/favicon.ico?v=2" type="image/x-icon">
  <link rel="stylesheet" href="shopcss.css">
  <link href="css/NewTop.css" rel="stylesheet" type="text/css">
  <link href="css/NewBottom.css" rel="stylesheet" type="text/css">
  <link href="css/classUpdate.css?ver=1.1" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<meta charset="UTF-8">
<title>palette</title>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../../inc/NewTop.jsp"></jsp:include>
<!-- 헤더들어가는 곳 --> 

<%
ClassBoardDTO boardDTO = (ClassBoardDTO)request.getAttribute("boardDTO");
%>
	<h1>Class 수정</h1>
	
	<form action="classUpdatePro.cbo" method="post">
		<input type="hidden" name="classNum" value="<%=boardDTO.getClassNum() %>" readonly>
		<table id="notice">
			<tr>
				<td>제목</td>
				<td><input type="text" name="classSubject" id="box" value="<%=boardDTO.getClassSubject() %>"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="classPrice" id="box" value="<%=boardDTO.getClassPrice() %>"></td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td>
				<select style="width: 390px;" name="classCategory" value="<%=boardDTO.getClassCategory()%>" class="form-control" required="required">
				<option value="요리" selected="selected">요리</option>
				<option value="수공예">수공예</option>
				<option value="액티비티">액티비티</option>
				</select></td>
			</tr>
			<tr>
				<td>지역</td>
				<td>
				<select style="width: 390px;" name="classLocation" value="<%=boardDTO.getClassLocation() %>" class="form-control" required="required">
				<option value="서울" selected="selected">서울</option>
				<option value="경기">경기</option>
				<option value="부산">부산</option>
				<option value="제주">제주</option>
				</select></td>
			</tr>
			<tr>
				<td>소개</td>
				<td><textarea rows="20" cols="40" class="classContent" name="classContent"><%=boardDTO.getClassContent() %></textarea></td>
			</tr>
			<tr><td>대표 이미지</td>
			<td><input type="file" name="classFile">
			    <input type="hidden" name="oldclassFile" value="<%=boardDTO.getClassFile()%>"><br>
			    <%=boardDTO.getClassFile()%></td></tr>
		</table>
		<div id="table_search">
			<input type="submit" value="글쓰기" class="classwritebtn">
		</div>
	</form>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</body>
</html>