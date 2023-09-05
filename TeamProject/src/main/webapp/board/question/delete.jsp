<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete</title>
</head>
<body>
	<%
int questionNum = Integer.parseInt(request.getParameter("questionNum"));
Class.forName("com.mysql.cj.jdbc.Driver");
String dbUrl="jdbc:mysql://itwillbs.com/c1d2304t1";
String dbUser="c1d2304t1";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
String sql = "delete from notice where questionNum=?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setInt(1, questionNum);
pstmt.executeUpdate();
response.sendRedirect("list.jsp");

%>
</body>
</html>