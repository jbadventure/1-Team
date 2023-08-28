<%@page import="com.itwillbs.domain.NoticeBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
NoticeBoardDTO boardDTO = (NoticeBoardDTO)request.getAttribute("boardDTO");
%>
<h1>글수정</h1>
<form action="noticeUpdatePro.nbo" method="post">
<input type="hidden" name="noticeNum" value="<%=boardDTO.getNoticeNum()%>">
<table border = "1">
<tr><td>제목</td>
            <td><input type="text" name="noticeSubject" value="<%=boardDTO.getNoticeSubject() %>"></td></tr>
            <tr><td>글내용</td>
            <td><textarea name="noticeContent" rows="5" ><%=boardDTO.getNoticeContent() %></textarea></td></tr>
            <label for="date">수정일</label>
            <input type="date" id="date" name="noticeIssueDate" required>
        </div>
        <button type="submit">수정</button>
        </table>

</table>

</form>

</body>
</html>