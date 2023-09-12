<%@page import="com.itwillbs.domain.OrdersDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="shopcss.css">
  <link href="css/NewTop.css" rel="stylesheet" type="text/css">
  <link href="css/NewBottom.css" rel="stylesheet" type="text/css">
  <link href="css/body.css" rel="stylesheet" type="text/css">
  <link href="css/myreservelist.css" rel="stylesheet" type="text/css">    
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<meta charset="UTF-8">
<title>my reservation</title>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../../inc/NewTop.jsp"></jsp:include>
<!-- 헤더들어가는 곳 --> 
<div id = bodycontainer>
<div id = content_frame>
<%
List<OrdersDTO> ordersList = (List<OrdersDTO>)request.getAttribute("ordersList");
%>
	<h1> 예약내역 </h1><br>
<%  for(int i=0; i<ordersList.size(); i++){
	OrdersDTO ordersDTO = ordersList.get(i); %>

	<div class="reservelist-box" style="opacity: 1; display: block;">

	<% if(ordersDTO.getClassFile() == null){ %>
                <img src="images/logo-198x66.png" class="content-image" width="141" height="83" style="margin-top: 20px; margin-left: 20px;">
    <% }else{ %>           
            	<img src="upload/<%=ordersDTO.getClassFile() %>" class="content-image" width="141" height="83" style="margin-top: 20px; margin-left: 20px;">
    <% } %>

	<div id="class-content" onclick="window.location.href='guestReserve.or?ordersNum=<%=ordersDTO.getOrdersNum() %>'">
		<table>
		<tr><td id="subject"><%=ordersDTO.getClassSubject() %></td></tr>
		<tr><td>예약날짜 <%=ordersDTO.getOrdersDate() %></td></tr>
		<tr><td>예약인원 <%=ordersDTO.getOrdersAmount() %></td></tr>
		</table>
<%-- 	<tr><td>클래스제목 <%=boardDTO.getClassSubject() %></td></tr> --%>
<%-- 	<tr><td>총 결제금액 <%=payDTO.getPayPrice() %></td></tr> --%>
<%-- 	<tr><td>결제일 <%=payDTO.getPayDate() %></td></tr> --%>
<%-- 	<tr><td>결제방법 <%=payDTO.getPayMethod() %></td></tr> --%>
	</div>
	<div id="class-content-l" >
	</div>
	</div>
<% } %>
</div>
</div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</body>
</html>