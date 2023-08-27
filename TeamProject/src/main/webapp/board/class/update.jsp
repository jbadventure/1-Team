<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Class 수정</title>
</head>
<body>
<%
String memberId = (String)session.getAttribute("memberId");
%>
	<h1>Class 수정</h1>
	
	<form action="classUpdatePro.cbo" method="post">
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
				<option value="야외/체험" selected="selected">야외/체험</option>
				<option value="만들기">만들기</option>
				<option value="강의">강의</option>
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
		</table>
		<div id="table_search">
			<input type="submit" value="글쓰기" class="btn">
		</div>
	</form>

</body>
</html>