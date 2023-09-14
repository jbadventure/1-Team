<%@page import="com.itwillbs.domain.NoticeBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="shopcss.css">
<link href="css/NewTop.css" rel="stylesheet" type="text/css">
<link href="css/NewBottom.css" rel="stylesheet" type="text/css">
<link href="css/loginbody.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css"
	rel="stylesheet">
<link rel="icon" href="images/favicon.ico?v=2" type="image/x-icon">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>palette</title>
</head>
<body>
<!-- 헤더들어가는 곳 -->
	<jsp:include page="../../inc/NewTop.jsp"></jsp:include>
	<!-- 헤더들어가는 곳 -->

<link rel="stylesheet" href="./css/noticeupdate.css">

	<%
NoticeBoardDTO boardDTO = (NoticeBoardDTO)request.getAttribute("boardDTO");
%>
	<div class="hhh"><h1>글수정</h1></div>
	<div class="container">
	<form action="noticeUpdatePro.nbo" method="post">
		<input type="hidden" name="noticeNum"
			value="<%=boardDTO.getNoticeNum()%>">
		<table border="1">
		<div class="title1">
            <label for="title">제목</label>
            <input type="text" id="title" name="noticeSubject" required>
        </div>
        <div class="content1">
            <label for="content">내용</label>
            <textarea id="content" name="noticeContent" rows="5" required></textarea>
        <button type="submit">수정</button>
        </div>
        </table>
    </form>
</div>
</body>
<jsp:include page="../../inc/bottom.jsp"></jsp:include>
</html>