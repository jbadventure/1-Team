<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="shopcss.css">
  <link href="css/NewTop.css" rel="stylesheet" type="text/css">
  <link href="css/NewBottom.css" rel="stylesheet" type="text/css">
  <link href="css/classWrite.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
  <meta charset="UTF-8">
<title>Class 등록</title>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../../inc/NewTop.jsp"></jsp:include>
<!-- 헤더들어가는 곳 -->
<%
String memberId = (String)session.getAttribute("memberId");
%>
	<h1 id="classwrite">Class 등록</h1>
	
	<form action="classWritePro.cbo" method="post" enctype="multipart/form-data">
		<table id="notice">
			<tr>
				<td>Class 제목</td>
				<td><input type="text" name="classSubject"></td>
			</tr>
			<tr>
				<td>Class 가격</td>
				<td><input type="text" name="classPrice"></td>
			</tr>
			<tr>
				<td>Class 카테고리</td>
				<td>
				<select style="width: 200px;" name="classCategory" class="form-control" required="required">
				<option value="요리" selected="selected">요리</option>
				<option value="수공예">수공예</option>
				<option value="액티비티">액티비티</option>
				</select></td>
			</tr>
			<tr>
				<td>Class 지역</td>
				<td>
				<select style="width: 200px;" name="classLocation" class="form-control" required="required">
				<option value="서울" selected="selected">서울</option>
				<option value="경기">경기</option>
				<option value="부산">부산</option>
				<option value="제주">제주</option>
				</select></td>
			</tr>
			<tr>
				<td>Class 소개</td>
				<td><textarea rows="10" cols="20" name="classContent"></textarea></td>
			</tr>
			<tr><td>대표 이미지</td>
			<td><input type="file" name="classFile"></td></tr>
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