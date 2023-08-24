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
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        header {
            background-color: #35424a;
            color: white;
            padding: 10px;
            text-align: center;
        }
        .container {
            max-width: 800px;
            margin: auto;
            padding: 20px;
        }
        .notice {
            border: 1px solid #ccc;
            background-color: white;
            margin-bottom: 10px;
            padding: 10px;
            border-radius: 5px;
        }
        .notice h2 {
            margin-top: 0;
        }
         .add-button {
            text-align: center;
            margin-top: 20px;
        }
        .add-button button {
            background-color: #35424a;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
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
