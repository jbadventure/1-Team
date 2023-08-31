<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>예약완료되었습니다!</h3>
<%
String memberId = (String)session.getAttribute("memberId");
%>
<%
request.setCharacterEncoding("utf-8");
String classSubject = request.getParameter("classSubject");
int classPrice = Integer.parseInt(request.getParameter("classPrice"));
int reservationNum = Integer.parseInt(request.getParameter("reservationNum"));
String reservationId = request.getParameter("reservationId");
String reservationDate = request.getParameter("reservationDate");
int reservationAmount = Integer.parseInt(request.getParameter("reservationAmount"));
String payDate = request.getParameter("payDate");
String payMethod = request.getParameter("payMethod");
// int payPrice = classPrice*reservationAmount;
%>

<table id="class-content">
<tr><td><h4> 예약정보를 확인하세요 </h4></td></tr>
<tr><td>예약번호 <%=reservationNum %></td></tr>
<tr><td>예약아이디 <%=reservationId %></td></tr>
<tr><td>클래스제목 <%=classSubject %></td></tr>
<tr><td>예약날짜 <%=reservationDate %></td></tr>
<tr><td>예약인원 <%=reservationAmount %></td></tr>
<%-- <tr><td>총 결제금액 <%=payPrice %></td></tr> --%>
<tr><td>결제일 <%=payDate %></td></tr>
<tr><td>결제방법 <%=payMethod %></td></tr>
</table>
<br>
나의예약리스트보기버튼 <br> 
클래스목록으로돌아가기 <br>


</body>
</html>