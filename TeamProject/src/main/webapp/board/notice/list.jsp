<%@page import="com.itwillbs.domain.NoticeBoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
        
    </style>
</head>
<link rel = "stylesheet" href = "./css/list.css">
<body>
<%
List<NoticeBoardDTO> boardList =(List<NoticeBoardDTO>)request.getAttribute("boarList");
%>
<header>
    <h1>공지사항</h1>
</header>
<div class="container">
<%
for(int i=0; i<boardList.size(); i++){
	NoticeBoardDTO boardDTO = boardList.get(i);
	%>
	<div class="notice" onclick="window.location.href='/TeamProject/noticeContent.nbo'">
        <h2><%=boardDTO.getNoticeSubject() %></h2>
        <p><%=boardDTO.getNoticeContent() %></p>
        <small>작성일: <%=boardDTO.getNoticeIssueDate() %></small>
    </div>
	
	<% 
	
}
%>
    <div class="add-button">
            <button onclick="window.location.href='/TeamProject/noticeWrite.nbo'">공지 작성</button>
        </div>
</div>

</body>
</html>
