<%@page import="com.itwillbs.domain.OrdersDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="shopcss.css">
  <link href="css/newfile.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<meta charset="UTF-8">
<title>my reservation</title>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../../inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 --> 
<%
List<OrdersDTO> ordersList = (List<OrdersDTO>)request.getAttribute("ordersList");
%>
	<h3> 예약내역 </h3>
<%
for(int i=0; i<ordersList.size(); i++){
	OrdersDTO ordersDTO = ordersList.get(i);
	%>
	<table id="class-content" onclick="window.location.href='guestReserve.or?ordersNum=<%=ordersDTO.getOrdersNum() %>'">
	<tr><td>예약번호 : <%=ordersDTO.getOrdersNum() %></td><td>| 예약 클래스 : <%=ordersDTO.getClassSubject() %></td><td>| 예약날짜 : <%=ordersDTO.getOrdersDate() %></td><td>| 예약인원 : <%=ordersDTO.getOrdersAmount() %></td><td>| 상세정보확인(클릭)</td></tr>
<%-- 	<tr><td>클래스제목 <%=boardDTO.getClassSubject() %></td></tr> --%>
<%-- 	<tr><td>총 결제금액 <%=payDTO.getPayPrice() %></td></tr> --%>
<%-- 	<tr><td>결제일 <%=payDTO.getPayDate() %></td></tr> --%>
<%-- 	<tr><td>결제방법 <%=payDTO.getPayMethod() %></td></tr> --%>
	</table>
<%
}
%>	
<!-- 푸터들어가는 곳 -->
<jsp:include page="../../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</body>
</html>