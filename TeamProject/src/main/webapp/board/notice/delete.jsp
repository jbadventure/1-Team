<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="images/favicon.ico?v=2" type="image/x-icon">
<meta charset="UTF-8">
<title>palette</title>
</head>
<body>
<%
int noticeNum = Integer.parseInt(request.getParameter("noticeNum"));
Class.forName("com.mysql.cj.jdbc.Driver");
String dbUrl="jdbc:mysql://itwillbs.com/c1d2304t1";
String dbUser="c1d2304t1";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
String sql = "delete from notice where noticeNum=?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setInt(1, noticeNum);
pstmt.executeUpdate();
response.sendRedirect("list.jsp");

%>
</body>
</html>