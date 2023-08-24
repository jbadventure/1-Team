<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
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
String noticeSubject = request.getParameter("noticeSubject");
String noticeContent = request.getParameter("noticeContent");
int noticeReadcount = 0;
Timestamp noticeIssueDate = new Timestamp(System.currentTimeMillis());
int noticeNum = 1;

Class.forName("com.mysql.cj.jdbc.Driver");
String dbUrl="jdbc:mysql://itwillbs.com/c1d2304t1";
String dbUser="c1d2304t1";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
String sql2 = "select max(noticeNum) from board";
PreparedStatement pstmt2=con.prepareStatement(sql2);

ResultSet rs=pstmt2.executeQuery();

if(rs.next()){
	noticeNum=rs.getInt("max(noticeNum)")+1;
}
String sql = "insert into board(noticeNum, noticeSubject, noticeContent, noticeIssuedate, noticeReadcount) values(?,?,?,?,?)";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setInt(1, noticeNum);
pstmt.setString(2, noticeSubject);
pstmt.setString(3, noticeContent);
pstmt.setTimestamp(4,noticeIssueDate);
pstmt.setInt(5, noticeReadcount);

pstmt.executeUpdate();

response.sendRedirect("list.jsp");

%>

</body>
</html>