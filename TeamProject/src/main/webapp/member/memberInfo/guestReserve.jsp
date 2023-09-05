<%@page import="com.itwillbs.domain.OrdersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>예약상세정보</h3>
<%
request.setCharacterEncoding("utf-8");
OrdersDTO ordersDTO = (OrdersDTO)request.getAttribute("ordersDTO"); 
%>

<table id="class-content">
<tr><td><h4> <%=ordersDTO.getOrdersId() %>님의 예약정보를 확인하세요 </h4></td></tr>
<tr><td>결제번호 <%=ordersDTO.getOrdersNum() %></td></tr>
<tr><td>클래스제목 <%=ordersDTO.getClassSubject() %></td></tr>
<tr><td>예약날짜 <%=ordersDTO.getOrdersDate() %></td></tr>
<tr><td>예약인원 <%=ordersDTO.getOrdersAmount() %></td></tr>
<tr><td>총 결제금액 <%=ordersDTO.getTotalPrice() %></td></tr>
<tr><td>결제일시 <%=ordersDTO.getPayDate() %></td></tr>
<tr><td>결제방법 <%=ordersDTO.getPayMethod() %></td></tr>
</table>
<br>
<button onclick = "location.href='myReserveList.or'"> 나의예약리스트보기버튼 <br> 

</body>
</html>