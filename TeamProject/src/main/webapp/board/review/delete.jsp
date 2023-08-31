<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
Class.forName("com.mysql.cj.jdbc.Driver");
String dbUrl="jdbc:mysql://itwillbs.com/c1d2304t1";
String dbUser="c1d2304t1";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
String sql = "delete from review where reviewNum=?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setInt(1, reviewNum);
pstmt.executeUpdate();
response.sendRedirect("list.jsp");

%>

</body>
</html>