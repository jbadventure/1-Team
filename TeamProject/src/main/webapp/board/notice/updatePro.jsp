<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
request.setCharacterEncoding("utf-8");

int noticeNum = Integer.parseInt(request.getParameter("noticeNum"));
String noticeSubject = request.getParameter("noticeSubject");
String noticeContent = request.getParameter("noticeContent");

Class.forName("com.mysql.cj.jdbc.Driver");
String dbUrl="jdbc:mysql://itwillbs.com/c1d2304t1";
String dbUser="c1d2304t1";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);

String sql = "update notice set noticeSubject=?, noticeContent=? where noticeNum=?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1,noticeSubject);
pstmt.setString(2,noticeContent);
pstmt.setInt(3,noticeNum);

pstmt.executeUpdate();
response.sendRedirect("list.jsp");
%>

</body>
</html>