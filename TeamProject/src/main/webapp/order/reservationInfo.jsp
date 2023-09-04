<%@page import="com.itwillbs.domain.OrdersDTO"%>
<%@page import="com.itwillbs.domain.ClassBoardDTO"%>
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
request.setCharacterEncoding("utf-8");
OrdersDTO ordersDTO = (OrdersDTO)request.getAttribute("ordersDTO"); 
String classSubject = (String)session.getAttribute("classSubject");

// String classSubject = request.getParameter("classSubject");
// int classPrice = Integer.parseInt(request.getParameter("classPrice"));
// int reservationNum = Integer.parseInt(request.getParameter("reservationNum"));
// String reservationId = request.getParameter("reservationId");
// String reservationDate = request.getParameter("reservationDate");
// int reservationAmount = Integer.parseInt(request.getParameter("reservationAmount"));
// String payDate = request.getParameter("payDate");
// String payMethod = request.getParameter("payMethod");
// // int payPrice = classPrice*reservationAmount;
%>

<table id="class-content">
<tr><td><h4> 예약정보를 확인하세요 </h4></td></tr>
<tr><td>결제번호 <%=ordersDTO.getOrdersNum() %></td></tr>
<tr><td>결제아이디 <%=ordersDTO.getOrdersId() %></td></tr>
<tr><td>클래스제목 <%=classSubject %></td></tr>
<tr><td>예약날짜 <%=ordersDTO.getOrdersDate() %></td></tr>
<tr><td>예약인원 <%=ordersDTO.getOrdersAmount() %></td></tr>
<tr><td>총 결제금액 <%=ordersDTO.getTotalPrice() %></td></tr>
<tr><td>결제일시 <%=ordersDTO.getPayDate() %></td></tr>
<tr><td>결제방법 <%=ordersDTO.getPayMethod() %></td></tr>
</table>
<br>
<button onclick = "location.href='main.me'">메인으로이동</button><br>
클래스목록으로돌아가기 <br>

</body>
</html>